package com.popovich.springapp.controller;


import com.popovich.springapp.model.Employee;
import com.popovich.springapp.model.Role;
import com.popovich.springapp.model.User;
import com.popovich.springapp.service.DepartmentService;
import com.popovich.springapp.service.EmployeeService;
import com.popovich.springapp.service.RoleService;
import com.popovich.springapp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;


@Controller
@RequestMapping("/myapplication/admin")
public class AdminController {

    @Autowired
    private DepartmentService departmentService;

    @Autowired
    private EmployeeService employeeService;

    @Autowired
    private RoleService roleService;

    @Autowired
    private UserService userService;

    public UserService getUserService() {
        return userService;
    }

    @RequestMapping( method = RequestMethod.GET)
    public ModelAndView adminAccount(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("admin_page");
        return modelAndView;
    }

    @RequestMapping(value = "/users", method = RequestMethod.GET)
    public String listUsers(Model model){
        model.addAttribute("user", new User());
        model.addAttribute("listUsers", this.userService.getAllUsers());
        return "admin_users_page";
    }

    @RequestMapping(value = "/users/add", method = RequestMethod.GET)
    public String addUser(Model model){
        model.addAttribute("user", new User());
        return "admin_add_user";
    }

    @RequestMapping(value = "/users/add", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("user") User user){
        userService.save(user);
        return "redirect:/myapplication/admin/users";
    }

    @RequestMapping(value = "/employees", method = RequestMethod.GET)
    public String listEmployees(Model model){
        model.addAttribute("user", new Employee());
        model.addAttribute("listEmployees", this.employeeService.getAllEmployees());
        return "admin_employees_page";
    }

    @RequestMapping("/users/edit/{id}")
    public String preEditUser(@PathVariable("id") Long id, Model model){
        List<Role> roles = this.roleService.getAllRoles();
        List<String> rol = new ArrayList<>();
        for(Role role : roles){
            rol.add(role.getName());
        }
        model.addAttribute("user", this.userService.getById(id));
        model.addAttribute("listUsers", this.userService.getAllUsers());
        model.addAttribute("all_roles", rol);
        return "admin_user_edit";
    }

    @RequestMapping("/users/delete/{id}")
    public String deleteUser(@PathVariable("id") Long id){
        userService.deleteUser(id);
        return "redirect:/myapplication/admin/users";
    }

    @RequestMapping("/users/edit/result")
    public String editUser(@ModelAttribute("user") User user){
        List<Role> roles = roleService.getAllRoles();
        Set<Role> newRoleSet = new HashSet<>();
        for(String str: user.getNewRole()){
            for(Role role: roles){
                if(role.getName().equals(str)){
                    newRoleSet.add(role);
                }
            }
        }
        user.setRoles(newRoleSet);
        userService.updateUser(user);
        return "redirect:/myapplication/admin/users";
    }
}
