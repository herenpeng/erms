package com.hrp.ssm.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import com.hrp.ssm.domain.Orders;
import com.hrp.ssm.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/orders")
public class OrdersController {

    @Autowired
    private OrdersService ordersService;

    //查询全部订单--未分页
    /*@RequestMapping("/findAll.do")
    public ModelAndView findAll() throws Exception {
        ModelAndView mv = new ModelAndView();
        List<Orders> ordersList = ordersService.findAll();
        mv.addObject("ordersList",ordersList);
        mv.setViewName("orders-list");
        return mv;
    }*/

    @RequestMapping("/findAll.do")
    @Secured("ROLE_ADMIN")
    public ModelAndView findAll(@RequestParam(name = "page", required = true, defaultValue = "1") Integer page, @RequestParam(name = "size", required = true, defaultValue = "4") Integer size) throws Exception {
        ModelAndView mv = new ModelAndView();
        List<Orders> ordersList = ordersService.findAll(page, size);
        //PageInfo就是一个分页的bean
        PageInfo pageInfo = new PageInfo(ordersList);
        mv.addObject("pageInfo", pageInfo);
        mv.setViewName("orders-page-list");
        return mv;
    }

    @RequestMapping("/findById.do")
    public ModelAndView findById(String id) throws Exception {
        ModelAndView mv = new ModelAndView();
        Orders orders = ordersService.findById(id);
        mv.addObject("orders",orders);
        mv.setViewName("orders-show");
        return mv;
    }

}
