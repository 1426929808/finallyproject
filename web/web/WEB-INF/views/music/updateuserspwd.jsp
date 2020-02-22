<%--
  Created by IntelliJ IDEA.
  User: 黄一百
  Date: 2019/12/9
  Time: 20:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>updateuserspwd</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/static/layui/css/layui.css"  media="all">
</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
    <legend style="font-weight: bold">修改用户密码</legend>
</fieldset>
<form method="post" action="/updatepwdtijiao">
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
            <td style="font-weight: bold">用户名称:</td>
            <td style="font-weight: bold">
                <input type="text" name="username" readonly="readonly" value="${list.username}" /></td>
        </tr>
        <tr>
            <td style="font-weight: bold">用户原密码:</td>
            <td style="font-weight: bold">
                <input type="text" readonly="readonly"  value="${list.userpwd}"/></td>
        </tr>
        <tr>
            <td style="font-weight: bold">输入新密码:</td>
            <td style="font-weight: bold">
                <input type="text" name="userpwd"/></td>
        </tr>
        <tr>
            <td style="font-weight: bold">确认:</td>
            <td style="font-weight: bold"> <input type="submit" value="提交" style="width: 75px"/>
                <button style="width: 75px"><a href="/music/list">取消</a></button></td>
        </tr>
    </table>
<%--    用户名称:<input type="text" name="username" readonly="readonly" value="${list.username}" /><br>--%>
<%--    用户密码:<input type="text" readonly="readonly"  value="${list.userpwd}"/><br>--%>
<%--    输入新密码：<input type="text" name="userpwd"/>--%>
<%--    <br>--%>
<%--    <input type="submit" value="提交"/>--%>
<%--    <button><a href="/music/list">取消</a></button>--%>
</form>
</body>
</html>
