package com.as.quartz.job;

import com.as.common.config.ASConfig;
import com.as.common.constant.Constants;
import com.as.common.constant.DictTypeConstants;
import com.as.common.constant.ScheduleConstants;
import com.as.common.utils.DateUtils;
import com.as.common.utils.DictUtils;
import com.as.common.utils.ExceptionUtil;
import com.as.common.utils.StringUtils;
import com.as.common.utils.spring.SpringUtils;
import com.as.quartz.domain.MoniJob;
import com.as.quartz.domain.MoniJobLog;
import com.as.quartz.service.IMoniJobLogService;
import com.as.quartz.service.ISysJobService;
import com.as.quartz.util.AbstractQuartzJob;
import com.as.quartz.util.HtmlTemplateUtil;
import com.pengrad.telegrambot.TelegramBot;
import com.pengrad.telegrambot.model.request.InlineKeyboardButton;
import com.pengrad.telegrambot.model.request.InlineKeyboardMarkup;
import com.pengrad.telegrambot.model.request.ParseMode;
import com.pengrad.telegrambot.request.SendPhoto;
import com.pengrad.telegrambot.response.SendResponse;
import gui.ava.html.image.generator.HtmlImageGenerator;
import org.quartz.DisallowConcurrentExecution;
import org.quartz.JobExecutionContext;
import org.quartz.PersistJobDataAfterExecution;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;

import javax.sql.DataSource;
import java.io.File;
import java.util.Date;
import java.util.Map;
import java.util.Objects;

/**
 * SQL检测任务执行类（禁止并发执行）
 *
 * @author kolin
 */
@PersistJobDataAfterExecution
@DisallowConcurrentExecution
public class MoniJobExecution extends AbstractQuartzJob {
    private static final Logger log = LoggerFactory.getLogger(MoniJobExecution.class);

    /**
     * 创建任务名时使用的前缀，如SQL-JOB-1
     */
    private static final String JOB_CODE = "SQL-JOB";

    private static final String DETAIL_URL = "/monitor/sqlJobLog/detail/";

    private final MoniJobLog moniJobLog = new MoniJobLog();

    private MoniJob moniJob = new MoniJob();

    /**
     * 执行方法
     *
     * @param context 工作执行上下文对象
     * @param job     系统计划任务
     * @throws Exception 执行过程中的异常
     */
    @Override
    protected void doExecute(JobExecutionContext context, Object job) throws Exception {
        Map<String, JdbcTemplate> jdbcMap = SpringUtils.getBean(ISysJobService.class).getJdbcMap();
        SqlRowSet rowSet = jdbcMap.get(moniJob.getJdbc().trim()).queryForRowSet(moniJob.getScript());
        String exeResult = getResultTable(rowSet);
        log.info("执行结果:{}", exeResult);
        moniJobLog.setExecuteResult(exeResult);
//        if (resultIsExist(exeResult, moniJob.getId())) {
        //没有重复发生的LOG
        if (ScheduleConstants.MATCH_NO_NEED.equals(moniJob.getAutoMatch())) {
            moniJobLog.setStatus(Constants.SUCCESS);
            moniJobLog.setAlertStatus(Constants.FAIL);
        } else if (doMatch(rowSet, moniJob)) {
            moniJobLog.setStatus(Constants.SUCCESS);
            moniJobLog.setAlertStatus(Constants.FAIL);
        } else {
            moniJobLog.setStatus(Constants.FAIL);
            moniJobLog.setAlertStatus(Constants.SUCCESS);

            //关联导出


            //发送告警
            if (Constants.SUCCESS.equals(moniJob.getTelegramAlert())) {
                SendResponse sendResponse = sendTelegram(moniJob, moniJobLog);
                if (!sendResponse.isOk()) {
                    moniJobLog.setStatus(Constants.ERROR);
                    moniJobLog.setExceptionLog("Telegram send photo error: ".concat(sendResponse.description()));
                }
            }
        }
//        } else {
//            moniJobLog.setStatus(Constants.FAIL);
//            moniJobLog.setAlertStatus(Constants.FAIL);
//        }
    }

    /**
     * 任务执行前方法，在doExecute()方法前执行
     *
     * @param context 工作执行上下文对象
     */
    @Override
    protected void before(JobExecutionContext context, Object job) {
        moniJob = (MoniJob) job;
        moniJobLog.setStartTime(new Date());
        moniJobLog.setJobId(moniJob.getId());
        moniJobLog.setExpectedResult(moniJob.getExpectedResult());
        //此处先插入一条日志以获取日志id，方便告警拼接url使用
        SpringUtils.getBean(IMoniJobLogService.class).addJobLog(moniJobLog);
//        moniJob.getLastAlert().equals("");
        //输出日志
        log.info("任务 ID:{},任务名称:{},准备执行",
                moniJob.getId(), moniJob.getChName());
    }

