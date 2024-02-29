<?php

namespace app\service\Product;

use app\model\product\ProductAttribute;
use app\model\product\ProductAttributeValue;

class ProductAttributeService
{
    public function getAttributes($productId): array
    {
        $productAttributes = ProductAttribute::query()
            ->with(['productAttributeValues' => function ($query) {
                $query->where('status', ProductAttributeValue::STATUS_VALID)
                    ->orderBy('sort');
            }])
            ->where('product_id', $productId)
            ->where('status', ProductAttribute::STATUS_VALID)
            ->get();
        
        $list = [];
        foreach ($productAttributes as $productAttribute) {
            $items = [];
            foreach ($productAttribute->productAttributeValues as $productAttributeValue) {
                $items[] = [
                    'attribute_id'   => $productAttributeValue->id,
                    'attribute_name' => $productAttributeValue->attribute_name,
                ];
            }
            
            $list[] = [
                'id'    => $productAttribute->id,
                'name'  => $productAttribute->name,
                'items' => $items,
            ];
        }
        
        return $list;
    }
}