package com.hrp.ssm.dao;

import com.alibaba.druid.wall.WallSQLException;
import com.hrp.ssm.domain.Role;
import com.hrp.ssm.domain.UserInfo;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface UserDao {

    @Select("select * from user where username = #{username}")
    @Results({
            @Result(id=true,property = "id",column = "id"),
            @Result(property = "email",column = "email"),
            @Result(property = "username",column = "username"),
            @Result(property = "password", column = "password"),
            @Result(property = "phoneNum", column = "phoneNum"),
            @Result(property = "status", column = "status"),
            @Result(property = "roles" ,column = "id",javaType = java.util.List.class,many = @Many(select = "com.hrp.ssm.dao.RoleDao.findRoleByUserId"))
    })
    public UserInfo findByUsername(String username) throws Exception;

    @Select("select * from user")
    List<UserInfo> findAll() throws Exception;

    @Insert("insert into user values(uuid(),#{email},#{username},#{password},#{phoneNum},#{status})")
    void save(UserInfo userInfo) throws Exception;

    @Select("select * from user where id = #{id}")
    @Results({
            @Result(id=true,property = "id",column = "id"),
            @Result(property = "email",column = "email"),
            @Result(property = "username",column = "username"),
            @Result(property = "password", column = "password"),
            @Result(property = "phoneNum", column = "phoneNum"),
            @Result(property = "status", column = "status"),
            @Result(property = "roles" ,column = "id",javaType = java.util.List.class,many = @Many(select = "com.hrp.ssm.dao.RoleDao.findRoleByUserId"))

    })
    UserInfo findById(String id) throws Exception;

    @Select("select * from role where id not in (select roleId from user_role where userId = #{id})")
    List<Role> findOtherRoles(String id);

    @Insert("insert into user_role values(#{userId},#{roleId})")
    void addRoleToUser(@Param("userId") String userId,@Param("roleId") String roleId);
}
