<?php

namespace app\model;

use Illuminate\Database\Eloquent\Relations\HasMany;

class ProductAttribute extends BaseModel
{
    protected $table = 'product_attributes';
    
    const STATUS_VALID   = 1;
    const STATUS_INVALID = 2;
    
    public function productAttributeValues(): HasMany
    {
        return $this->hasMany(ProductAttributeValue::class, 'attribute_id', 'id');
    }
}
