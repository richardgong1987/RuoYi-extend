package com.ruoyi.framework.shiro.authc;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.pam.ModularRealmAuthenticator;
import org.apache.shiro.realm.Realm;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Collection;

@Component
public class CustomModularRealmAuthenticator extends ModularRealmAuthenticator {

    @Override
    protected AuthenticationInfo doAuthenticate(AuthenticationToken authenticationToken)throws AuthenticationException {
        // 判断getRealms()是否返回为空
        assertRealmsConfigured();
        // 将authenticationToken强制转换为自定义的CustomToken
        ClientUsernamePasswordToken customToken = (ClientUsernamePasswordToken) authenticationToken;
        // 登录类型
        String loginType = customToken.getLoginType();
        // 所有realm
        Collection<Realm> realms = getRealms();
        // 用来存放登陆类型指定的realm
        Collection<Realm> typeRealms = new ArrayList<>();
        for (Realm realm : realms) {
            //根据我们传入的登陆类型来决定使用realm
            if (realm.getName().contains(loginType))
                typeRealms.add(realm);
        }

        // 判断是单realm还是多realm
        if (typeRealms.size() == 1)
            return doSingleRealmAuthentication(typeRealms.iterator().next(), customToken);
        else
            return doMultiRealmAuthentication(typeRealms, customToken);
    }

}
