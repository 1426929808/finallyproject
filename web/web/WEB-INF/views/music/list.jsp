<%--
  Created by IntelliJ IDEA.
  User: 黄一百
  Date: 2019/12/2
  Time: 20:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Music List</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>
    <link href="/static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
    <script src="/static/layui/layui.js"></script>
    <link rel="stylesheet" href="/static/layui/css/layui.css" media="all">
</head>
<body class="layui-layout-body"
      style="background-image:url('/music/download2?filename=音乐2.jpg');background-size: contain">

<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">管理员后台界面</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">控制台</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">歌曲管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="/music/add">添加歌曲</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">用户</a>
                <dl class="layui-nav-child">
                    <dd><a href="/getallusers">用户账号管理</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它系统</a>
                <dl class="layui-nav-child">
                    <dd><a href="">邮件管理</a></dd>
                    <dd><a href="">消息管理</a></dd>
                    <dd><a href="">授权管理</a></dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="/music/download2?filename=小哥哥.png" class="layui-nav-img">
                    ${account}
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">修改个人信息</a></dd>
                    <dd><a href="">修改密码</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="/">退出</a></li>
        </ul>
        <div>
            <form action="/music/guanliyuangetsomemusic" method="post">
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
                        <dd><a href="/music/list">全部</a></dd>
                        <dd><a href="/music/getliuxingmusic">流行</a></dd>
                        <dd><a href="/music/getomeimusic">欧美</a></dd>
                        <dd><a href="/music/getmingyaomusic">民谣</a></dd>
                        <dd><a href="/music/getyaogunmusic">摇滚</a></dd>
                        <dd><a href="/music/getchunmusic">纯音乐</a></dd>
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
        <br>
        <div class="layui-carousel" id="test1">
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
            layui.use('carousel', function () {
                var carousel = layui.carousel;
                //建造实例
                carousel.render({
                    elem: '#test1'
                    , width: '100%' //设置容器宽度
                    , arrow: 'always' //始终显示箭头
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
            <c:forEach items="${list.list}" var="music">
                <tr style="color: white">
                    <td>${music.musicid}</td>
                    <td>${music.musicname}</td>
                    <td>${music.musicstyle}</td>
                    <td>${music.musiclanguage}</td>
                    <td>${music.musictime}</td>
                    <td>${music.musicurl}</td>
                    <td>
                        <div class="myimg">
                                <%--  图片--%>
                            <img src="/music/download2?filename=${music.musiccover}" style="width: 150px;height: 110px">
                        </div>
                    </td>
                    <td>
                        <audio controls>
                            <source src="/music/download?filename=${music.musicurl}" type="audio/mpeg">
                        </audio>
                    </td>
                    <td>
                        <button><a href="/music/delete?musicid=${music.musicid}">删除</a></button>
                        <button><a href="/music/update?musicid=${music.musicid}">修改</a></button>
                    </td>

                </tr>
            </c:forEach>.
        </table>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        <ul class="pagination">
            <li><a href="/music/list?pageNum=1"> 首页</a></li>
            <li><a href="/music/list?pageNum=${list.prePage}"> 上一页</a></li>
            <c:forEach items="${list.navigatepageNums}" var="p">
                <li><a href="/music/list?pageNum=${p}"> ${p}</a></li>
            </c:forEach>
            <li><a href="/music/list?pageNum=${list.nextPage}"> 下一页</a></li>
            <li><a href="/music/list?pageNum=${list.pages}"> 尾页</a></li>

        </ul>

    </div>
</div>
<script src="../src/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function () {
        var element = layui.element;

    });
</script>

<%--<script>--%>
<%--    $(".myimg").hover(function(){//鼠标悬停在上面实现什么效果--%>

<%--        //显示背景--%>
<%--        $(this).css({"background-color":"#98bf21"})--%>
<%--        // $(this).find("div").stop().animate({--%>
<%--        //     "height":"300px"--%>
<%--        // },1000);--%>
<%--    },function(){//鼠标离开实现什么功能--%>

<%--        //隐藏背景--%>
<%--        $(this).css({"background-color":"white"});--%>
<%--        // $(this).find("div").stop().animate({--%>
<%--        //     "height":"100px"--%>
<%--        // },1000);--%>
<%--    });--%>
<%--</script>--%>

</body>
</html>
