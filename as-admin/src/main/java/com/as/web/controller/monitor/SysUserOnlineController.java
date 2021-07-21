package com.as.web.controller.monitor;

import java.util.List;

import com.as.common.utils.MessageUtils;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.as.common.annotation.Log;
import com.as.common.core.controller.BaseController;
import com.as.common.core.domain.AjaxResult;
import com.as.common.core.page.TableDataInfo;
import com.as.common.core.text.Convert;
import com.as.common.enums.BusinessType;
import com.as.common.enums.OnlineStatus;
import com.as.common.utils.ShiroUtils;
import com.as.framework.shiro.session.OnlineSession;
import com.as.framework.shiro.session.OnlineSessionDAO;
import com.as.system.domain.SysUserOnline;
import com.as.system.service.ISysUserOnlineService;

/**
 * 在线用户监控
 * 
 * @author kolin
 */
@Controller
@RequestMapping("/monitor/online")
public class SysUserOnlineController extends BaseController
{
    private String prefix = "monitor/online";

    @Autowired
    private ISysUserOnlineService userOnlineService;

    @Autowired
    private OnlineSessionDAO onlineSessionDAO;

    @RequiresPermissions("monitor:online:view")
    @GetMapping()
    public String online()
    {
        return prefix + "/online";
    }

    @RequiresPermissions("monitor:online:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(SysUserOnline userOnline)
    {
        startPage();
        List<SysUserOnline> list = userOnlineService.selectUserOnlineList(userOnline);
        return getDataTable(list);
    }

    @RequiresPermissions(value = { "monitor:online:batchForceLogout", "monitor:online:forceLogout" }, logical = Logical.OR)
    @Log(title = "在线用户", businessType = BusinessType.FORCE)
    @PostMapping("/batchForceLogout")
    @ResponseBody
    public AjaxResult batchForceLogout(String ids)
    {
        for (String sessionId : Convert.toStrArray(ids))
        {
            SysUserOnline online = userOnlineService.selectOnlineById(sessionId);
            if (online == null)
            {
                return error(MessageUtils.message("kick.out.offline"));
            }
            OnlineSession onlineSession = (OnlineSession) onlineSessionDAO.readSession(online.getSessionId());
            if (onlineSession == null)
            {
                return error(MessageUtils.message("kick.out.offline"));
            }
            if (sessionId.equals(ShiroUtils.getSessionId()))
            {
                return error(MessageUtils.message("kick.out.not"));
            }
            onlineSessionDAO.delete(onlineSession);
            online.setStatus(OnlineStatus.off_line);
            userOnlineService.saveOnline(online);
            userOnlineService.removeUserCache(online.getLoginName(), sessionId);
        }
        return success();
    }
}
