package com.guxiang.util;

/**
 * 令牌管理器
 * @author guxiang
 * @date 2016年4月6日
 */
public interface TokenManagerUtil {

    String createToken(String username);

    boolean checkToken(String token);

    String getUserName(String token);

    boolean deleteToken(String username);
}