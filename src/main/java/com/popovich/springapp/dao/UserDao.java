package com.popovich.springapp.dao;

import com.popovich.springapp.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserDao extends JpaRepository<User, Long> {
    User findByUserName(String userName);
}
