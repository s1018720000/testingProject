package com.as.quartz.controller;

import com.as.common.annotation.Log;
import com.as.common.core.controller.BaseController;
import com.as.common.core.domain.AjaxResult;
import com.as.common.core.page.TableDataInfo;
import com.as.common.enums.BusinessType;
import com.as.common.utils.StringUtils;
import com.as.common.utils.poi.ExcelUtil;
import com.as.quartz.domain.MoniElastic;
import com.as.quartz.domain.MoniElasticLog;
import com.as.quartz.service.IMoniElasticLogService;
import com.as.quartz.service.IMoniElasticService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * ElasticSearch任务LOGController
 *
 * @author kolin
 * @date 2021-07-28
 */
@Controller
@RequestMapping("/monitor/elasticJobLog")
public class MoniElasticLogController extends BaseController {
    private String prefix = "monitor/elasticJob";

    @Autowired
    private IMoniElasticLogService moniElasticLogService;

    @Autowired
    private IMoniElasticService moniElasticService;

    @RequiresPermissions("monitor:elasticJobLog:view")
    @GetMapping()
    public String elasticJob(@RequestParam(value = "jobId", required = false) Long jobId, ModelMap mmap) {
        if (StringUtils.isNotNull(jobId)) {
            MoniElastic job = moniElasticService.selectMoniElasticById(jobId);
            mmap.put("job", job);
        }
        return prefix + "/elasticJobLog";
    }

    /**
     * 查询ElasticSearch任务LOG列表
     */
    @RequiresPermissions("monitor:elasticJobLog:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(MoniElasticLog moniElasticLog) {
        startPage();
        List<MoniElasticLog> list = moniElasticLogService.selectMoniElasticLogList(moniElasticLog);
        return getDataTable(list);
    }

    /**
     * 导出ElasticSearch任务LOG列表
     */
    @RequiresPermissions("monitor:elasticJobLog:export")
    @Log(title = "ElasticSearch任务LOG", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(MoniElasticLog moniElasticLog) {
        List<MoniElasticLog> list = moniElasticLogService.selectMoniElasticLogList(moniElasticLog);
        ExcelUtil<MoniElasticLog> util = new ExcelUtil<MoniElasticLog>(MoniElasticLog.class);
        return util.exportExcel(list, "ElasticSearch任务LOG数据");
    }

    /**
     * 删除ElasticSearch任务LOG
     */
    @RequiresPermissions("monitor:elasticJobLog:remove")
    @Log(title = "ElasticSearch任务LOG", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(moniElasticLogService.deleteMoniElasticLogByIds(ids));
    }

    /**
     * 清空日志
     *
     * @return
     */
    @Log(title = "ElasticSearch任务LOG", businessType = BusinessType.CLEAN)
    @RequiresPermissions("monitor:elasticJobLog:clear")
    @PostMapping("/clean")
    @ResponseBody
    public AjaxResult clean() {
        moniElasticLogService.cleanElasticJobLog();
        return success();
    }
}
