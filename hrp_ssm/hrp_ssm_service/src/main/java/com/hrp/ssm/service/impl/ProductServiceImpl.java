package com.hrp.ssm.service.impl;

import com.hrp.ssm.dao.ProductDao;
import com.hrp.ssm.domain.Product;
import com.hrp.ssm.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductDao productDao;

    @Override
    public void save(Product product) throws Exception {
        productDao.save(product);
    }


    @Override
    public List<Product> findAll() throws Exception {
        return productDao.findAll();
    }


}
