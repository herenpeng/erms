package com.hrp.ssm.service;

import com.hrp.ssm.domain.SysLog;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 日志的service
 * @author hp
 */
public interface SysLogService {

    void save(SysLog sysLog) throws Exception;

    List<SysLog> findAll() throws Exception;
}
