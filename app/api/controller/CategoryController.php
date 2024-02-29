<?php

namespace app\api\controller;

use support\Request;
use app\service\Product\CategoryService;

class CategoryController extends ApiController
{
    public function index(Request $request)
    {
        $list = (new CategoryService())->getCategoryList();
        
        return $this->success($list);
    }
}
