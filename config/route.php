<?php
/**
 * This file is part of webman.
 *
 * Licensed under The MIT License
 * For full copyright and license information, please see the MIT-LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @author    walkor<walkor@workerman.net>
 * @copyright walkor<walkor@workerman.net>
 * @link      http://www.workerman.net/
 * @license   http://www.opensource.org/licenses/mit-license.php MIT License
 */

use Webman\Route;

Route::group('/api', function () {
    //
    Route::get('/common/code', [\app\api\controller\CommonController::class, 'code']);
    
    Route::resource('/users', app\api\controller\UserController::class, ['store']);
    
    // product
    Route::resource('/banners', app\api\controller\BannerController::class, ['index']);
    Route::resource('/categories', app\api\controller\CategoryController::class, ['index']);
    Route::resource('/products', app\api\controller\ProductController::class, ['index', 'show']);
});
