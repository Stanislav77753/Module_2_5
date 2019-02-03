package com.popovich.springapp.dao;

import com.popovich.springapp.model.Department;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DepartmentDao extends JpaRepository<Department, Long> {
}
