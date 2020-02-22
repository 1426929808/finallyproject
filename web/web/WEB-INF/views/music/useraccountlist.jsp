<%--
  Created by IntelliJ IDEA.
  User: 黄一百
  Date: 2019/12/6
  Time: 11:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>用户列表</title>

    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/static/layui/css/layui.css"  media="all">
</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
    <legend style="font-weight: bold">管理用户</legend>
</fieldset>
<button style="margin-left: 410px"><a href="/music/list">返回主界面</a></button>
<table>
    <colgroup>
        <col width="100">
        <col width="100">
        <col width="150">
        <col>
    </colgroup>
    <thead>
    <tr>
        <th style="font-weight: bold"><h2>用户名称</h2></th>
        <th style="font-weight: bold"><h2>用户密码</h2></th>
        <th style="font-weight: bold"><h2>身份</h2></th>
        <th style="font-weight: bold"><h2>操作</h2></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list.list}" var="users">
        <tr>
            <td>${users.username}</td>
            <td>${users.userpwd}</td>
            <td>${users.usertype}</td>
            <td><button><a href="/deleteuser?username=${users.username}">删除</a></button>
                <button><a href="/updateuserspwd?username=${users.username}">修改用户密码</a></button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
<%--    <tr>--%>
<%--        <th>用户名称</th>--%>
<%--        <th>用户密码</th>--%>
<%--        <th>身份</th>--%>
<%--        <th>操作</th>--%>
<%--    </tr>--%>
<%--    <c:forEach items="${list.list}" var="users">--%>
<%--        <tr>--%>
<%--            <td>${users.username}</td>--%>
<%--            <td>${users.userpwd}</td>--%>
<%--            <td>${users.usertype}</td>--%>
<%--            <td><button><a href="/deleteuser?username=${users.username}">删除</a></button>--%>
<%--                <button><a href="/updateuserspwd?username=${users.username}">修改用户密码</a></button>--%>
<%--                </td>--%>
<%--        </tr>--%>
<%--    </c:forEach>--%>
</table>
<br>
<br>

<ul class="pagination" style="font-weight: bold">
    <a href="/getallusers?pageNum=1"> 首页</a>
    <a href="/getallusers?pageNum=${list.prePage}"> 上一页</a>
    <c:forEach items="${list.navigatepageNums}" var="p">
        <a href="/getallusers?pageNum=${p}"> ${p}</a>
    </c:forEach>
    <a href="/getallusers?pageNum=${list.nextPage}"> 下一页</a>
    <a href="/getallusers?pageNum=${list.pages}"> 尾页</a>

</ul>
</body>
</html>
