package com.ruoyi.common.exception.user;

/**
 * GoogleAuthCodeException
 */
public class GoogleAuthCodeException extends UserException {
    public GoogleAuthCodeException() {
        super("user.google.not.match", null);
    }
}
