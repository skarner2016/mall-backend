<?php

namespace app\model;

use support\Model;
use Illuminate\Database\Eloquent\Casts\Attribute;

class Product extends BaseModel
{
    protected $table = 'products';
    
    const STATUS_VALID   = 1;
    const STATUS_INVALID = 2;
    
    protected function image(): Attribute
    {
        $ossDomain = env('OSS_DOMAIN');
        $imageUri = '%s/product/%s';
        return Attribute::make(
            get: fn ($value) => sprintf($imageUri, $ossDomain, $value),
        );
    }
}
