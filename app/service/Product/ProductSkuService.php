<?php

namespace app\service\Product;

use app\model\product\ProductSku;

class ProductSkuService
{
    public function getSku($productId): array
    {
        $productSkus = ProductSku::query()
            ->where('product_id', $productId)
            ->where('status', ProductSku::STATUS_VALID)
            ->get();
        
        $skuList = [];
        foreach ($productSkus as $productSku) {
            $skuList[$productSku->attribute] = $productSku->stock;
        }
        
        return $skuList;
    }
}