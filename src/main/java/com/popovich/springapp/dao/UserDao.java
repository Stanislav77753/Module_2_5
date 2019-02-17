package com.popovich.springapp.dao;

import com.popovich.springapp.model.Role;
import com.popovich.springapp.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.Set;

public interface UserDao extends JpaRepository<User, Long> {
    User findByUserName(String userName);

    @Modifying
    @Query("update User u set u.userName = ?1, u.roles = ?2 where u.id = ?3")
    void updateUser(String userName, Set<Role> roles, Long id);
}
