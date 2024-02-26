<?php

namespace app\api\controller;

use support\Request;

class ConfigController extends ApiController
{
    public function index(Request $request)
    {
        // application 初始化配置下发
        $response = [
        
        ];
        
        $this->success($response);
    }
}
