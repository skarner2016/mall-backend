<?php

namespace app\exception;

use Webman\Http\Request;
use Webman\Http\Response;
use app\traits\ApiResponse;
use support\exception\BusinessException;

class ApiException extends BusinessException
{
    use ApiResponse;
    
    public function render(Request $request): ?Response
    {
        $code = $this->getCode();
        
        return $this->fail($code);
    }
}
