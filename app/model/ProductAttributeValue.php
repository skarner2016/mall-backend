<?php

namespace app\model;

class ProductAttributeValue extends BaseModel
{
    protected $table = 'product_attribute_values';
    
    const STATUS_VALID   = 1;
    const STATUS_INVALID = 2;
}
