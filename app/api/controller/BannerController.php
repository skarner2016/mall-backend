<?php

namespace app\api\controller;

use support\Request;
use support\Response;
use app\service\BannerService;

class BannerController extends ApiController
{
    public function index(Request $request): Response
    {
        $bannerList = (new BannerService())->getBannerList();
        
        return $this->success($bannerList);
    }
}
