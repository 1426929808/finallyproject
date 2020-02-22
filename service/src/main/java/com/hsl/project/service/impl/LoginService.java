package com.hsl.project.service.impl;

import com.hsl.project.dao.LoginDao;
import com.hsl.project.entity.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class LoginService {
    @Autowired
    private LoginDao dao;

    public List<Users> getAllUsers(int pageNum,int pageSize){
        return dao.getAllUsers(pageNum,pageSize);
    }
    public void updateuserspwd(Users users){
        dao.updateuserspwd(users);
    }

    public void deleteusers(String username){
         dao.deleteusers(username);
    }
    public Users selectOne(String username){
      return   dao.selectOne(username);
    }

    public void insertusers(String username,String userpwd,String usertype){
        dao.insertusers(username,userpwd,usertype);
    }

    @Transactional
    public Users LoginNameAndPwd(String username,String userpwd){
        return dao.LoginNameAndPwd(username,userpwd);
    }
    @Transactional
    public String AccountType(String username,String userpwd){
        return dao.AccountType(username,userpwd);
    }
    @Transactional
    public String LoginType(String usertype,String username){
        return dao.LoginType(usertype,username);
    }
}
