package com.ruoyi.framework.web.service;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.exception.user.GoogleAuthCodeException;
import com.ruoyi.common.utils.GoogleAuthenticator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

/**
 * GoogleCodeService
 */
@Service
public class GoogleCodeService {
    @Autowired
    private HttpServletRequest request;

    public void verifyGooglecode(SysUser user, String googlecode) throws GoogleAuthCodeException {
        String value = request.getHeader("clientimestamp");
        String totpCode = null;
        if (null != value) {
            totpCode = GoogleAuthenticator.getTOTPCode(Long.parseLong(value), user.getGooglekey());
        } else {
            totpCode = GoogleAuthenticator.getTOTPCode(user.getGooglekey());
        }
        if (org.springframework.util.StringUtils.isEmpty(googlecode) || !googlecode.equals(totpCode)) {
            throw new GoogleAuthCodeException();
        }
    }
}
