package com.ruoyi.framework.shiro.authc;

public enum LoginType {
    //枚举中对应的值是我们realm注入在spring当中Bean的命名
    FRONTEND("ClientRealm"),
    BACKEND("UserRealm");

    private String type;

    LoginType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return this.type.toString();
    }
}
