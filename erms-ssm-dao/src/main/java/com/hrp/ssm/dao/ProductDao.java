package com.hrp.ssm.dao;

import com.hrp.ssm.domain.Product;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ProductDao {

    /**
     * 根据id查询产品的
     * @param id
     * @return
     * @throws Exception
     */
    @Select("select * from product where id = #{id}")
    public Product findById(String id) throws Exception;

    /**
     * 查询所有的商品信息
     */
    @Select("select * from product")
    public List<Product> findAll() throws Exception;

    /**
     * 添加产品
     * @param product
     */
    @Insert("insert into product values(uuid(),#{productNum},#{productName},#{cityName},#{departureTime}," +
            "#{productPrice},#{productDesc},#{productStatus})")
    void save(Product product);
}
