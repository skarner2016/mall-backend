<?php

namespace app\service;

use app\model\Product;

class ProductService
{
    public function getList($categoryId, $subcategoryId, $limit, $sortId)
    {
        $list     = [];
        $products = Product::query()
            ->where('category_id', $categoryId)
            ->where('subcategory_id', $subcategoryId)
            ->where('status', Product::STATUS_VALID)
            ->where('sort_id', '>', $sortId)
            ->orderBy('sort_id')
            ->limit($limit)
            ->get();
        
        foreach ($products as $product) {
            $list[] = [
                'id'           => $product->id,
                'name'         => $product->name,
                'image'        => $product->image,
                'price'        => $product->price,
                'shipping_fee' => $product->shipping_fee,
                'sold'         => $product->sold,
            ];
        }
        
        return $list;
    }
    
    public function getProductDetail($productId)
    {
        $product = Product::query()->find($productId);
        
        return [
            'id'           => $product->id,
            'name'         => $product->name,
            'image'        => $product->image,
            'desc'         => $product->desc,
            'price'        => $product->price,
            'shipping_fee' => $product->shipping_fee,
            'sold'         => $product->sold,
        ];
    }
}