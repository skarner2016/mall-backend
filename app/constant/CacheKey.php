<?php

namespace app\constant;

class CacheKey
{
    // 手机验证码key
    public static function mobileVerifyCode($codeType, $areaCode, $mobile): string
    {
        return 'verify_code:mobile:' . $codeType . ':' . $areaCode . ':' . $mobile;
    }
    
    // 邮箱验证码key
    public static function emailVerifyCode($codeType, $email): string
    {
        return 'verify_code:email:' . $codeType . ':' . $email;
    }
    
    // 手机获取验证码限频key
    public static function mobileVerifyCodeRateLimit($codeType, $areaCode, $mobile): string
    {
        return 'verify_code_rate_limit:mobile:' . $codeType . ':' . $areaCode . ':' . $mobile;
    }
    
    // 邮箱获取验证码限频key
    public static function emailVerifyCodeRateLimit($codeType, $email): string
    {
        return 'verify_code_rate_limit:email:' . $codeType . ':' . $email;
    }
}