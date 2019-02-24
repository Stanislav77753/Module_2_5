package com.popovich.springapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/myapplication/moderator")
public class ModeratorController {


    @RequestMapping( method = RequestMethod.GET)
    public ModelAndView moderatorPage(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("moderator_page");
        return modelAndView;
    }
}
