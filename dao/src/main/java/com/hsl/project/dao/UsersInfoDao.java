package com.hsl.project.dao;

import com.hsl.project.entity.UsersInfo;
import org.apache.ibatis.annotations.Param;

public interface UsersInfoDao {
    void insertusersinfo(UsersInfo usersInfo);
}
