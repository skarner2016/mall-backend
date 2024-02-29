<?php

namespace app\constant;

class ErrorCode
{
    // normal error
    public const SUCCESS           = 200;
    public const ERROR             = 500;
    public const ILLEGAL_PARAMETER = 417;
    public const POPUP             = 901;
    
    // business error
    public const ACCOUNT_TYPE_ERROR = 1001;
    
    public const CODE_SEND_SUCCESS = 1002;
}