    /**
     * 执行后方法，在doExecute()方法后执行
     *
     * @param context 工作执行上下文对象
     * @param job     系统计划任务
     */
    @Override
    protected void after(JobExecutionContext context, Object job, Exception e) {
        if (e != null) {
            moniJobLog.setStatus(Constants.ERROR);
            moniJobLog.setAlertStatus(Constants.FAIL);
            moniJobLog.setExceptionLog(ExceptionUtil.getExceptionMessage(e));
        }
    }

    /**
     * finally中执行方法
     *
     * @param context 工作执行上下文对象
     * @param job     系统计划任务
     */
    @Override
    protected void doFinally(JobExecutionContext context, Object job) {
        moniJobLog.setEndTime(new Date());
        long runTime = (moniJobLog.getEndTime().getTime() - moniJobLog.getStartTime().getTime()) / 1000;
        moniJobLog.setExecuteTime(runTime);
        moniJobLog.setOperator("system");

        //之前已经插入,本次更新日志到数据库中
        SpringUtils.getBean(IMoniJobLogService.class).updateJobLog(moniJobLog);
        //输出日志
        log.info("任务 ID:{},任务名称:{},开始时间:{},结束时间:{},执行结束,耗时：{}秒,执行状态:{}",
                moniJob.getId(), moniJob.getChName(), DateUtils.parseDateToStr(DateUtils.YYYY_MM_DD_HH_MM_SS, moniJobLog.getStartTime()),
                DateUtils.parseDateToStr(DateUtils.YYYY_MM_DD_HH_MM_SS, moniJobLog.getEndTime()), runTime, moniJobLog.getStatus());
    }

    /**
     * 将执行结果封装成HTML表格
     *
     * @param rowSet
     * @return
     */
    private String getResultTable(SqlRowSet rowSet) {
        String field;
        Object obj;
        StringBuilder builder = new StringBuilder();

        //取得栏位名
        String[] fields = rowSet.getMetaData().getColumnNames();

        //拼接表头
        builder.append("<table class=\"data_table\"><thead><tr>");
        for (int i = 0; i < fields.length; i++) {
            builder.append("<th>").append(fields[i]).append("</th>");
        }
        builder.append("</tr></thead>");

        // 拼接数据资料
        builder.append("<tbody>");
        while (rowSet.next()) {
            builder.append("<tr>");
            for (int j = 0; j < fields.length; j++) {
                obj = rowSet.getObject(fields[j]);

                //          將查詢結果格式化
                //          1.Null : -
                //          2.String :
                //          3.Date : yyyy-MM-dd HH:mm:ss
                //          4.Boolean : true, false
                //          5.BigDecimal : -
                if (obj == null) {
                    field = "-";
                } else if (obj instanceof String) {
                    field = obj.toString();
                } else if (obj instanceof Date) {
                    field = DateUtils.parseDateToStr(DateUtils.YYYY_MM_DD_HH_MM_SS, (Date) obj);
                } else if (obj instanceof Boolean) {
                    field = ((Boolean) obj).toString();
                } else {
                    field = obj.toString();
                }
                builder.append("<td>").append(field).append("</td>");
            }
            builder.append("</tr>");
            //数据超过60000则省略
            if (builder.length() > 30000) {
                builder.append("<tr><td colspan=\"").append(fields.length).append("\">More data can not be showed......</td></tr>");
                break;
            }
        }
        builder.append("</tbody></table>");

        return builder.toString();
    }

    /**
     * 检测是否存在相同结果日志
     *
     * @param result
     * @param jobId
     * @return
     */
    private boolean resultIsExist(String result, Long jobId) {
        try {
            DataSource masterDataSource = SpringUtils.getBean("masterDataSource");
            String sql = "SELECT COUNT(*) FROM MONI_JOB_LOG WHERE EXECUTE_RESULT = ? AND JOB_ID = ? AND START_TIME > DATE_SUB(NOW(), INTERVAL 1 DAY)";
            JdbcTemplate jdbcTemplateMysql = new JdbcTemplate(masterDataSource);
            int row = jdbcTemplateMysql.queryForObject(sql, new Object[]{result, jobId}, Integer.class);
            return row == 0;
        } catch (Exception e) {
            return true;
        }
    }

