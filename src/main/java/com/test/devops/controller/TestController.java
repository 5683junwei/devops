package com.test.devops.controller;

import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @author 王军伟
 * @create 2019-08-05 16:00:50
 * @desc
 */
@Controller
public class TestController {
    @GetMapping("get")
    public String get(Model model){
        model.addAttribute("msg","Hello jenkins");
        return "index";
    }
}
