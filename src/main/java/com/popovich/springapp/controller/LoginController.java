package com.popovich.springapp.controller;

import org.apache.log4j.Logger;
import com.popovich.springapp.model.User;
import com.popovich.springapp.service.SecurityService;
import com.popovich.springapp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;
import java.util.HashMap;

@Controller
public class LoginController {
    private static final Logger logger = Logger.getLogger(LoginController.class);

    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());
        return "registration_page";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            return "registration_page";
        }
        userService.save(userForm);
        securityService.autoLogin(userForm.getUserName(), userForm.getConfirmPassword());
        return "redirect:/myapplication/login/result";
    }


    @RequestMapping(value = {"/","/myapplication"}, method = RequestMethod.GET)
    public ModelAndView login(){
        logger.info("Trying to log in.");
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("user", new User());
        modelAndView.setViewName("index");
        return modelAndView;
    }

    @RequestMapping(value = "/myapplication/login/result", method = RequestMethod.GET)
    public ModelAndView loginResult(){
        logger.info("login result.");
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("login_result_page");
        return modelAndView;
    }

    @RequestMapping(value = "/myapplication/accessDenied", method = RequestMethod.GET)
    public ModelAndView accessDenied(Principal user){
        ModelAndView modelAndView = new ModelAndView();
        HashMap<String, String> map__1 = new HashMap<>();
        map__1.put("1", "name1");
        map__1.put("2", "name2");
        map__1.put("3", "name3");
        map__1.put("4", "name4");
        modelAndView.addObject("mymap",map__1);
        if(user != null){
            modelAndView.addObject("errorMsg", user.getName()
                    + " you don't have access to this page");
        }else{
            modelAndView.addObject("errorMsg", "You don't have access to this page");
        }
        modelAndView.setViewName("access_denied_page");
        return modelAndView;
    }

}
