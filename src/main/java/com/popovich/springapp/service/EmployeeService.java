package com.popovich.springapp.service;

import com.popovich.springapp.model.Employee;

import java.util.List;

public interface EmployeeService {

    void save(Employee employee);
    List<Employee> getAllEmployees();
}
