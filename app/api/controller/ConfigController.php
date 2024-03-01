<?php

namespace app\api\controller;

use support\Request;
use support\Response;

class ConfigController extends ApiController
{
    public function index(Request $request): Response
    {
        // application 初始化配置下发
        $response = [
        
        ];
        
        return $this->success($response);
    }
}
