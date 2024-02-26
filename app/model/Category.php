<?php

namespace app\model;

use support\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

/**
 *
 */
class Category extends BaseModel
{
    protected $table = 'categories';
    
    const STATUS_VALID   = 1;
    const STATUS_INVALID = 2;
    
    public function subcategories(): HasMany
    {
        return $this->hasMany(Subcategory::class, 'category_id', 'id');
    }
}
