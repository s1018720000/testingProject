package com.as.quartz.controller;

import com.as.common.annotation.Log;
import com.as.common.core.controller.BaseController;
import com.as.common.core.domain.AjaxResult;
import com.as.common.core.page.TableDataInfo;
import com.as.common.enums.BusinessType;
import com.as.quartz.domain.MoniExportLog;
import com.as.quartz.domain.MoniJob;
import com.as.quartz.domain.MoniJobLog;
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
        List<MoniExportLog> list = moniExportLogService.selectMoniExportLogListNoSuccess();
        return getDataTable(list);
    }

    /**
     * 更新仪表盘 elasticJob
     */
    @PostMapping("/updateElasticJob")
    @ResponseBody
    public TableDataInfo updateElasticJob(MoniJob moniJob) {

        return getDataTable(null);
    }

    /**
     * 更新仪表盘 apiJob
     */
    @PostMapping("/updateApiJob")
    @ResponseBody
    public TableDataInfo updateApiJob(MoniJob moniJob) {
        return getDataTable(null);
    }
}
