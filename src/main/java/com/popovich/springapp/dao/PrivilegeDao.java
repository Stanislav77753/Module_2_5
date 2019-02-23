package com.popovich.springapp.dao;

import com.popovich.springapp.model.Privilege;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PrivilegeDao extends JpaRepository<Privilege, Long> {
}
