package com.popovich.springapp.service;

import java.util.List;

public interface PrivilegeService {

    List<String> getUserPrivileges(Long role_id);
}
