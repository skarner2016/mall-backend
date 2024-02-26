<?php

namespace app\model;

use support\Model;
use Illuminate\Database\Eloquent\Casts\Attribute;

/**
 *
 */
class Banner extends BaseModel
{
    protected $table = 'banners';
    
    const STATUS_VALID   = 1;
    const STATUS_INVALID = 2;
    
    protected function image(): Attribute
    {
        $imageUri = 'http://localhost:8080/images/banner/%s';
        return Attribute::make(
            get: fn ($value) => sprintf($imageUri, $value),
        );
    }
    
    protected function url(): Attribute
    {
        $jumpUri = 'http://localhost:8080/images/banner/%s';
        return Attribute::make(
            get: fn ($value) => sprintf($jumpUri, $value),
        );
    }
}
