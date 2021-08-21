<%--
  Created by IntelliJ IDEA.
  User: ichaehun
  Date: 2021/08/07
  Time: 11:19 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <style>
        .container {
            margin : 0;
            padding : 0;
            display : flex;
            flex-direction: column;
            align-items: center;
        }

        .header {
            flex:1 auto;
            background-color: #888;
            width: 700px;
        }
        .body{
            flex:1 auto;
            background-color: skyblue;
            width: 700px;}
    </style>
</head>
<body>
<div class="container" id="container">
    <div class="header"> <h2> To-Do List에 오신 것을 환영합니다 </h2> </div>
    <div class="body">
        <form id = "login_form" action = login_action.jsp method = post>
            <div class = "box">
                <label> <h2> ID </h2> </label>
                <input type="text" placeholder="ID를 입력하세요" name = "login_id"> <br> <br>
                <label> <h2> password </h2> </label>
                <input type="text" placeholder="password를 입력하세요" name = "login_password"> <br> <br>
            <button> 로그인 </button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
