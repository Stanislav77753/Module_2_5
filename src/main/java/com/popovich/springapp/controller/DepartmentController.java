package com.popovich.springapp.controller;

import com.popovich.springapp.model.Department;
import com.popovich.springapp.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/myapplication")
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;

    @RequestMapping(value = "/**/departments", method = RequestMethod.GET)
    public String listDepartments(Model model){
        model.addAttribute("department", new Department());
        model.addAttribute("listDepartments", this.departmentService.getAllDepartment());
        return "department_page";
    }

    @RequestMapping(value = "/**/departments/add", method = RequestMethod.GET)
    public String addDepartment(Model model){
        model.addAttribute("department", new Department());
        return "department_add_page";
    }

    @RequestMapping(value = "/**/departments/add", method = RequestMethod.POST)
    public String addDepartment(@ModelAttribute("department") Department department, Principal principal){
        departmentService.save(department);
        if(principal.getName().equals("Moderator")){
            return "redirect:/myapplication/moderator/departments";
        }
        return "redirect:/myapplication/admin/departments";
    }

    @RequestMapping(value = "/**/departments/delete/{id}")
    public String deleteDepartment(@PathVariable("id") Long id, Principal principal){
        departmentService.deleteDepartment(id);
        if(principal.getName().equals("Moderator")){
            return "redirect:/myapplication/moderator/departments";
        }
        return "redirect:/myapplication/admin/departments";
    }

    @RequestMapping(value = "/**/departments/edit/{id}")
    public String preEditUser(@PathVariable("id") Long id, Model model){
        model.addAttribute("department", this.departmentService.getById(id));
        return "department_edit_page";
    }
    @RequestMapping(value = "/**/departments/edit/result")
    public String editUser(@ModelAttribute("department") Department department,  Principal principal){
        departmentService.save(department);
        if(principal.getName().equals("Moderator")){
            return "redirect:/myapplication/moderator/departments";
        }
        return "redirect:/myapplication/admin/departments";
    }
}
