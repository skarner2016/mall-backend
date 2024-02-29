<?php

namespace app\middleware;

use Webman\MiddlewareInterface;
use Webman\Http\Response;
use Webman\Http\Request;

class Lang implements MiddlewareInterface
{
    public function process(Request $request, callable $handler): Response
    {
        $lang = $this->parseAcceptLanguage($request);
        
        locale($lang);
        
        return $handler($request);
    }
    
    private function parseAcceptLanguage(Request $request)
    {
        $acceptLanguage = $request->header('Accept-Language');
        $fallbackLocale = config('translation.fallback_locale', ['zh_CN']);
        foreach ($fallbackLocale as $locale) {
            $localeKey = str_replace('_', '-', $locale);
            if (str_contains($acceptLanguage, $localeKey)) {
                return $locale;
            }
        }
        
        return $fallbackLocale[0];
    }
}