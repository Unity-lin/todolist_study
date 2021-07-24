<%--
  Created by IntelliJ IDEA.
  User: ichaehun
  Date: 2021/05/29
  Time: 11:38 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <!-- Bootstrap CSS -->
    <link rel = "stylesheet" href = "https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <title> Hello JSP </title>
</head>
<body>
 <div>
  <h1> Form </h1>
  <p> 폼을 통해 데이터를 전송해봅시다. </p>
 </div>

<form action="user_save.jsp" method="post">
    <div>
        <label> 이메일 </label>
        <input name ="EM" type = "email" />
    </div>
    <div>
        <label> 아이디 </label>
        <input name = "ID" type = "name" />
    </div>
    <div>
        <label> 이름 </label>
        <input name = "UN" type = "name" />
    </div>
    <div>
        <label> 생일 </label>
        <input name = "birth" type = "date" />
    </div>
    <button type = "summit"> 전송 </button>
</form>
</body>
</html>
