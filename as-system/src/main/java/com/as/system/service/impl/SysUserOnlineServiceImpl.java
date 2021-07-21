package com.as.system.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.as.common.config.datasource.DynamicDataSourceContextHolder;
import com.as.common.constant.ShiroConstants;
import com.as.common.enums.DataSourceType;
import com.as.common.utils.DateUtils;
import com.as.common.utils.StringUtils;
import com.as.common.utils.spring.SpringUtils;
import com.as.system.domain.SysUserOnline;
import com.as.system.mapper.SysUserOnlineMapper;
import com.as.system.service.ISysUserOnlineService;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.ehcache.EhCacheManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.*;

/**
 * 在线用户 服务层处理
 *
 * @author kolin
 */
@Service
public class SysUserOnlineServiceImpl implements ISysUserOnlineService {
    @Autowired
    private SysUserOnlineMapper userOnlineDao;

    @Autowired
    private EhCacheManager ehCacheManager;

    @Autowired
    @Qualifier("masterDataSource")
    DataSource masterDataSource;

    /**
     * 通过会话序号查询信息
     *
     * @param sessionId 会话ID
     * @return 在线用户信息
     */
    @Override
    public SysUserOnline selectOnlineById(String sessionId) {
        return userOnlineDao.selectOnlineById(sessionId);
    }

    /**
     * 通过会话序号删除信息
     *
     * @param sessionId 会话ID
     * @return 在线用户信息
     */
    @Override
    public void deleteOnlineById(String sessionId) {
        SysUserOnline userOnline = selectOnlineById(sessionId);
        if (StringUtils.isNotNull(userOnline)) {
            userOnlineDao.deleteOnlineById(sessionId);
        }
    }

    /**
     * 通过会话序号删除信息
     *
     * @param sessions 会话ID集合
     * @return 在线用户信息
     */
    @Override
    public void batchDeleteOnline(List<String> sessions) {
        for (String sessionId : sessions) {
            SysUserOnline userOnline = selectOnlineById(sessionId);
            if (StringUtils.isNotNull(userOnline)) {
                userOnlineDao.deleteOnlineById(sessionId);
            }
        }
    }

    /**
     * 保存会话信息
     *
     * @param online 会话信息
     */
    @Override
    public void saveOnline(SysUserOnline online) {
        userOnlineDao.saveOnline(online);
    }

    /**
     * 查询会话集合
     *
     * @param userOnline 在线用户
     */
    @Override
    public List<SysUserOnline> selectUserOnlineList(SysUserOnline userOnline) {
        return userOnlineDao.selectUserOnlineList(userOnline);
    }

    /**
     * 强退用户
     *
     * @param sessionId 会话ID
     */
    @Override
    public void forceLogout(String sessionId) {
        userOnlineDao.deleteOnlineById(sessionId);
    }

    /**
     * 清理用户缓存
     *
     * @param loginName 登录名称
     * @param sessionId 会话ID
     */
    @Override
    public void removeUserCache(String loginName, String sessionId) {
        Cache<String, Deque<Serializable>> cache = ehCacheManager.getCache(ShiroConstants.SYS_USERCACHE);
        Deque<Serializable> deque = cache.get(loginName);
        if (StringUtils.isEmpty(deque) || deque.size() == 0) {
            return;
        }
        deque.remove(sessionId);
    }

    /**
     * 查询会话集合
     *
     * @param expiredDate 失效日期
     */
    @Override
    public List<SysUserOnline> selectOnlineByExpired(Date expiredDate) {
        String lastAccessTime = DateUtils.parseDateToStr(DateUtils.YYYY_MM_DD_HH_MM_SS, expiredDate);
        return userOnlineDao.selectOnlineByExpired(lastAccessTime);
    }
}
