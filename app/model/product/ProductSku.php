<?php

namespace app\model\product;

use app\model\BaseModel;

class ProductSku extends BaseModel
{
    protected $table = 'product_skus';
    
    const STATUS_VALID   = 1;
    const STATUS_INVALID = 2;
}
