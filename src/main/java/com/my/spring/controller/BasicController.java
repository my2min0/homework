package com.my.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BasicController {
    @RequestMapping("/")
    public String index() {
        return "index";
    }
}
