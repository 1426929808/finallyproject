package com.hsl.project.service.impl;

import com.hsl.project.dao.UsersInfoDao;
import com.hsl.project.entity.UsersInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserInfoService {

    @Autowired
    private UsersInfoDao usersInfoDao;

    public void insertusersinfo(UsersInfo usersInfo){
      usersInfoDao.insertusersinfo(usersInfo);
    }
}
