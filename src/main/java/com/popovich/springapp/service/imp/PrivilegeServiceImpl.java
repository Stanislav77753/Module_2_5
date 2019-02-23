package com.popovich.springapp.service.imp;

import com.popovich.springapp.dao.PrivilegeDao;
import com.popovich.springapp.model.Privilege;
import com.popovich.springapp.service.PrivilegeService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

public class PrivilegeServiceImpl implements PrivilegeService {

    public PrivilegeServiceImpl() {
    }

    @Autowired
    PrivilegeDao privilegeDao;

    @Override
    public List<String> getUserPrivileges(Long role_id) {
        List<Privilege> privilegies = privilegeDao.findAll();
        List<String> user_privilegies = new ArrayList<>();
        for(Privilege privilege: privilegies){
            if(role_id == privilege.getId()){
                user_privilegies.add(privilege.getName());
            }
        }
        return user_privilegies;
    }
}
