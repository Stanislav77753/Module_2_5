package com.popovich.springapp.service;

import com.popovich.springapp.model.Department;

import java.util.List;

public interface DepartmentService {
    void save(Department department);
    List<Department> getAllDepartment();
}
