package com.popovich.springapp.controller;

import org.apache.log4j.Logger;
import com.popovich.springapp.model.Role;
import com.popovich.springapp.model.User;
import com.popovich.springapp.service.SecurityService;
import com.popovich.springapp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.Set;

@Controller
public class UserController {
    private static final Logger logger = Logger.getLogger(UserController.class);

    @Autowired
    private UserService userService;

    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

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

        return "redirect:/welcome";
    }

/*    @RequestMapping(value = "/myapplication/login_result", method = RequestMethod.POST)
    public String login(Model model, String error, String logout) {
        System.out.println("\n" + "--------------1-------------" + "\n");
        return "login_page";
    }*/

    @RequestMapping(value = "/myapplication", method = RequestMethod.GET)
    public ModelAndView login(){
        logger.info("Trying to log in.");
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("user", new User());
        modelAndView.setViewName("index");
        return modelAndView;
    }


    @RequestMapping(value = "/myapplication/login/result", method = RequestMethod.GET)
    public ModelAndView loginResult(@AuthenticationPrincipal UserDetails userDetails){
        logger.info("login result.");
        User user = userService.findByUsername(userDetails.getUsername());
        ModelAndView modelAndView = new ModelAndView();
        Set<Role> roles = user.getRoles();
        for(Role user_role: roles){
            modelAndView.addObject("role", user_role.getName());
            System.out.println("\n" + user_role.getName() + "\n");
        }
        modelAndView.setViewName("login_result_page");
        return modelAndView;
    }
    @RequestMapping(value = "/admin", method = RequestMethod.POST)
    public ModelAndView adminAccount(@AuthenticationPrincipal UserDetails userDetails){
        User user = userService.findByUsername(userDetails.getUsername());
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("user", user);
        modelAndView.setViewName("admin_page");
        return modelAndView;
    }
}
