package com.popovich.springapp.controller;

import com.popovich.springapp.model.Department;
import com.popovich.springapp.model.Employee;
import com.popovich.springapp.service.DepartmentService;
import com.popovich.springapp.service.EmployeeService;
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

    @RequestMapping("/**/employees/edit/{id}")
    public String preEditEmployee(@PathVariable("id") Long id, Model model){
        List<Department> departments = this.departmentService.getAllDepartment();
        List<String> all_department = new ArrayList<>();
        for(Department department: departments){
            all_department.add(department.getName());
        }
        Employee employee = this.employeeService.getById(id);
        employee.setDepartmentName(employee.getDepartment().getName());
        model.addAttribute("departmentsList", all_department);
        model.addAttribute("employee", employee);
        return "employee_edit_page";
    }

    @RequestMapping("/**/employees/delete/{id}")
    public String deleteEmployee(@PathVariable("id") Long id, Principal principal){
        employeeService.deleteEmployee(id);
        if(principal.getName().equals("Moderator")){
            return "redirect:/myapplication/moderator/employees";
        }
        return "redirect:/myapplication/admin/employees";
    }

    @RequestMapping("/**/employees/edit/result")
    public String editUser(@ModelAttribute("employee") Employee employee, Principal principal){
        employee.setDepartment(getActualDepartment(employee.getDepartmentName()));
        employeeService.save(employee);
        if(principal.getName().equals("Moderator")){
            return "redirect:/myapplication/moderator/employees";
        }
        return "redirect:/myapplication/admin/employees";
    }

    private Department getActualDepartment(String departmentName){
        List<Department> departments = this.departmentService.getAllDepartment();
        for(Department department: departments){
            if(department.getName().equals(departmentName)){
                return department;
            }
        }
        return null;
    }

}
