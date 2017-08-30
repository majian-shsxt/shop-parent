package com.shop.controller;

import com.shop.base.BaseController;
import com.shop.base.ResultInfo;
import com.shop.constant.Constant;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.RandomUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Slf4j
@RequestMapping("sms")
@Controller
public class SmsController extends BaseController {


    @RequestMapping("send")
    public ResultInfo sendVerifyCode(String phone, HttpSession session) {

        //判断是否存在
                if(StringUtils.isEmpty(phone)){
                    return failure(Constant.ERROR_CODE,"请输入手机号");
                }
        // 发送消息 生成六位随机数,判断是否发送过短信
        String verifyCode = (String)session.getAttribute(Constant.VERIFY_CODE_KEY + "_" + phone);
        if (StringUtils.isNotBlank(verifyCode)) {
            return success("发送成功");
        }



        //发送消息，生成六位随机数
       verifyCode= RandomUtils.nextInt(100000,999999)+"";
                //加个"",就为字符串
       log.info("手机号：{}，短信验证码为：{}", phone, verifyCode);
       //slf4j在运行时起作用
        boolean isSuccess = sendByDayu(phone, verifyCode);
        if(isSuccess){
            session.setAttribute(Constant.VERIFY_CODE_KEY,verifyCode);
            session.setMaxInactiveInterval(300); // 5分钟有效
            return success("成功发送");
        }else{
            return failure(0,"发送失败");
        }

    }

    private boolean sendByDayu(String phone, String verifyCode) {

    }
}
