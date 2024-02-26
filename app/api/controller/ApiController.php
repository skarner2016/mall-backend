<?php

namespace app\api\controller;

class ApiController
{
    public function success($data)
    {
        return json([
            'code'    => 200,
            'message' => 'success',
            'data'    => $data,
        ]);
    }
    
    public function fail($message = 'unknown error')
    {
        return json([
            'code'    => 500,
            'message' => $message,
            'data'    => (object)[],
        ]);
    }
}
