package com.popovich.springapp.service.imp;

import com.popovich.springapp.dao.DepartmentDao;
import com.popovich.springapp.model.Department;
import com.popovich.springapp.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class DepartmentServiceImpl implements DepartmentService {

    @Autowired
    private DepartmentDao departmentDao;

    @Override
    public void save(Department department) {
        departmentDao.save(department);
    }

    @Override
    public List<Department> getAllDepartment() {
        return departmentDao.findAll();
    }

    @Override
    public void deleteDepartment(Long id) {
        departmentDao.delete(id);
    }

    @Override
    public Department getById(Long id) {
        return departmentDao.findOne(id);
    }
}
