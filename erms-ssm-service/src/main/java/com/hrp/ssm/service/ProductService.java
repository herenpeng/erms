package com.hrp.ssm.service;

import com.hrp.ssm.domain.Product;

import java.util.List;

public interface ProductService {

    public List<Product> findAll() throws Exception;

    void save(Product product) throws Exception;
}
