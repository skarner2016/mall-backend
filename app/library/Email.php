<?php

namespace app\library;

use Exception;
use support\Log;
use app\constant\App;
use PHPMailer\PHPMailer\PHPMailer;

class Email
{
    public static function send($email, $subject, $body)
    {
        $fromUser  = getenv('SMTP_USER');
        $fromEmail = getenv('SMTP_FROM_EMAIL');
        $password  = getenv('SMTP_PASSWORD');
        $host      = getenv('SMTP_HOST');
        $port      = getenv('SMTP_PORT');
        $debug     = getenv('SMTP_DEBUG');
        
        $mail = new PHPMailer(true);
        try {
            $mail->SMTPDebug = $debug;              // 是否开启smtp的debug进行调试 ，0关闭，1开启
            $mail->isSMTP();                        // 启用SMTP
            $mail->CharSet    = 'utf-8';            //设置字符编码
            $mail->Host       = $host;              // SMTP服务器
            $mail->SMTPAuth   = true;               // 启用SMTP认证
            $mail->Username   = $fromEmail;         // 发送邮件的邮箱，即自己的邮箱
            $mail->Password   = $password;          // 授权码 步骤2中获取到的
            $mail->SMTPSecure = 'ssl';              // 加密方式为tls或者ssl，根据需求自己改
            $mail->Port       = $port;              // 端口号
            $mail->setFrom($fromEmail, $fromUser);
            $mail->addAddress($email);              // 增加一个接受者的邮箱，这里用变量
            $mail->isHTML(true);            // Set email format to HTML
            $mail->Subject = $subject;              //标题 主题
            $mail->Body    = $body;                 //正文
            
            $res = $mail->send();//发送邮件
            
            if (true == $res) {
                // 发送成功
                Log::channel(App::LOG_EMAIL)->info('send email success', [
                    'email'   => $email,
                    'subject' => $subject,
                    'body'    => $body,
                ]);
                
            } else {
                // 发送失败
                Log::channel(App::LOG_EMAIL)->info('send email success', [
                    'email'      => $email,
                    'subject'    => $subject,
                    'body'       => $body,
                    'error_info' => $mail->ErrorInfo,
                ]);
            }
            
        } catch (Exception $e) {
            // 发送失败
            Log::channel(App::LOG_EMAIL)->info('send email success', [
                'email'      => $email,
                'subject'    => $subject,
                'body'       => $body,
                'error_info' => $mail->ErrorInfo,
                'exception'  => $e->getTraceAsString(),
            ]);
        }
    }
}