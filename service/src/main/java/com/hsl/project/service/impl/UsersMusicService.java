package com.hsl.project.service.impl;

import com.hsl.project.dao.UsersListDao;
import com.hsl.project.entity.UsersMusic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UsersMusicService {
    @Autowired
    private UsersListDao usersListDao;

   public List<UsersMusic> getusersmusic(int pageNum,int pageSize,
                                         String username){
      return   usersListDao.getallmusic(pageNum,pageSize,username);
    }
    public void  insertmusictouserslist(UsersMusic usersMusic){
       usersListDao.insertmusictouserslist(usersMusic);
    }
    public void deleteusermusic(int musicid){
       usersListDao.deleteusermusic(musicid);
    }
    public List<UsersMusic> getsomemusic(String musicname){
       return usersListDao.getSomeMusic(musicname);
    }
    public List<UsersMusic> getStyleMusic(String musicstyle){
       return usersListDao.getStyleMusic(musicstyle);
    }

}
