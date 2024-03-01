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
        $ossDomain = getenv('OSS_DOMAIN');
        $imageUri = '%s/banner/%s';
        return Attribute::make(
            get: fn ($value) => sprintf($imageUri, $ossDomain, $value),
        );
    }
    
    protected function url(): Attribute
    {
        $ossDomain = getenv('APP_DOMAIN');
        $imageUri = '%s/product/%s';
        return Attribute::make(
            get: fn ($value) => sprintf($imageUri, $ossDomain, $value),
        );
    }
}
