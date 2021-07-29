package com.as.quartz.controller;

import com.as.common.annotation.Log;
import com.as.common.core.controller.BaseController;
import com.as.common.core.domain.AjaxResult;
import com.as.common.core.page.TableDataInfo;
import com.as.common.enums.BusinessType;
import com.as.quartz.domain.MoniApiLog;
import com.as.quartz.domain.MoniElasticLog;
import com.as.quartz.domain.MoniExportLog;
import com.as.quartz.domain.MoniJobLog;
import com.as.quartz.service.IMoniApiLogService;
import com.as.quartz.service.IMoniElasticLogService;
import com.as.quartz.service.IMoniExportLogService;
import com.as.quartz.service.IMoniJobLogService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 仪表盘Controller
 *
 * @author kolin
 * @date 2021-07-14
 */
@Controller
@RequestMapping("/monitor/dashboard")
public class DashboardController extends BaseController {
    private String prefix = "monitor/dashboard";

    @Autowired
    private IMoniJobLogService moniJobLogService;

    @Autowired
    private IMoniExportLogService moniExportLogService;

    @Autowired
    private IMoniApiLogService moniApiLogService;

    @Autowired
    private IMoniElasticLogService moniElasticLogService;

    @RequiresPermissions("monitor:dashboard:view")
    @GetMapping()
    public String sqlJob() {
        return prefix + "/dashboard";
    }

    /**
     * 更新仪表盘 sqlJob
     */
    @PostMapping("/updateSqlJob")
    @ResponseBody
    public TableDataInfo updateSqlJob() {
        startPage();
        List<MoniJobLog> list = moniJobLogService.selectMoniJobLogListNoSuccess();
        return getDataTable(list);
    }

    @Log(title = "仪表盘", businessType = BusinessType.UPDATE)
    @PostMapping("/stopSqlJobAlert")
    @ResponseBody
    public AjaxResult stopSqlJobAlert(MoniJobLog moniJobLog) {
        moniJobLogService.updateJobLog(moniJobLog);
        return success();
    }

    @Log(title = "仪表盘", businessType = BusinessType.UPDATE)
    @PostMapping("/startSqlJobAlert")
    @ResponseBody
    public AjaxResult startSqlJobAlert(MoniJobLog moniJobLog) {
        moniJobLogService.updateJobLog(moniJobLog);
        return success();
    }

    /**
     * 更新仪表盘 exportJob
     */
    @PostMapping("/updateExportJob")
    @ResponseBody
    public TableDataInfo updateExportJob() {
        startPage();
        List<MoniExportLog> list = moniExportLogService.selectMoniExportLogListNoSuccess();
        return getDataTable(list);
    }

    /**
     * 更新仪表盘 elasticJob
     */
    @PostMapping("/updateElasticJob")
    @ResponseBody
    public TableDataInfo updateElasticJob() {
        startPage();
        List<MoniElasticLog> list = moniElasticLogService.selectMoniElasticLogListNoSuccess();
        return getDataTable(list);
    }

    @Log(title = "仪表盘", businessType = BusinessType.UPDATE)
    @PostMapping("/stopElasticJobAlert")
    @ResponseBody
    public AjaxResult stopElasticJobAlert(MoniElasticLog moniElasticLog) {
        moniElasticLogService.updateMoniElasticLog(moniElasticLog);
        return success();
    }

    @Log(title = "仪表盘", businessType = BusinessType.UPDATE)
    @PostMapping("/startElasticJobAlert")
    @ResponseBody
    public AjaxResult startElasticJobAlert(MoniElasticLog moniElasticLog) {
        moniElasticLogService.updateMoniElasticLog(moniElasticLog);
        return success();
    }

    /**
     * 更新仪表盘 apiJob
     */
    @PostMapping("/updateApiJob")
    @ResponseBody
    public TableDataInfo updateApiJob() {
        startPage();
        List<MoniApiLog> list = moniApiLogService.selectMoniApiLogListNoSuccess();
        return getDataTable(list);
    }


    @Log(title = "仪表盘", businessType = BusinessType.UPDATE)
    @PostMapping("/stopApiJobAlert")
    @ResponseBody
    public AjaxResult stopApiJobAlert(MoniApiLog moniApiLog) {
        moniApiLogService.updateMoniApiLog(moniApiLog);
        return success();
    }

    @Log(title = "仪表盘", businessType = BusinessType.UPDATE)
    @PostMapping("/startApiJobAlert")
    @ResponseBody
    public AjaxResult startApiJobAlert(MoniApiLog moniApiLog) {
        moniApiLogService.updateMoniApiLog(moniApiLog);
        return success();
    }
}
