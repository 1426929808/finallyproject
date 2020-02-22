<%--
  Created by IntelliJ IDEA.
  User: 黄一百
  Date: 2019/12/10
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>my info</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/static/layui/css/layui.css"  media="all">
</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
    <legend style="font-weight: bold">修改个人信息</legend>
</fieldset>

<form action="/usersmusic/insertuserinfo" method="post">
    <table class="layui-table" lay-even="" lay-skin="nob">
        <colgroup>
            <col width="50">
            <col width="50">
            <col width="100">
            <col>
        </colgroup>
        <thead>
        <tr>
            <th style="font-weight: bold"><h2>信息</h2></th>
            <th style="font-weight: bold"><h2>操作</h2></th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td style="font-weight: bold">用户性别:</td>
            <td style="font-weight: bold">
                <select name="usersex">
                    <option value="男">男</option>
                    <option value="女">女</option>
                </select></td>
        </tr>
        <tr>
            <td style="font-weight: bold">用户头像:</td>
            <td style="font-weight: bold">
                <input type="file" name="userimg"/></td>
        </tr>
        <tr>
            <td style="font-weight: bold">用户电话:</td>
            <td style="font-weight: bold">
                <input type="text" name="userphone"/></td>
        </tr>
        <tr>
            <td style="font-weight: bold">用户地址:</td>
            <td style="font-weight: bold">
                <input type="text" name="useraddress"/></td>
        </tr>
        <tr>
            <td style="font-weight: bold">用户名称:</td>
            <td style="font-weight: bold">
                <input type="text" readonly="readonly" name="username" value="${account}"/></td>
        </tr>
        <tr>
            <td style="font-weight: bold">确认:</td>
            <td style="font-weight: bold"> <input type="submit" value="完成" style="width: 75px"/>
                <button style="width: 75px"><a href="/musiclist">取消</a></button></td>
        </tr>
        </tbody>
    </table>
<%--    用户编号：<input type="text" name="userid"/><br>--%>
<%--    用户性别：<select name="usersex">--%>
<%--                    <option value="男">男</option>--%>
<%--                    <option value="女">女</option>--%>
<%--              </select><br>--%>

<%--    用户头像：<input type="file" name="userimg"/><br>--%>
<%--    用户电话：<input type="text" name="userphone"/><br>--%>
<%--    用户地址：<input type="text" name="useraddress"/><br>--%>
<%--    用户名称：<input type="text" readonly="readonly" name="username" value="${account}"/><br>--%>
<%--    <input type="submit" value="完成"/>--%>
<%--    <button><a href="/musiclist">取消</a></button>--%>
</form>
</body>
</html>
