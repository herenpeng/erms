package com.hrp.ssm.service;

import com.alibaba.druid.wall.WallSQLException;
import com.hrp.ssm.domain.Role;
import com.hrp.ssm.domain.UserInfo;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface UserService extends UserDetailsService {


    List<UserInfo> findAll() throws Exception;

    void save(UserInfo userInfo) throws Exception;

    UserInfo findById(String id) throws Exception;

    List<Role> findOtherRoles(String id) throws Exception;

    void addRoleToUser(String userId, String[] roleIds);
}
