package com.popovich.springapp.controller;

import com.popovich.springapp.model.Department;
import com.popovich.springapp.model.Employee;
import com.popovich.springapp.service.DepartmentService;
import com.popovich.springapp.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/myapplication")
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    @Autowired
    private DepartmentService departmentService;

    @RequestMapping(value = "/**/employees", method = RequestMethod.GET)
    public String listEmployees(Model model){
        model.addAttribute("employee", new Employee());
        model.addAttribute("listEmployees", this.employeeService.getAllEmployees());
        return "employees_page";
    }

    @RequestMapping(value = "/**/employees/add", method = RequestMethod.GET)
    public String addEmployee(Model model){
        List<Department> all_departs = this.departmentService.getAllDepartment();
        List<String> departments = new ArrayList<>();
        for(Department department: all_departs){
            departments.add(department.getName());
        }
        model.addAttribute("departmentsList", departments);
        model.addAttribute("employee", new Employee());
        return "employee_add_page";
    }

    @RequestMapping(value = "/**/employees/add", method = RequestMethod.POST)
    public String addEmployee(@ModelAttribute("employee") Employee employee, Principal principal){
        List<Department> departments = this.departmentService.getAllDepartment();
        for(Department department: departments){
            if(department.getName().equals(employee.getDepartmentName())){
                employee.setDepartment(department);
            }
        }
        employeeService.save(employee);
        if(principal.getName().equals("Moderator")){
            return "redirect:/myapplication/moderator/employees";
        }
        return "redirect:/myapplication/admin/employees";
    }
}
