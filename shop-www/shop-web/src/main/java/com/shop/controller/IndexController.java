package com.shop.controller;

import com.shop.base.BaseController;
import com.shop.base.ResultInfo;
import com.shop.service.NavigationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;

import java.util.List;



@Controller
public class IndexController extends BaseController {

    @Autowired
private RestTemplate restTemplate;

    @Autowired
private NavigationService navigationService;



    @RequestMapping("index")
    public String index(Model model) {

        //调用缓存接口获取热门搜索关键字
        ResultInfo result=restTemplate.getForObject("http://localhost:8082/keywords/get",
                ResultInfo.class);
        List<String> keywords=(List<String>)result.getResult();
        model.addAttribute("keywords",keywords);
        return "index";
    }
@RequestMapping("register")
    public String register(){
        return "user/register";

    }
}
