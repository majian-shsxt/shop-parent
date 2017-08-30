package com.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;


@Controller
public class TestController1 {

    @RequestMapping("test")
    public String test(Model model) {

        model.addAttribute("realName","sdfs" );
        model.addAttribute("userId", 1000000);
        model.addAttribute("isMan", true);
        model.addAttribute("createDate", new Date());
        return "test00";
    }
    @RequestMapping("hello")
    public String hello(Model model)
    {
      return "hello";
    }




}
