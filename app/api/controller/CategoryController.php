<?php

namespace app\api\controller;

use support\Request;
use support\Response;
use app\service\Product\CategoryService;

class CategoryController extends ApiController
{
    public function index(Request $request): Response
    {
        $list = (new CategoryService())->getCategoryList();
        
        return $this->success($list);
    }
}
