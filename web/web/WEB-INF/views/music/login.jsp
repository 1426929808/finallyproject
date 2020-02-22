<%--
  Created by IntelliJ IDEA.
  User: 黄一百
  Date: 2019/12/3
  Time: 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>
    <link href="/static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
    <script src="/static/login/js/com.js"></script>
    <link rel="stylesheet" type="text/css" href="/static/login/css/style2.0.css" media="all">

    <style type="text/css">

        ul li{font-size: 30px;color:#2ec0f6;}
        .tyg-div{z-index:-1000;float:left;position:absolute;left:5%;top:20%;}
        .tyg-p{
            font-size: 14px;
            font-family: 'microsoft yahei';
            position: absolute;
            top: 135px;
            left: 60px;
        }
        .tyg-div-denglv{
            z-index:1000;float:right;position:absolute;right:3%;top:10%;
        }
        .tyg-div-form{
            background-color: #23305a;
            width:300px;
            height:auto;
            margin:120px auto 0 auto;
            color:#2ec0f6;
        }
        .tyg-div-form form {padding:10px;}
        .tyg-div-form form input[type="text"]{
            width: 270px;
            height: 30px;
            margin: 25px 10px 0px 0px;
        }  .tyg-div-form form input[type="password"]{
               width: 270px;
               height: 30px;
               margin: 25px 10px 0px 0px;
           }
        .tyg-div-form form button {
            cursor: pointer;
            width: 270px;
            height: 44px;
            margin-top: 25px;
            padding: 0;
            background: #2ec0f6;
            -moz-border-radius: 6px;
            -webkit-border-radius: 6px;
            border-radius: 6px;
            border: 1px solid #2ec0f6;
            -moz-box-shadow:
                    0 15px 30px 0 rgba(255,255,255,.25) inset,
                    0 2px 7px 0 rgba(0,0,0,.2);
            -webkit-box-shadow:
                    0 15px 30px 0 rgba(255,255,255,.25) inset,
                    0 2px 7px 0 rgba(0,0,0,.2);
            box-shadow:
                    0 15px 30px 0 rgba(255,255,255,.25) inset,
                    0 2px 7px 0 rgba(0,0,0,.2);
            font-family: 'PT Sans', Helvetica, Arial, sans-serif;
            font-size: 14px;
            font-weight: 700;
            color: #fff;
            text-shadow: 0 1px 2px rgba(0,0,0,.1);
            -o-transition: all .2s;
            -moz-transition: all .2s;
            -webkit-transition: all .2s;
            -ms-transition: all .2s;
        }

    </style>
</head>
<body>
<div class="tyg-div">
    <ul>
        <li>让</li>
        <li><div style="margin-left:20px;">音</div></li>
        <li><div style="margin-left:40px;">乐</div></li>
        <li><div style="margin-left:60px;">改</div></li>
        <li><div style="margin-left:80px;">变</div></li>
        <li><div style="margin-left:100px;">生</div></li>
        <li><div style="margin-left:120px;">活</div></li>
    </ul>
</div>
<div id="contPar" class="contPar">
    <div id="page1" style="z-index: 1; height: 150px;" class="resp0 cont_1">
        <div class="title0">黄一百平台</div>
        <div class="title1">流行、摇滚、民谣、纯音乐、专栏节目</div>
        <div class="imgGroug">
            <ul>
                <img alt="" class="img0 png" src="static/login/img/page1_0.png">
                <img alt="" class="img1 png" src="static/login/img/page1_1.png" style="margin-left: -85.684px; margin-top: -85.996px;">
                <img alt="" class="img2 png" src="static/login/img/page1_2.png" style="margin-left: -85.684px; margin-top: -85.996px;">
            </ul>
        </div>
        <img alt="" class="img3 png" src="static/login/img/page1_3.jpg" style="margin-left: -348.264px; margin-top: -406.016px;">
    </div>
</div>
<div class="tyg-div-denglv">
    <div class="tyg-div-form">
        <form action="/login2" method="post">
            <h2 style="margin-left: 100px">登录</h2><p class="tyg-p" style="margin-left: 20px">欢迎访问  黄一百平台</p>
            <div style="margin:5px 0px;">
                <input type="text" placeholder="请输入账号..." name="username">
            </div>
            <div style="margin:5px 0px;">
                <input type="password" placeholder="请输入密码..." name="userpwd">
            </div>
            <button type="submit">登<span style="width:20px;"></span>录</button>
            <a href="/zhuce" style="font-size: 20px;color: white;
            margin-left: 230px;">注<span style="width:20px;"></span>册</a>
            <div>
                ${error}
            </div>
        </form>
    </div>
</div>
<%--<h1>欢迎登录</h1>--%>
<%--<form action="/login2" method="post">--%>

<%--    账号：<input type="text" name="username"/>--%>
<%--    <br>--%>
<%--    <br>--%>
<%--    密码：<input type="password" name="userpwd"/>--%>
<%--    <br>--%>
<%--    <br>--%>
<%--    <input type="submit" value="登录"/>--%>
<%--    <button><a href="/zhuce">注册</a></button>--%>
<%--    <div>--%>
<%--        ${error}--%>
<%--    </div>--%>
<%--</form>--%>
</body>
</html>
