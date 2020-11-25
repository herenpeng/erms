package com.hrp.ssm.service.impl;

import com.github.pagehelper.PageHelper;
import com.hrp.ssm.dao.OrdersDao;
import com.hrp.ssm.domain.Orders;
import com.hrp.ssm.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author hp
 */
@Service
@Transactional
public class OrdersServiceImpl implements OrdersService {

    @Autowired
    private OrdersDao ordersDao;

    @Override
    public List<Orders> findAll(int page,int size) throws Exception {
        //参数pageNum是页码值，pageSize代表的是每页显示的条数
        PageHelper.startPage(page,size);
        return ordersDao.findAll();
    }

    @Override
    public Orders findById(String id) throws Exception{
        return ordersDao.findById(id);
    }
}
