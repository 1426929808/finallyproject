<%--
  Created by IntelliJ IDEA.
  User: 黄一百
  Date: 2019/12/10
  Time: 10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>usersmusiclist</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>
    <link href="/static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
    <script src="/static/layui/layui.js"></script>
    <link rel="stylesheet" href="/static/layui/css/layui.css" media="all">
</head>
<body class="layui-layout-body" style="background-image:url('/music/download2?filename=音乐2.jpg');background-size: contain">

<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">我的歌单</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">控制台</a></li>
            <li class="layui-nav-item"><a href="">歌曲管理</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它系统</a>
                <dl class="layui-nav-child">
                    <dd><a href="">邮件管理</a></dd>
                    <dd><a href="">消息管理</a></dd>
                </dl>
            </li>
        </ul>
        <div>
            <form action="/music/useresongstsomemusic" method="post">
                <input type="text" style="width: 240px;height: 35px;margin-left: 670px;margin-top: 12px"
                       name="musicname" placeholder="请输入你想查询的歌名">
                <input type="submit" value="搜索" style="width: 60px;height: 35px">
            </form>
        </div>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="/music/download2?filename=小姐姐.png" class="layui-nav-img">
                    ${account}
                </a>
                <dl class="layui-nav-child">

                    <dd><a href="/usersmusic/myinfo">修改个人信息</a></dd>
                    <dd><a href="/updateuserspwd2?username=${account}">修改密码</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="/musiclist">返回主界面</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">分类歌单</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/usersmusic/usersmusiclist">全部</a></dd>
                        <dd><a href="/music/getliuxingmusic3">流行</a></dd>
                        <dd><a href="/music/getomeimusic3">欧美</a></dd>
                        <dd><a href="/music/getmingyaomusic3">民谣</a></dd>
                        <dd><a href="/music/getyaogunmusic3">摇滚</a></dd>
                        <dd><a href="/music/getchunmusic3">纯音乐</a></dd>
                    </dl>
                </li>

                <li class="layui-nav-item"><a href="">排行榜</a></li>
                <li class="layui-nav-item"><a href="">新发布</a></li>
                <li class="layui-nav-item"><a href="">电台</a></li>
                <li class="layui-nav-item"><a href="">MV</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <table class="table">
            <tr style="color: white">
                <th>歌曲编号</th>
                <th>歌曲名称</th>
                <th>歌曲类型</th>
                <th>歌曲语言</th>
                <th>歌曲时长</th>
                <th>歌曲路径</th>
                <th>歌曲封面</th>
                <th>播放</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${usersmusiclist.list}" var="music2">
            <tr style="color: white">
                <td>${music2.musicid}</td>
                <td>${music2.musicname}</td>
                <td>${music2.musicstyle}</td>
                <td>${music2.musiclanguage}</td>
                <td>${music2.musictime}</td>
                <td>${music2.musicurl}</td>
                <td>
                    <div class="myimg">
                            <%--  图片--%>
                        <img src="/music/download2?filename=${music2.musiccover}" style="width: 150px;height: 110px">
                    </div>
                </td>
                <td>
                    <audio controls>
                        <source src="/music/download?filename=${music2.musicurl}" type="audio/mpeg">
                    </audio>
                </td>
                <td><button><a href="/usersmusic/deleteusermusic/?musicid=${music2.musicid}&username=${account}">删除</a></button>
                    <button><a href="/usersmusic/download?filename=${music2.musicurl}&musicurl=${music2.musicid}">下载</a></button></td>

            </tr>
            </c:forEach>
    </div>
    
</div>
<script src="../src/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
</script>

</table>
</body>
</html>
