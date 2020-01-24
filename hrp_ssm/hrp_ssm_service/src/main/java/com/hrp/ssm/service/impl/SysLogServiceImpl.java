package com.hrp.ssm.service.impl;

import com.hrp.ssm.dao.SysLogDao;
import com.hrp.ssm.domain.SysLog;
import com.hrp.ssm.service.SysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author hp
 */
@Service
public class SysLogServiceImpl implements SysLogService {

    @Autowired
    private SysLogDao sysLogDao;

    @Override
    public void save(SysLog sysLog) throws Exception{
        sysLogDao.save(sysLog);
    }

    @Override
    public List<SysLog> findAll() throws Exception{
        return sysLogDao.findAll();
    }
}
