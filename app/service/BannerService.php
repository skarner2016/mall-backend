<?php

namespace app\service;

use app\model\Banner;

class BannerService
{
    public function getBannerList(): array
    {
        $bannerList = [];
        $banners    = Banner::query()
            ->where('status', Banner::STATUS_VALID)
            ->orderBy('sort')
            ->get();
        
        foreach ($banners as $banner) {
            $bannerList[] = [
                'id'        => $banner->id,
                'image_url' => $banner->image,
                'url'       => $banner->url,
            ];
        }
        
        return $bannerList;
    }
}