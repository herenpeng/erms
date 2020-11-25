package com.hrp.ssm.dao;

import com.hrp.ssm.domain.Traveller;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface TravellerDao {

    /**
     * 通过ordersId查找旅客信息
     * @param ordersId
     * @return
     * @throws Exception
     */
    @Select("select * from traveller where id in (select travellerId from orders_traveller where ordersId = #{ordersId})")
    public List<Traveller> findByOrdersId(String ordersId) throws Exception;
}
