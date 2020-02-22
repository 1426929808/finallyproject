package com.hsl.project.dao;


import com.hsl.project.entity.Music;
import com.hsl.project.entity.UsersMusic;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UsersListDao {
    List<UsersMusic> getallmusic(@Param("pageNum") int pageNum,
                                 @Param("pageSize") int pageSize,
                                 @Param("username")String username);
    void insertmusictouserslist(UsersMusic usersMusic);

    void deleteusermusic(@Param("musicid") int musicid);

    List<UsersMusic> getSomeMusic(@Param("musicname") String musicname);

    List<UsersMusic> getStyleMusic(@Param("musicstyle")String musicstyle);
}
