package com.popovich.springapp.service;

import com.popovich.springapp.model.Department;

import java.util.List;

public interface DepartmentService {
    void save(Department department);
    List<Department> getAllDepartment();
    void deleteDepartment(Long id);
    Department getById(Long id);
}