    /**
     * 比对获取结果与预期结果
     *
     * @throws Exception
     */
    private boolean doMatch(SqlRowSet rowSet, MoniJob moniJob) throws Exception {

        String autoMatch = moniJob.getAutoMatch();
        String[] expected = moniJob.getExpectedResult().split("@");
        Double expectedDouble;
        Double resultDouble;
        Object field;

        //获取栏位名
        String[] fields = rowSet.getMetaData().getColumnNames();

        //将游标移动到第一行
        rowSet.first();

        //基本比对
        if ((ScheduleConstants.MATCH_GREATER.equals(autoMatch) || ScheduleConstants.MATCH_LESS.equals(autoMatch))
                && (fields.length != 1 || expected.length != 1)) {
            //栏位不止一格却做大于或小于比对，直接返回false
            moniJobLog.setExpectedResult(moniJobLog.getExpectedResult().concat("\n(栏位或预期结果不止一个,无法做大于和小于比对\n\"Greater than\" and \"Less than\" operator only effect in number format and only one field.)"));
            return false;
        } else if (expected.length != fields.length
                && (ScheduleConstants.MATCH_EQUAL.equals(autoMatch)
                || ScheduleConstants.MATCH_NOT_EQUAL.equals(autoMatch))) {
            //等于不等于比较，栏位数量不等于预期结果数量，直接返回false
            moniJobLog.setExpectedResult(moniJobLog.getExpectedResult().concat("\n(栏位或预期结果数量不相等,无法做不等于和等于比对\nThe number of fields and expected result are not equal,cant do \"unequal\" and \"equal\".)"));
            return false;
        }

        //大于比对
        if (ScheduleConstants.MATCH_GREATER.equals(autoMatch)) {
            moniJobLog.setExpectedResult("Execute Result Greater than [".concat(moniJobLog.getExpectedResult()).concat("]"));
            expectedDouble = Double.valueOf(expected[0]);
            do {
                resultDouble = Double.valueOf(Objects.requireNonNull(rowSet.getString(fields[0])));
                if (resultDouble.compareTo(expectedDouble) != 1) {
                    return false;
                }
            } while (rowSet.next());
            return true;
        }

        //小于比对
        if (ScheduleConstants.MATCH_LESS.equals(autoMatch)) {
            moniJobLog.setExpectedResult("Execute Result Less than [".concat(moniJobLog.getExpectedResult()).concat("]"));
            expectedDouble = Double.valueOf(expected[0]);
            do {
                resultDouble = Double.valueOf(Objects.requireNonNull(rowSet.getString(fields[0])));
                if (resultDouble.compareTo(expectedDouble) != -1) {
                    return false;
                }
            }
            while (rowSet.next());
            return true;
        }

        // 等于比对
        if (ScheduleConstants.MATCH_EQUAL.equals(autoMatch)) {
            moniJobLog.setExpectedResult("Execute Result Equal to [".concat(moniJobLog.getExpectedResult()).concat("]"));
            do {
                for (int i = 0; i < fields.length; i++) {
                    field = rowSet.getObject(fields[i]) != null ? Objects.requireNonNull(rowSet.getObject(fields[i])).toString() : "";
                    if (!expected[i].equals(field)) {
                        return false;
                    }
                }
            }
            while (rowSet.next());
            return true;
        }

        //	不等于比对
        if (ScheduleConstants.MATCH_NOT_EQUAL.equals(autoMatch)) {
            moniJobLog.setExpectedResult("Execute Result not Equal to [".concat(moniJobLog.getExpectedResult()).concat("]"));
            do {
                for (int i = 0; i < fields.length; i++) {
                    field = rowSet.getObject(fields[i]) != null ? Objects.requireNonNull(rowSet.getObject(fields[i])).toString() : "";
                    if (expected[i].equals(field)) {
                        return false;
                    }
                }
            } while (rowSet.next());
            return true;
        }

        // 无资料
        if (ScheduleConstants.MATCH_EMPTY.equals(autoMatch)) {
            moniJobLog.setExpectedResult("Execute Result is empty");
            return rowSet.getRow() == 0;
        }

        // 有资料
        if (ScheduleConstants.MATCH_NOT_EMPTY.equals(autoMatch)) {
            moniJobLog.setExpectedResult("Execute Result is not empty");
            return rowSet.getRow() != 0;
        }

        //若是沒有進行到比對代表有問題，需拋出例外。
        throw new Exception("Never do match function");
    }

//    /**
//     * 关联导出
//     * @param jobService
//     * @param relExport
//     */
//    private void DoExport(IJobService jobService, String relExport) {
//        if (relExport != null && relExport.length() > 0) {
//            JobManager jobManager = jobService.getJobManager();
//
//            jobManager.addMoniExportByIds(relExport);
//        }
//    }

