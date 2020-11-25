package com.hrp.ssm.service;

import com.hrp.ssm.domain.Orders;

import java.util.List;

/**
 * 订单的业务逻辑层
 * @author hp
 */
public interface OrdersService {

    List<Orders> findAll(int page,int size) throws Exception;

    Orders findById(String id) throws Exception;
}
