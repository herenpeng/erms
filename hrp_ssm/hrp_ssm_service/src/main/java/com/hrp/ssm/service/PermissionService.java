package com.hrp.ssm.service;

import com.hrp.ssm.domain.Permission;

import java.util.List;

public interface PermissionService {

    List<Permission> findAll() throws Exception;

    void save(Permission permission) throws Exception;
}
