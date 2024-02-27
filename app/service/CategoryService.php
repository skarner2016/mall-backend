<?php

namespace app\service;

use app\model\Category;
use app\model\Subcategory;

class CategoryService
{
    public function getCategoryList()
    {
        $categoryList = [];
        $categories   = Category::query()
            ->with(['subcategories' => function ($query) {
                $query->where('status', Subcategory::STATUS_VALID)
                    ->orderBy('sort');
            }])
            ->where('status', Category::STATUS_VALID)
            ->orderBy('sort')
            ->get();
        $firstTmpList = true;
        foreach ($categories as $category) {
            $tmpList = [];
            foreach ($category->subcategories as $subCategory) {
                $productList = [];
                if ($firstTmpList) {
                    $productList = (new ProductService())->getList($category->id, $subCategory->id, 20, 0);
                }
                $firstTmpList = false;
                
                $tmpList[] = [
                    'id'           => $subCategory->id,
                    'name'         => $subCategory->name,
                    'icon'         => $subCategory->icon,
                    'product_list' => $productList,
                ];
            }
            
            $categoryList[] = [
                'id'   => $category->id,
                'name' => $category->name,
                'list' => $tmpList,
            ];
        }
        
        return $categoryList;
    }
}