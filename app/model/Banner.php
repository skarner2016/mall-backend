<?php

namespace app\model;

use support\Model;

/**
 *
 */
class Banner extends BaseModel
{
    /**
     * The connection name for the model.
     *
     * @var string|null
     */
    protected $connection = 'mysql';
    
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'banners';
    
    // TODO: 创建了 banner model , 写banner的接口
    /**
     * 1. banner
     * 2. 品类(大类, 如食品)
     * 3. 品类(小类, 如休闲零食/饼干糕点)
     * 4. 商品
     */
}
