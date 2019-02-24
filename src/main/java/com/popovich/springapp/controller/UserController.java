package com.popovich.springapp.controller;

import com.popovich.springapp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    public UserService getUserService() {
        return userService;
    }

    @RequestMapping(value = "/myapplication/user", method = RequestMethod.GET)
    public ModelAndView userPage(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("user_page");
        return modelAndView;
    }
}
