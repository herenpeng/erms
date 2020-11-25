package com.hrp.ssm.service.impl;

import com.hrp.ssm.dao.PermissionDao;
import com.hrp.ssm.domain.Permission;
import com.hrp.ssm.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PermissionServiceImpl implements PermissionService {

    @Autowired
    private PermissionDao permissionDao;

    @Override
    public List<Permission> findAll() throws Exception {
        return permissionDao.findAll();
    }

    @Override
    public void save(Permission permission) throws Exception{
        permissionDao.save(permission);
    }
}
