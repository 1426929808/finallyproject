package com.hsl.project.dao;

import com.hsl.project.entity.Users;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface LoginDao {
//验证账号密码
    Users LoginNameAndPwd(@Param("username") String username, @Param("userpwd") String userpwd);

    String AccountType(@Param("username") String username, @Param("userpwd") String userpwd);
//    验证账号类型
    String LoginType(@Param("usertype")String usertype,@Param("username") String username);

    void insertusers(@Param("username") String username, @Param("userpwd" ) String userpwd, @Param("usertype" ) String usertype);

    List<Users> getAllUsers(@Param("pageNum")int pageNum,
                            @Param("pageSize")int pageSize);

    void deleteusers(@Param("username") String username);

    Users selectOne(@Param("username") String username);

    void updateuserspwd(Users users);
}
