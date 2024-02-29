<?php

namespace app\api\controller;

use support\Request;
use app\service\Product\ProductService;
use app\service\Product\ProductSkuService;
use app\service\Product\ProductAttributeService;

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
        $attributes = (new ProductAttributeService())->getAttributes($productId);
        $skus       = (new ProductSkuService())->getSku($productId);
        
        $list = [
            'product'    => $product,
            'attributes' => $attributes,
            'sku'        => $skus,
        ];
        
        return $this->success($list);
    }
}
