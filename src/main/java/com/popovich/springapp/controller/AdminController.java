package com.popovich.springapp.controller;

import com.popovich.springapp.model.Role;
import com.popovich.springapp.model.User;
import com.popovich.springapp.service.DepartmentService;
import com.popovich.springapp.service.EmployeeService;
import com.popovich.springapp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;


@Controller
public class AdminController {

    @Autowired
    private DepartmentService departmentService;

    @Autowired
    private EmployeeService employeeService;

    @Autowired
    private UserService userService;

    public UserService getUserService() {
        return userService;
    }

    @RequestMapping(value = "/myapplication/admin", method = RequestMethod.GET)
    public ModelAndView adminAccount(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("admin_page");
        return modelAndView;
    }

    @RequestMapping(value = "/myapplication/admin/users", method = RequestMethod.GET)
    public String listUsers(Model model){
        model.addAttribute("user", new User());
        model.addAttribute("listUsers", this.userService.getAllUsers());
        return "admin_users_page";
    }

    @RequestMapping("/myapplication/admin/users/pre_edit/{id}")
    public String preEditUser(@PathVariable("id") Long id, Model model){
        model.addAttribute("user", this.userService.getById(id));
        model.addAttribute("listUsers", this.userService.getAllUsers());
        return "admin_users_page";
    }

    @RequestMapping("/myapplication/admin/users/delete/{id}")
    public String deleteUser(@PathVariable("id") Long id){
        userService.deleteUser(id);
        return "redirect:/myapplication/admin/users";
    }

    @RequestMapping("/myapplication/admin/users/edit")
    public String editUser(@ModelAttribute("user") User user){
        userService.updateUser(user);
        return "redirect:/myapplication/admin/users";
    }
}
