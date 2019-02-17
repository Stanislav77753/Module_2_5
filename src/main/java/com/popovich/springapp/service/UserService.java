package com.popovich.springapp.service;

import com.popovich.springapp.model.User;

import java.util.List;

public interface UserService {

    void save(User user);

    User findByUsername(String userName);
    List<User> getAllUsers();
    User getById(Long id);
    void deleteUser(Long id);
    void updateUser(User user);
}
