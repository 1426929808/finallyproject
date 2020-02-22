<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>音乐播放</title>
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
        <div class="layui-logo">用户界面音乐单</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">控制台</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">我的歌单</a>
                <dl class="layui-nav-child">
                    <dd><a href="/usersmusic/usersmusiclist?username=${account}">我的歌单</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它系统</a>
                <dl class="layui-nav-child">
                    <dd><a href="">邮件管理</a></dd>
                    <dd><a href="">消息管理</a></dd>
                </dl>
            </li>
        </ul>
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
            <li class="layui-nav-item"><a href="/">退出</a></li>
        </ul>
        <div>
            <form action="/music/useretsomemusic" method="post">
                <input type="text" style="width: 240px;height: 35px;margin-left: 670px;margin-top: 12px"
                       name="musicname" placeholder="请输入你想查询的歌名">
                <input type="submit" value="搜索" style="width: 60px;height: 35px">
            </form>
        </div>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">分类歌单</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/musiclist">全部</a></dd>
                        <dd><a href="/music/getliuxingmusic2">流行</a></dd>
                        <dd><a href="/music/getomeimusic2">欧美</a></dd>
                        <dd><a href="/music/getmingyaomusic2">民谣</a></dd>
                        <dd><a href="/music/getyaogunmusic2">摇滚</a></dd>
                        <dd><a href="/music/getchunmusic2">纯音乐</a></dd>
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
        <div class="layui-carousel" id="test1" >
            <div carousel-item>
                <div style="background-image:url('/music/download2?filename=老街2.png');background-size: cover"></div>
                <div style="background-image:url('/music/download2?filename=可乐2.png');background-size: cover"></div>
                <div style="background-image:url('/music/download2?filename=秋酿2.png');background-size: cover"></div>
                <div style="background-image:url('/music/download2?filename=起风了2.png');background-size: cover"></div>
                <div style="background-image:url('/music/download2?filename=年轮2.png');background-size: cover"></div>
            </div>
        </div>
        <!-- 条目中可以是任意内容，如：<img src=""> -->


        <script>
            layui.use('carousel', function(){
                var carousel = layui.carousel;
                //建造实例
                carousel.render({
                    elem: '#test1'
                    ,width: '100%' //设置容器宽度
                    ,arrow: 'always' //始终显示箭头
                    // ,background-size:'cover'
                    //,anim: 'updown' //切换动画方式
                });
            });
        </script>

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

            <c:forEach items="${musiclist.list}" var="music1">
                <tr style="color: white">
                    <td>${music1.musicid}</td>
                    <td>${music1.musicname}</td>
                    <td>${music1.musicstyle}</td>
                    <td>${music1.musiclanguage}</td>
                    <td>${music1.musictime}</td>
                    <td>${music1.musicurl}</td>
                    <td>
                        <div class="myimg">
                                <%--  图片--%>
                            <img src="/music/download2?filename=${music1.musiccover}" style="width: 150px;height: 110px">
                        </div>
                    </td>
                    <td>
                        <audio controls>
                            <source src="/music/download?filename=${music1.musicurl}" type="audio/mpeg" >
                        </audio>
                    </td>
                    <td><button><a href="/usersmusic/insertmusictouserslist/?musicid=${music1.musicid}">添加</a></button>
                        <button><a href="/usersmusic/download?filename=${music1.musicurl}&musicid=${music1.musicid}">下载</a></button></td>

                </tr>
            </c:forEach>
        </table>
        <ul class="pagination">
            <li><a href="/musiclist?pageNum=1"> 首页</a></li>
            <li><a href="/musiclist?pageNum=${musiclist.prePage}"> 上一页</a></li>
            <c:forEach items="${musiclist.navigatepageNums}" var="p">
                <li><a href="/musiclist?pageNum=${p}"> ${p}</a></li>
            </c:forEach>
            <li><a href="/musiclist?pageNum=${musiclist.nextPage}"> 下一页</a></li>
            <li><a href="/musiclist?pageNum=${musiclist.pages}"> 尾页</a></li>

        </ul>
    </div>

</div>
<script src="../src/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
</script>
</body>
</html>
