<?php

namespace app\service;

use support\Redis;
use app\library\Email;
use app\constant\CacheKey;
use app\constant\ErrorCode;
use app\exception\ApiException;

class CommonService
{
    const VERIFY_CODE_TTL                 = 300;
    const VERIFY_CODE_RATE_LIMIT          = 10;
    const VERIFY_CODE_RATE_LIMIT_INTERVAL = 300;
    
    /**
     * @throws ApiException
     */
    public function sendMobileCode($codeType, $areaCode, $mobile)
    {
        $codeCacheKey = CacheKey::mobileVerifyCode($codeType, $areaCode, $mobile);
        $rateLimitKey = CacheKey::mobileVerifyCodeRateLimit($codeType, $areaCode, $mobile);
        $verifyCode   = self::generateVerifyCode();
        
        $this->checkSendCode($codeCacheKey, $rateLimitKey, $verifyCode);
        // TODO: send mobile code
    }
    
    /**
     * @throws ApiException
     */
    public function sendEmailCode($codeType, $email)
    {
        $codeCacheKey = CacheKey::emailVerifyCode($codeType, $email);
        $rateLimitKey = CacheKey::emailVerifyCodeRateLimit($codeType, $email);
        $verifyCode   = self::generateVerifyCode();
        
        $this->checkSendCode($codeCacheKey, $rateLimitKey, $verifyCode);
    
        $subject = 'verification code';
        $body    = sprintf('Your verification code is %s!', $verifyCode);
        Email::send($email, $subject, $body);
    }
    
    /**
     * @throws ApiException
     */
    private function checkSendCode($codeCacheKey, $rateLimitKey, $verifyCode)
    {
        // check rate limit
        if ($rateLimit = Redis::get($rateLimitKey)) {
            if ($rateLimit > self::VERIFY_CODE_RATE_LIMIT) {
                throw new ApiException("Invalid rate limit", ErrorCode::ILLEGAL_PARAMETER);
            }
        }
        
        // save verify code
        Redis::setEx($codeCacheKey, self::VERIFY_CODE_TTL, $verifyCode);
        
        // save rate limit
        Redis::incr($rateLimitKey);
        Redis::expire($rateLimitKey, self::VERIFY_CODE_RATE_LIMIT_INTERVAL);
    }
    
    private function generateVerifyCode(): string
    {
        return strval(rand(100000, 999999));
    }
}