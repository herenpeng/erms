package com.hrp.ssm.service.impl;

import com.hrp.ssm.dao.RoleDao;
import com.hrp.ssm.domain.Permission;
import com.hrp.ssm.domain.Role;
import com.hrp.ssm.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleDao roleDao;

    @Override
    public void save(Role role) throws Exception {
        roleDao.save(role);
    }

    @Override
    public List<Role> findAll() throws Exception {
        return roleDao.findAll();
    }

    @Override
    public Role findById(String roleId) throws Exception{
        return roleDao.findById(roleId);
    }

    @Override
    public List<Permission> findOtherPermission(String roleId) throws Exception {
        return roleDao.findOtherPermission(roleId);
    }

    @Override
    public void addPermissionToRole(String roleId, String[] permissionIds) throws Exception {
        for(String permissionId :permissionIds){
            roleDao.addPermissionToRole(roleId,permissionId);
        }
    }
}
