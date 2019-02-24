package com.popovich.springapp.service.imp;

import com.popovich.springapp.dao.RoleDao;
import com.popovich.springapp.model.Role;
import com.popovich.springapp.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class RoleServiceImpl implements RoleService {

    public RoleServiceImpl() {
    }

    @Autowired
    private RoleDao roleDao;

    @Override
    public List<Role> getAllRoles() {
        return roleDao.findAll();
    }
}
