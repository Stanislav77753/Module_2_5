package com.popovich.springapp.service.imp;

import com.popovich.springapp.dao.EmployeeDao;
import com.popovich.springapp.model.Employee;
import com.popovich.springapp.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    private EmployeeDao employeeDao;

    @Override
    public void save(Employee employee) {
        employeeDao.save(employee);
    }

    @Override
    public List<Employee> getAllEmployees() {
        return employeeDao.findAll();
    }
}
