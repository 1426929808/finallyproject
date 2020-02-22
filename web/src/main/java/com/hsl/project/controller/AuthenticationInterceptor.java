package com.hsl.project.controller;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AuthenticationInterceptor implements HandlerInterceptor {

//    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
//        System.out.println("进入拦截器......");
//        HttpSession session = request.getSession();
//        String username = (String) session.getAttribute("username");
//        String userpwd = (String) session.getAttribute("userpwd");
//        if(username==null || userpwd==null ){
//            response.sendRedirect("/login");
//            return false;
//        }
//        return true;
//
//    }
}
