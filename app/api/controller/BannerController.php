<?php

namespace app\api\controller;

use support\Request;
use app\service\BannerService;

class BannerController extends ApiController
{
    public function index(Request $request)
    {
        $bannerList = (new BannerService())->getBannerList();
        
        return $this->success($bannerList);
    }
}
