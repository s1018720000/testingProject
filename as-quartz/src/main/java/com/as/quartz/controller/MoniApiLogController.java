package com.as.quartz.controller;

import com.as.common.annotation.Log;
import com.as.common.core.controller.BaseController;
import com.as.common.core.domain.AjaxResult;
import com.as.common.core.page.TableDataInfo;
import com.as.common.enums.BusinessType;
import com.as.common.utils.StringUtils;
import com.as.common.utils.poi.ExcelUtil;
import com.as.quartz.domain.MoniApi;
import com.as.quartz.domain.MoniApiLog;
import com.as.quartz.service.IMoniApiLogService;
import com.as.quartz.service.IMoniApiService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 自动API检测任务LOGController
 *
 * @author kolin
 * @date 2021-07-26
 */
@Controller
@RequestMapping("/monitor/apiJobLog")
public class MoniApiLogController extends BaseController {
    private String prefix = "monitor/apiJob";

    @Autowired
    private IMoniApiLogService moniApiLogService;

    @Autowired
    private IMoniApiService moniApiService;

    @RequiresPermissions("monitor:apiJobLog:view")
    @GetMapping()
    public String apiJob(@RequestParam(value = "jobId", required = false) Long jobId, ModelMap mmap) {
        if (StringUtils.isNotNull(jobId)) {
            MoniApi job = moniApiService.selectMoniApiById(jobId);
            mmap.put("job", job);
        }
        return prefix + "/apiJobLog";
    }

    /**
     * 查询自动API检测任务LOG列表
     */
    @RequiresPermissions("monitor:apiJobLog:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(MoniApiLog moniApiLog) {
        startPage();
        List<MoniApiLog> list = moniApiLogService.selectMoniApiLogList(moniApiLog);
        return getDataTable(list);
    }

    /**
     * 导出自动API检测任务LOG列表
     */
    @RequiresPermissions("monitor:apiJobLog:export")
    @Log(title = "自动API检测任务LOG", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(MoniApiLog moniApiLog) {
        List<MoniApiLog> list = moniApiLogService.selectMoniApiLogList(moniApiLog);
        ExcelUtil<MoniApiLog> util = new ExcelUtil<MoniApiLog>(MoniApiLog.class);
        return util.exportExcel(list, "自动API检测任务LOG数据");
    }


    /**
     * 删除自动API检测任务LOG
     */
    @RequiresPermissions("monitor:apiJobLog:remove")
    @Log(title = "自动API检测任务LOG", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(moniApiLogService.deleteMoniApiLogByIds(ids));
    }

    /**
     * 日志详情
     *
     * @param id
     * @param mmap
     * @return
     */
    @RequiresPermissions("monitor:apiJobLog:detail")
    @GetMapping("/detail/{id}")
    public String detail(@PathVariable("id") Long id, ModelMap mmap) {
        mmap.put("name", "apiJobLog");
        mmap.put("jobLog", moniApiLogService.selectMoniApiLogById(id));
        return prefix + "/detail";
    }

    /**
     * 清空日志
     *
     * @return
     */
    @Log(title = "自动API检测任务LOG", businessType = BusinessType.CLEAN)
    @RequiresPermissions("monitor:apiJobLog:clear")
    @PostMapping("/clean")
    @ResponseBody
    public AjaxResult clean() {
        moniApiLogService.cleanApiJobLog();
        return success();
    }
}
