package com.hrp.ssm.controller;

import com.hrp.ssm.domain.Role;
import com.hrp.ssm.domain.UserInfo;
import com.hrp.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 给用户添加角色
     */
    @RequestMapping("/addRoleToUser.do")
    public String addRoleToUser(String userId,@RequestParam(name = "ids",required = true) String[] roleIds){
        userService.addRoleToUser(userId,roleIds);
        return "redirect:findAll.do";
    }

    /**
     * 查询用户，以及用户可以添加的角色
     * @return
     */
    @RequestMapping("/findUserByIdAndAllRole.do")
    public ModelAndView findUserByIdAndAllRole(String id) throws Exception{
        ModelAndView mv = new ModelAndView();
        //1、根据用户的id查询用户
        UserInfo userInfo = userService.findById(id);
        //2、根据用户id查询可以添加的角色
        List<Role> otherRoles = userService.findOtherRoles(id);
        mv.addObject("userInfo",userInfo);
        mv.addObject("roleList",otherRoles);
        mv.setViewName("user-role-add");
        return mv;
    }

    /**
     * 查询指定查询的用户
     */
    @RequestMapping("/findById.do")
    public ModelAndView findById(String id) throws Exception{
        ModelAndView mv = new ModelAndView();
        UserInfo userInfo = userService.findById(id);
        mv.addObject("userinfo",userInfo);
        mv.setViewName("user-show");
        return mv;
    }

    /**
     * 查询所有的用户信息
     * @return
     * @throws Exception
     */
    @RequestMapping("/findAll.do")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public ModelAndView findAll() throws Exception{
        ModelAndView mv = new ModelAndView();
        List<UserInfo> userlist = userService.findAll();
        mv.addObject("userList",userlist);
        mv.setViewName("user-list");
        return mv;
    }

    /**
     * 保存用户信息
     * @param userInfo
     * @return
     * @throws Exception
     */
    @RequestMapping("/save.do")
    @PreAuthorize("authentication.principal.username == 'admin'")
    public String save(UserInfo userInfo) throws Exception{
        userService.save(userInfo);
        return "redirect:findAll.do";
    }



}
