<%--
  Created by IntelliJ IDEA.
  User: 黄一百
  Date: 2019/12/5
  Time: 8:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <meta charset="utf-8">
    <title>Update Music</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/static/layui/css/layui.css"  media="all">
</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
    <legend style="font-weight: bold">修改歌曲信息</legend>
</fieldset>
<form method="post" action="/music/updatetijiao" enctype="multipart/form-data" >
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
            <td style="font-weight: bold">歌曲编号:</td>
            <td style="font-weight: bold">
                <input type="text" name="musicid" readonly="readonly" value="${list.musicid}" /></td>
        </tr>
        <tr>
            <td style="font-weight: bold">歌曲名称:</td>
            <td style="font-weight: bold">
                <input type="text" name="musicname" value="${list.musicname}"/></td>
        </tr>
        <tr>
            <td style="font-weight: bold">歌曲类型:</td>
            <td style="font-weight: bold">
                <input type="text" readonly="readonly" value="${list.musicstyle}"/>
                <select name="musicstyle" value="${list.musicstyle}">
                    <option value="流行">流行</option>
                    <option value="欧美">欧美</option>
                    <option value="民谣">民谣</option>
                    <option value="摇滚">摇滚</option>
                    <option value="纯音乐">纯音乐</option>
                </select></td>
        </tr>
        <tr>
            <td style="font-weight: bold">歌曲语言:</td>
            <td style="font-weight: bold">
                <input type="text" readonly="readonly" value="${list.musiclanguage}"/>
                <select name="musiclanguage" value="${list.musiclanguage}">
                    <option value="汉语">汉语</option>
                    <option value="英语">英语</option>
                    <option value="日语">日语</option>
                    <option value="韩语">韩语</option>
                    <option value="纯音乐">纯音乐</option>
                </select></td>
        </tr>
        <tr>
            <td style="font-weight: bold">歌曲时长:</td>
            <td style="font-weight: bold">
                <input type="text" name="musictime" value="${list.musictime}"/></td>
        </tr>
        <tr>
            <td style="font-weight: bold">歌曲路径:</td>
            <td style="font-weight: bold">
                <input type="file" name="myfilemusic" id="myfilemusic" value="${list.musicurl}"/></td>
        </tr>
        <tr>
            <td style="font-weight: bold">歌曲封面:</td>
            <td style="font-weight: bold">
                <input type="file" name="myfileimg" value="${list.musiccover}"/></td>
        </tr>
        <tr>
            <td style="font-weight: bold">确认:</td>
            <td style="font-weight: bold"> <input type="submit" value="提交" style="width: 75px"/>
                <button style="width: 75px"><a href="/music/list">取消</a></button></td>
        </tr>
        </tbody>
    </table>
<%--    歌曲编号:<input type="text" name="musicid" readonly="readonly" value="${list.musicid}" /><br>--%>
<%--    歌曲名称:<input type="text" name="musicname" value="${list.musicname}"/><br>--%>
<%--    歌曲类型:<input type="text" readonly="readonly" value="${list.musicstyle}"/>--%>
<%--    <select name="musicstyle" value="${list.musicstyle}">--%>
<%--        <option value="流行">流行</option>--%>
<%--        <option value="欧美">欧美</option>--%>
<%--        <option value="民谣">民谣</option>--%>
<%--        <option value="摇滚">摇滚</option>--%>
<%--        <option value="纯音乐">纯音乐</option>--%>
<%--    </select><br>--%>
<%--    歌曲语言:<input type="text" readonly="readonly" value="${list.musiclanguage}"/>--%>
<%--    <select name="musiclanguage" value="${list.musiclanguage}">--%>
<%--        <option value="汉语">汉语</option>--%>
<%--        <option value="英语">英语</option>--%>
<%--        <option value="日语">日语</option>--%>
<%--        <option value="韩语">韩语</option>--%>
<%--        <option value="纯音乐">纯音乐</option>--%>
<%--    </select><br>--%>
<%--    歌曲时长:<input type="text" name="musictime" value="${list.musictime}"/><br>--%>
<%--    歌曲路径:<input type="file" name="myfilemusic" id="myfilemusic" value="${list.musicurl}"/><br>--%>
<%--    歌曲封面:<input type="file" name="myfileimg" value="${list.musiccover}"/>--%>
<%--    <br>--%>
<%--    <input type="submit" value="提交"/>--%>
<%--    <button><a href="/music/list">取消</a></button>--%>
</form>
</body>
<script>
    alert($("#myfilemusic"));
</script>
</html>
