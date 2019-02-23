package com.popovich.springapp.service.imp;

import com.popovich.springapp.dao.UserDao;
import com.popovich.springapp.model.Privilege;
import com.popovich.springapp.model.Role;
import com.popovich.springapp.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

public class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    private UserDao userDao;

    @Override
    @Transactional(readOnly = true)
    public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
        User user = userDao.findByUserName(userName);
        return new org.springframework.security.core.userdetails.User(user.getUserName(), user.getPassword(),
                getAuthorities(user.getRoles()));
    }

    private Set<GrantedAuthority> getAuthorities(Set<Role> roles){
        return getGrantedAuthorities(getPrivileges(roles));
    }

    private List<String> getPrivileges(Set<Role> roles){
        List<String> privileges = new ArrayList<>();
        List<Privilege> list_privileges = new ArrayList<>();
        for(Role role: roles){
            list_privileges.addAll(role.getPrivileges());
        }
        for (Privilege privilege : list_privileges) {
            privileges.add(privilege.getName());
        }
        return privileges;
    }

    private Set<GrantedAuthority> getGrantedAuthorities(List<String> privileges) {
        Set<GrantedAuthority> authorities = new HashSet<>();
        for (String privilege : privileges) {
            authorities.add(new SimpleGrantedAuthority(privilege));
        }
        return authorities;
    }


}
