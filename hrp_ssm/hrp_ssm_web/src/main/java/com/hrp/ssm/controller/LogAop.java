package com.hrp.ssm.controller;

import com.hrp.ssm.domain.SysLog;
import com.hrp.ssm.service.SysLogService;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.Date;

@Component
@Aspect
public class LogAop {
    @Autowired
    private HttpServletRequest request;

    @Autowired
    private SysLogService sysLogService;

    private Date visitTime;//访问的开始时间
    private Class clazz;//访问的类
    private Method method;//访问的方法

    /**
     * 前置通知：只要是获取这个方法的开始时间，执行的类是哪一个，执行的是哪一个方法
     *
     * @param jp
     */
    @Before("execution(* com.hrp.ssm.controller.*.*(..))")
    public void doBefore(JoinPoint jp) throws NoSuchMethodException {
        visitTime = new Date();//当前时间就是开始访问的 时间
        clazz = jp.getTarget().getClass();//具体要访问的类
        String methodName = jp.getSignature().getName();//获取访问的方法名称
        Object[] args = jp.getArgs();//获取当前访问方法的参数

        //获取具体执行的方法的method对象
        if (args == null || args.length == 0) {//根据当前的类和方法名获取无参数的方法
            method = clazz.getMethod(methodName);
        } else {//获取有参数的方法
            Class[] classArgs = new Class[args.length];
            for (int i = 0; i < args.length; i++){
                classArgs[i] = args[i].getClass();
            }
            method = clazz.getMethod(methodName, classArgs);
        }
    }

    /**
     * 后置通知
     *
     * @param jp
     */
    @After("execution(* com.hrp.ssm.controller.*.*(..))")
    public void doAfter(JoinPoint jp) throws Exception {
        Long time = System.currentTimeMillis() - visitTime.getTime();//获取访问的时长
        String url = "";
        //获取URL
        if(clazz != null && method != null && clazz != LogAop.class && clazz != SysLogController.class){
            //1、获取类上的@RequestMapping("/orders")
            RequestMapping classAnnotation = (RequestMapping) clazz.getAnnotation(RequestMapping.class);
            if(classAnnotation != null){
                String[] classValue = classAnnotation.value();
                //2、获取方法上的@RequestMapping()
                RequestMapping methodAnnotation = method.getAnnotation(RequestMapping.class);
                if(methodAnnotation != null){
                    String[] methodValue = methodAnnotation.value();
                    //拼接url
                    url = classValue[0]+methodValue[0];

                    //获取访问的ip地址
                    String ip = request.getRemoteAddr();
                    //如何获取当前用户
                    SecurityContext context = SecurityContextHolder.getContext();//从上下文中获取当前登录的用户
                    User user = (User) context.getAuthentication().getPrincipal();
                    String username = user.getUsername();

                    //将日志的相关信息封装到SysLog对象中
                    SysLog sysLog = new SysLog();
                    sysLog.setVisitTime(visitTime);
                    sysLog.setUsername(username);
                    sysLog.setIp(ip);
                    sysLog.setUrl(url);
                    sysLog.setExecutionTime(time);
                    sysLog.setMethod("[类名]"+clazz.getName()+"[方法名]"+method.getName());
                    sysLogService.save(sysLog);
                }
            }
        }
    }


}
