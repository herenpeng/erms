package com.hrp.ssm.service;

import com.alibaba.druid.wall.WallSQLException;
import com.hrp.ssm.domain.Permission;
import com.hrp.ssm.domain.Role;

import java.util.List;

public interface RoleService {


    void save(Role role) throws Exception;

    List<Role> findAll() throws Exception;

    Role findById(String roleId) throws Exception;

    List<Permission> findOtherPermission(String roleId) throws Exception;

    void addPermissionToRole(String roleId, String[] permissionIds) throws Exception;
}