    private SendResponse sendTelegram(MoniJob moniJob, MoniJobLog moniJobLog) throws Exception {
        String telegramConfig = DictUtils.getDictRemark(DictTypeConstants.TELEGRAM_NOTICE_GROUP, moniJob.getTelegramConfig());
        if (StringUtils.isEmpty(telegramConfig)) {
            //若是沒有设置telegram通知群组,则抛出例外
            throw new Exception("Cant find any telegram group setting");
        }
        String[] tgData = telegramConfig.split(";");
        if (tgData.length != 2) {
            //若是数量不等于2，则配置错误
            throw new Exception("telegram group Configuration error, please check");
        }
        String telegramInfo = moniJob.getTelegramInfo();
        telegramInfo = telegramInfo.replace("{id}", String.valueOf(moniJobLog.getJobId()))
                .replace("{asid}", moniJob.getAsid())
                .replace("{priority}", moniJob.getPriority() == "1" ? "NU" : "URG")
                .replace("{zh_name}", moniJob.getChName())
                .replace("{en_name}", moniJob.getEnName())
                .replace("{platform}", DictUtils.getDictLabel(DictTypeConstants.UB8_PLATFORM_TYPE, moniJob.getPlatform()))
                .replace("{descr}", moniJob.getDescr())
                .replace("{result}", "Execution Results do not match expected result");
        TelegramBot telegramBot = new TelegramBot(tgData[0]);

//        SendMessage request = new SendMessage(tgData[1], telegramInfo).parseMode(ParseMode.Markdown);
        String imgPath = createImg(moniJob, moniJobLog);
        SendPhoto sendPhoto = new SendPhoto(tgData[1], new File(imgPath));
        sendPhoto.caption(telegramInfo).parseMode(ParseMode.Markdown);
        InlineKeyboardMarkup inlineKeyboard = new InlineKeyboardMarkup(
                new InlineKeyboardButton("View log details in webpage").url(ASConfig.getAsDomain().concat(DETAIL_URL).concat(String.valueOf(moniJobLog.getId()))));
        sendPhoto.replyMarkup(inlineKeyboard);
        SendResponse response = telegramBot.execute(sendPhoto);
        return response;
    }

    private String createImg(MoniJob moniJob, MoniJobLog moniJobLog) {
        String htmlContent = HtmlTemplateUtil.getHtmlContent("/sqlJob.html.vm");
        String path = null;
        if (StringUtils.isNotEmpty(htmlContent)) {
            try {
                //替换模板数据
                htmlContent = htmlContent.replace("{descr}", moniJob.getDescr())
                        .replace("{startTime}", DateUtils.parseDateToStr(DateUtils.YYYY_MM_DD_HH_MM_SS, moniJobLog.getStartTime()))
                        .replace("{expectedResult}", moniJobLog.getExpectedResult())
                        .replace("{executeResult}", moniJobLog.getExecuteResult());
                HtmlImageGenerator imageGenerator = new HtmlImageGenerator();
                imageGenerator.loadHtml(htmlContent);
                imageGenerator.getBufferedImage();
                path = HtmlTemplateUtil.getPath(DateUtils.datePath() + "/" + DateUtils.dateTimeNow() + ".png");
                imageGenerator.saveAsImage(path);
            } catch (Exception e) {
                log.error("创建图片发生异常", e);
            }
        }
        return path;
    }

    /**
     * 使用toString方法构建任务名
     *
     * @return
     */
    @Override
    public String toString() {
        return JOB_CODE + "-" + id;
    }


    /**
     * 静态方法，获取一个任务执行对象
     *
     * @param moniJob
     * @return
     */
    public static MoniJobExecution buildJob(MoniJob moniJob) {
        MoniJobExecution moniJobExecution = new MoniJobExecution();
        moniJobExecution.setId(String.valueOf(moniJob.getId()));
        moniJobExecution.setCronExpression(moniJob.getCronExpression());
        moniJobExecution.setStatus(moniJob.getStatus());
        moniJobExecution.setJobPlatform(moniJob.getPlatform());
        moniJobExecution.setJobContent(moniJob);
        return moniJobExecution;
    }

}
