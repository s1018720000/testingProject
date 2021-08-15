package com.as.web.controller.system;

import com.as.common.core.controller.BaseController;
import com.as.common.core.domain.AjaxResult;
import com.as.common.utils.CookieUtils;
import com.as.common.utils.MessageUtils;
import com.as.common.utils.ServletUtils;
import com.as.common.utils.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Locale;

/**
 * 登录验证
 *
 * @author kolin
 */
@Controller
public class SysLoginController extends BaseController {
    @GetMapping("/login")
    public String login(HttpServletRequest request, HttpServletResponse response) {
        // 如果是Ajax请求，返回Json字符串。
        if (ServletUtils.isAjaxRequest(request)) {
            Locale locale = MessageUtils.getLocaleByCookies();
            return ServletUtils.renderString(response, "{\"code\":\"1\",\"msg\":\"" + MessageUtils.message("user.login.time.out", locale) + "\"}");
        }

        return "login";
    }

    @PostMapping("/login")
    @ResponseBody
    public AjaxResult ajaxLogin(String username, String password, Boolean rememberMe) {
        UsernamePasswordToken token = new UsernamePasswordToken(username, password, rememberMe);
        Subject subject = SecurityUtils.getSubject();
        try {
            subject.login(token);
            HttpServletResponse response = getResponse();
            CookieUtils.setCookie(response, "locale", LocaleContextHolder.getLocale().toString());
            return success();
        } catch (AuthenticationException e) {
            String msg = MessageUtils.message("user.login.error");
            if (StringUtils.isNotEmpty(e.getMessage())) {
                msg = e.getMessage();
            }
            return error(msg);
        }
    }

    @GetMapping("/unauth")
    public String unauth() {
        return "error/unauth";
    }
}
