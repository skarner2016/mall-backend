<?php

namespace app\api\controller;

use support\Request;
use app\service\ProductService;
use app\service\ProductAttributeService;

class ProductController extends ApiController
{
    public function index(Request $request)
    {
        $categoryId    = $request->get('category_id', 1);
        $subcategoryId = $request->get('subcategory_id', 1);
        $limit         = $request->get('limit', 10);
        $sortId        = $request->get('sort_id', 0);
        
        $productList = (new ProductService())->getList($categoryId, $subcategoryId, $limit, $sortId);
        
        return $this->success($productList);
    }
    
    public function show(Request $request)
    {
        $productId = $request->get('product_id', 1);
        
        $product    = (new ProductService())->getProductDetail($productId);
        $attributes = (new ProductAttributeService())->getAttribute($productId);
        
        $list = [
            'product'    => $product,
            'attributes' => $attributes,
            'sku'        => [], // TODO: 库存量如何返回?
        ];
        
        return $this->success($list);
    }
}
