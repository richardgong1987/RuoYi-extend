package com.ruoyi.framework.shiro.authc;

import org.apache.shiro.authc.UsernamePasswordToken;

public class ClientUsernamePasswordToken extends UsernamePasswordToken {

    //登录类型，判断是手机号码登陆，还是账号密码登录
    private String loginType;

    //googleCode
    private String googlecode;

    public ClientUsernamePasswordToken(String username, String password, boolean rememberMe) {
        super(username, password, rememberMe);
    }

    public ClientUsernamePasswordToken(String username, String password, boolean rememberMe, String loginType) {
        this(username, password, rememberMe);
        this.loginType = loginType;
    }

    public ClientUsernamePasswordToken(String username, String password, boolean rememberMe, String loginType, String googlecode) {
        this(username, password, rememberMe, loginType);
        this.googlecode = googlecode;
    }

    public String getLoginType() {
        return loginType;
    }

    public void setLoginType(String loginType) {
        this.loginType = loginType;
    }

    public String getGooglecode() {
        return googlecode;
    }

    public void setGooglecode(String googlecode) {
        this.googlecode = googlecode;
    }
}
