package com.as.quartz.controller;

import com.as.common.annotation.Log;
import com.as.common.config.ASConfig;
import com.as.common.core.controller.BaseController;
import com.as.common.core.domain.AjaxResult;
import com.as.common.core.page.TableDataInfo;
import com.as.common.enums.BusinessType;
import com.as.common.utils.StringUtils;
import com.as.common.utils.file.FileUtils;
import com.as.common.utils.poi.ExcelUtil;
import com.as.quartz.domain.MoniExport;
import com.as.quartz.domain.MoniExportLog;
import com.as.quartz.service.IMoniExportLogService;
import com.as.quartz.service.IMoniExportService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 自动报表任务LOGController
 *
 * @author kolin
 * @date 2021-07-23
 */
@Controller
@RequestMapping("/monitor/exportJobLog")
public class MoniExportLogController extends BaseController {

    private static final Logger log = LoggerFactory.getLogger(MoniExportLogController.class);
    private String prefix = "monitor/exportJob";

    @Autowired
    private IMoniExportLogService moniExportLogService;

    @Autowired
    private IMoniExportService moniExportService;

    @RequiresPermissions("monitor:exportJobLog:view")
    @GetMapping()
    public String exportJob(@RequestParam(value = "jobId", required = false) Long jobId, ModelMap mmap) {
        if (StringUtils.isNotNull(jobId)) {
            MoniExport job = moniExportService.selectMoniExportById(jobId);
            mmap.put("job", job);
        }
        return prefix + "/exportJobLog";
    }

    /**
     * 查询自动报表任务LOG列表
     */
    @RequiresPermissions("monitor:exportJobLog:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(MoniExportLog moniExportLog) {
        startPage();
        List<MoniExportLog> list = moniExportLogService.selectMoniExportLogList(moniExportLog);
        return getDataTable(list);
    }

    /**
     * 导出自动报表任务LOG列表
     */
    @RequiresPermissions("monitor:exportJobLog:export")
    @Log(title = "自动报表任务LOG", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(MoniExportLog moniExportLog) {
        List<MoniExportLog> list = moniExportLogService.selectMoniExportLogList(moniExportLog);
        ExcelUtil<MoniExportLog> util = new ExcelUtil<MoniExportLog>(MoniExportLog.class);
        return util.exportExcel(list, "自动报表任务LOG数据");
    }

    /**
     * 删除自动报表任务LOG
     */
    @RequiresPermissions("monitor:exportJobLog:remove")
    @Log(title = "自动报表任务LOG", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(moniExportLogService.deleteMoniExportLogByIds(ids));
    }

    /**
     * 清空日志
     *
     * @return
     */
    @Log(title = "自动报表任务LOG", businessType = BusinessType.CLEAN)
    @RequiresPermissions("monitor:exportJobLog:clear")
    @PostMapping("/clean")
    @ResponseBody
    public AjaxResult clean() {
        moniExportLogService.cleanExportJobLog();
        return success();
    }


    /**
     * excel下载
     */
    @GetMapping("/download/{fileName}")
    public void resourceDownload(@PathVariable("fileName")String fileName, HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        try {
            // 本地资源路径
            String excelPath = ASConfig.getExcelPath();
            // 数据库资源地址
            String downloadPath = excelPath + '/' + fileName;
            response.setContentType(MediaType.APPLICATION_OCTET_STREAM_VALUE);
            FileUtils.setAttachmentResponseHeader(response, fileName);
            FileUtils.writeBytes(downloadPath, response.getOutputStream());
        } catch (Exception e) {
            log.error("下载文件失败", e);
        }
    }

    /**
     * 回调
     *
     * @return
     */
    @Log(title = "自动报表任务LOG", businessType = BusinessType.UPDATE)
    @GetMapping("/callback/{id}")
    @ResponseBody
    public AjaxResult callback(@PathVariable("id") Long id) {
        return toAjax(moniExportLogService.callback(id));
    }
}
