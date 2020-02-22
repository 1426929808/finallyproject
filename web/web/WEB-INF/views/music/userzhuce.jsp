<%--
  Created by IntelliJ IDEA.
  User: 黄一百
  Date: 2019/12/6
  Time: 9:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Users</title>
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>
    <link href="/static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
<%--    <link rel="stylesheet" type="text/css" href="/static/layui/css/style.css" media="all"/>--%>

    <style type="text/css">
        body{
            background-image: url('/music/download2?filename=阳光.jpg');background-size: cover;
            /*background-image: url(https://imgchr.com/content/images/system/home_cover_1552414407320_3a5f92.jpg);*/
            background-repeat: no-repeat;
            /* 当内容高度大于图片高度时，背景图像的位置相对于viewport固定 */
            background-attachment: fixed;  /*此条属性必须设置否则可能无效*/
            /* 让背景图基于容器大小伸缩 */
            background-size: cover;
            /* 设置背景颜色，背景图加载过程中会显示背景色 */
            background-color: #CCCCCC;
        }
        #user_reg{
            font-family: 微软雅黑;
            font-size: 40px;
            text-align: center;
            margin-top: 200px;
        }
        form{
            width: 500px;					/*设置宽度，方便使其居中*/
            margin: 40px auto auto auto;	/*上右下左*/
            font-size: 25px;
        }
        input{
            height: 30px;
            width: 12em;
            margin-top: 5px;
            margin-bottom: 5px;
        }
        /*input标签下的属性选择器*/
        input[type="submit"],input[type="reset"]{
            height: 25px;
            width: 5em;
            margin-top: 5px;
            margin-left: 6px;
        }
    </style>

</head>
<script type="text/javascript">
    //onblur失去焦点事件，用户离开输入框时执行 JavaScript 代码：
    function validate_username(username){
        //定义正则表达式的变量:汉字正则
        var emailReg='[\u4E00-\u9FA5]+';
        //console.log(username);
        if(username !="" && username.search(emailReg) != -1)
        {
            document.getElementById("test_user").innerHTML = "<font color='green' size='3px'>√用户名格式正确</font>";
        }else{
            document.getElementById("test_user").innerHTML = "<font color='red' size='3px'>用户名格式错误</font>";
        }
    }

    //函数2：验证密码是否符合要求：长度为6-18的所有字符：
    function validate_password(password){
        var passwordReg='.{6,18}$';
        if(password != "" && password.search(passwordReg) != -1)
        {
            document.getElementById("test_pw").innerHTML = "<font color='green' size='3px'>√密码格式正确</font>";
        }else{
            document.getElementById("test_pw").innerHTML = "<font color='red' size='3px'>密码格式错误</font>";
            alert("密码长度为6-18位！");
        }
    }

    //函数3：验证两次输入的密码是否一样
    function validate_password2(password2){
        var password = document.getElementById("password").value;
        if (password == ""){
            document.getElementById("is_test_pw").innerHTML = "<font color='red' size='3px'>密码不为空</font>";
        }else if(password==password2){
            document.getElementById("is_test_pw").innerHTML = "<font color='green' size='3px'>√两次输入的密码相同</font>";
        }else{
            document.getElementById("is_test_pw").innerHTML = "<font color='red' size='3px'>两次输入的密码不相同</font>";
            console.log("密码长度为6-18位！");
        }
    }

    //函数4：验证表单是否已经填好
    function validate_form(){
        var username = document.getElementById("username").value;
        var password = document.getElementById("password").value;
        var password2 = document.getElementById("password2").value;
        //console.log("表单填写正确，可以正常提交！");

        //这三个，如果任何一个有问题，都返回false
        var emailReg='[\u4E00-\u9FA5]+';
        var passwordReg='.{6,18}$';

        if(username != "" && emailReg.test(username)){
            if(password !="" && passwordReg.test(password)){
                if(password2==password){
                    alert("信息填写正确，可以正常提交！");
                    console.log("信息填写正确，可以正常提交！");
                    return true;
                }else{
                    alert("密码不一致，提交失败，请重新填写！");
                    console.log("密码不一致，提交失败，请重新填写！");
                    return false;
                }
            }else{
                alert("密码格式错误，提交失败，请重新填写！");
                console.log("密码格式错误，提交失败，请重新填写！");
                return false;
            }
        }else{
            alert("注册的账号不符合要求，提交失败，请重新填写！");
            console.log("注册的账号不符合要求，提交失败，请重新填写！");
            return false;
        }
    }
</script>

<body>

<div id="user_reg">用户注册:</div>
<form action="/zhuceusers" method="post" name="form" >
    <table>
        <tr><td><a href="/">返回登录</a></td></tr>
        <tr>
            <td>请输入用户名：</td>
            <td><input type="text" id="username" name="username" placeholder="请输入用户名" onblur="validate_username(this.value)"/></td>
            <td id="test_user"></td>
            <span>${error}</span>
        </tr>
        <tr>
            <td>请输入密码：</td>
            <td><input type="password" id="password" name="userpwd" placeholder="密码长度为6-18位" onblur="validate_password(this.value)"/></td>
            <td id="test_pw"></td>
        </tr>
        <tr>
            <td>请确认密码：</td>
            <td><input type="password" id="password2" name="userpwd2" onblur="validate_password2(this.value)"/></td>
            <td id="is_test_pw"></td>
        </tr>
        <tr>
            <td></td>
            <td ><input type="submit" id="submit_form" value="注册" onclick="return validate_form()"/>
                <input type="reset" value="重置"/>
            </td>

        </tr>
    </table>
</form>
</body>
</html>
