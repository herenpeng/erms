package com.hrp.ssm.dao;

import com.hrp.ssm.domain.Member;
import com.hrp.ssm.domain.Orders;
import com.hrp.ssm.domain.Product;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author hp
 */
public interface OrdersDao {

    @Select("select * from orders")
    @Results({
            @Result(id=true, property = "id",column = "id"),
            @Result(property = "orderNum",column = "orderNum"),
            @Result(property = "orderTime",column = "orderTime"),
            @Result(property = "orderStatus",column = "orderStatus"),
            @Result(property = "peopleCount",column = "peopleCount"),
            @Result(property = "payType",column = "payType"),
            @Result(property = "orderDesc",column = "orderDesc"),
            @Result(property = "product",column = "productId",javaType = Product.class,one = @One(select = "com.hrp.ssm.dao.ProductDao.findById"))
    })
    public List<Orders> findAll() throws Exception;

    @Select("select * from orders where id = #{id}")
    @Results({
            @Result(id=true, property = "id",column = "id"),
            @Result(property = "orderNum",column = "orderNum"),
            @Result(property = "orderTime",column = "orderTime"),
            @Result(property = "orderStatus",column = "orderStatus"),
            @Result(property = "peopleCount",column = "peopleCount"),
            @Result(property = "payType",column = "payType"),
            @Result(property = "orderDesc",column = "orderDesc"),
            @Result(property = "product",column = "productId",javaType = Product.class,one = @One(select = "com.hrp.ssm.dao.ProductDao.findById")),
            @Result(property = "member",column = "memberId",javaType = Member.class,one = @One(select = "com.hrp.ssm.dao.MemberDao.findById")),
            @Result(property = "travellers",column = "id",javaType = java.util.List.class,many = @Many(select = "com.hrp.ssm.dao.TravellerDao.findByOrdersId"))
    })
    Orders findById(String id) throws Exception;
}
