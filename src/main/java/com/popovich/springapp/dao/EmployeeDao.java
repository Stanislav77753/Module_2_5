package com.popovich.springapp.dao;

import com.popovich.springapp.model.Employee;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EmployeeDao extends JpaRepository<Employee, Long> {
}
