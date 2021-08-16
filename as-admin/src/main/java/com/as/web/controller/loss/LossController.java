package com.as.web.controller.loss;

import com.as.common.core.controller.BaseController;
import com.as.common.core.page.TableDataInfo;
import com.as.common.utils.StringUtils;
import com.as.quartz.domain.MoniJobLog;
import com.as.quartz.service.IMoniJobLogService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.LinkedList;
import java.util.List;

/**
 * 告警日志Controller
 *
 * @author kolin
 * @date 2021-07-05
 */
@Controller
@RequestMapping("/rc/loss")
public class LossController extends BaseController {
    private String prefix = "loss";

    @Autowired
    private IMoniJobLogService moniJobLogService;

    @RequiresPermissions("loss:platform:view")
    @GetMapping("/platform")
    public String platformLoss() {
        return prefix + "/platformLoss";
    }

    @RequiresPermissions("loss:play:view")
    @GetMapping("/play")
    public String playLoss() {
        return prefix + "/playLoss";
    }

    @RequiresPermissions("loss:game:view")
    @GetMapping("/game")
    public String gameLoss() {
        return prefix + "/gameLoss";
    }

    @RequiresPermissions("loss:order:view")
    @GetMapping("/order")
    public String orderLoss() {
        return prefix + "/orderLoss";
    }

    @RequiresPermissions("loss:user:view")
    @GetMapping("/user")
    public String userLoss() {
        return prefix + "/userLoss";
    }

    /**
     * 告警日志查询
     */
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo listPlatform(@RequestParam(name = "id") String id) {
        String[] jobIds = id.split(",");
        List<MoniJobLog> moniJobLogs = moniJobLogService.selectLossByIds(jobIds);
        if (StringUtils.isNotNull(moniJobLogs)) {
            return getDataTable(moniJobLogs);
        }
        return getDataTable(new LinkedList<>());
    }
}
