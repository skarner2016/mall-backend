<?php

namespace app\model;

use Illuminate\Database\Eloquent\Casts\Attribute;

/**
 *
 */
class Subcategory extends BaseModel
{
    protected $table = 'subcategories';
    
    const STATUS_VALID   = 1;
    const STATUS_INVALID = 2;
    
    public function category()
    {
        return $this->belongsTo(Category::class, 'category_id', 'id');
    }
    
    protected function icon(): Attribute
    {
        $imageUri = 'http://localhost:8080/images/icon/%s';
        return Attribute::make(
            get: function ($value) use ($imageUri) {
                $value = $value ?: 'default.png';
                
                return sprintf($imageUri, $value);
            },
        );
    }
}
