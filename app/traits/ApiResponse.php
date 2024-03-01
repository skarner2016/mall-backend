<?php

namespace app\traits;

use support\Response;
use app\constant\ErrorCode;

trait ApiResponse
{
    public function success($data = []): Response
    {
        $data = empty($data) ? (object)[] : $data;
        
        return json([
            'code'    => ErrorCode::SUCCESS,
            'message' => trans(ErrorCode::SUCCESS, [], 'error'),
            'data'    => $data,
        ]);
    }
    
    public function successWithMsg($code = ErrorCode::SUCCESS, $parameters = []): Response
    {
        return $this->fail($code, $parameters);
    }
    
    public function fail($code = ErrorCode::ERROR, $parameters = []): Response
    {
        return json([
            'code'    => $code,
            'message' => trans($code, $parameters, 'error'),
            'data'    => (object)[],
        ]);
    }
    
    public function failWithMsg($code = ErrorCode::ERROR, $message = "", $parameters = []): Response
    {
        if ("" == $message) {
            $message = trans($code, $parameters, 'error');
        }
        
        return json([
            'code'    => $code,
            'message' => $message,
            'data'    => (object)[],
        ]);
    }
}