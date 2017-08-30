package com.shop.controller;

import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;
import com.shop.base.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;

@Controller
@RequestMapping("kaptcha")
public class KaptchaController extends BaseController {

    @Autowired
    private Producer captchaProducer;

    @RequestMapping("getKaptchaImage")
    public void getKaptchaImage(HttpSession session, HttpServletResponse response) throws IOException {




        // Set standard HTTP/1.1 no-cache headers.
        response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
        // Set IE extended HTTP/1.1 no-cache headers (use addHeader).
        response.addHeader("Cache-Control", "post-check=0, pre-check=0");
        // Set standard HTTP/1.0 no-cache header.
        response.setHeader("Pragma", "no-cache");
        // return a jpeg MIME 媒体类型 text/html; application/json
        response.setContentType("image/jpeg");
        // create the text for the image
        String capText = captchaProducer.createText();  // 随机生成文字
        // store the text in the session
        session.setAttribute(Constants.KAPTCHA_SESSION_KEY, capText);
        // create the image with the text
        BufferedImage bi = captchaProducer.createImage(capText);
        ServletOutputStream out = response.getOutputStream();
        // write the data out
        ImageIO.write(bi, "jpg", out);
        try {
            out.flush();
        } finally {
            out.close();
        }

    }
}

