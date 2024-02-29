<?php

namespace app\api\controller;

use support\Request;
use app\constant\ErrorCode;
use app\service\UserService;
use app\service\CommonService;
use app\exception\ApiException;

class CommonController extends ApiController
{
    // 获取验证码
    public function code(Request $request)
    {
        $codeType      = $request->get('code_type');
        $accountType   = $request->get('account_type');
        
        $commonService = new CommonService();
        if (UserService::ACCOUNT_TYPE_MOBILE == $accountType) {
            $areaCode = $request->get('area_code', UserService::AREA_CODE_DEFAULT);
            $mobile   = $request->get('mobile');
            
            $commonService->sendMobileCode($codeType, $areaCode, $mobile);
        } else if (UserService::ACCOUNT_TYPE_EMAIL == $accountType) {
            $email = $request->get('email');
            $commonService->sendEmailCode($codeType, $email);
        } else {
            return $this->fail(ErrorCode::ACCOUNT_TYPE_ERROR);
        }
        
        return $this->successWithMsg(ErrorCode::CODE_SEND_SUCCESS);
    }
}
