<?php
/**
 * @desc
 * @author  skarner <2024-02-29 18:17>
 */

namespace app\service;

class UserService
{
    public const ACCOUNT_TYPE_MOBILE = 'mobile';
    public const ACCOUNT_TYPE_EMAIL = 'email';
    
    public const ACCOUNT_TYPE_LIST = [
        self::ACCOUNT_TYPE_MOBILE,
        self::ACCOUNT_TYPE_EMAIL,
    ];
    
    public const AREA_CODE_DEFAULT = '86';
}