package com.hrp.ssm.controller;

import com.hrp.ssm.domain.Permission;
import com.hrp.ssm.domain.Role;
import com.hrp.ssm.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * 角色实体的Controller
 * @author hp
 */
@Controller
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private RoleService roleService;

    /**
     * 给角色添加权限的方法
     */
    @RequestMapping("/addPermissionToRole.do")
    public String addPermissionToRole(String roleId,@RequestParam(name = "ids",required = true) String[] permissionIds) throws Exception{
        roleService.addPermissionToRole(roleId,permissionIds);
        return "redirect:findAll.do";
    }

    /**
     * 根据role的id查询role，并查询出可以添加的权限
     * @param roleId
     * @return
     * @throws Exception
     */
    @RequestMapping("/findRoleByIdAndAllPermission.do")
    public ModelAndView findRoleByIdAndAllPermission(String roleId) throws Exception{
        ModelAndView mv = new ModelAndView();
        //根据roleId查询role
        Role role = roleService.findById(roleId);
        //根据roleId查询可以添加的角色
        List<Permission> Otherpermission = roleService.findOtherPermission(roleId);
        mv.addObject("role",role);
        mv.addObject("permissionList",Otherpermission);
        mv.setViewName("role-permission-add");
        return mv;
    }

    /**
     * 查找所有的role信息
     * @return
     * @throws Exception
     */
    @RequestMapping("/findAll.do")
    public ModelAndView findAll() throws Exception {
        ModelAndView mv = new ModelAndView();
        List<Role> rolelist = roleService.findAll();
        mv.addObject("roleList",rolelist);
        mv.setViewName("role-list");
        return mv;
    }

    /**
     * 保存一个role信息
     * @param role
     * @return
     * @throws Exception
     */
    @RequestMapping("/save.do")
    public String save(Role role) throws Exception{
        System.out.println(role.getRoleName()+"--"+role.getRoleDesc());
        roleService.save(role);
        return "redirect:findAll.do";
    }
}
