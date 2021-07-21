package com.as.common.exception.user;

import com.as.common.exception.base.BaseException;

/**
 * 用户信息异常类
 * 
 * @author kolin
 */
public class UserException extends BaseException
{
    private static final long serialVersionUID = 1L;

    public UserException(String code, Object[] args)
    {
        super("user", code, args, null);
    }
}
