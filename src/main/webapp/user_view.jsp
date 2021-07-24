<%--
  Created by IntelliJ IDEA.
  User: ichaehun
  Date: 2021/07/13
  Time: 6:23 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="java.sql.*"%>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDateTime" %>
<!DOCTYPE html>
<%
        Connection conn =null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String url = "jdbc:mysql://localhost:3306/todo_list";
        String id = "root";  //MySQL에 접속을 위한 계정의 ID
        String pwd = "1234";  //MySQL에 접속을 위한 계정의 암호

        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, id, pwd);

        String code = request.getParameter("code");

        String sql = "SELECT * FROM user WHERE user_seq =" + code;
        pstmt = conn.prepareStatement(sql);

        rs = pstmt.executeQuery();
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="http://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

    <title> Hello JSP </title>
</head>
<body>
<div>
    <h1> Form </h1>
    <p> 폼을 통해 데이터 전송해봅시다. </p>
</div>
<form action ="user_update.jsp" method="post">
    <%
        while (rs.next()) {
            String uname = rs.getString("user_name");
            String email = rs.getString("email");
            String uid = rs.getString("user_id");
            int seq = rs.getInt("user_seq");
            LocalDateTime birth = rs.getTimestamp("birthday").toLocalDateTime();
%>
        <div>
            <label> 순서 </label>
            <input name = "user_seq" type = "text" value="<%=seq%>" />
        </div>
        <div>
            <label> 유저 이름 </label>
            <input name = "UN" type = "text" value="<%=uname%>" />
        </div>
        <div>
            <label> 이메일 </label>
            <input name = "EM" type = "text" value="<%=email%>" />
        </div>
        <div>
            <label> 생일 </label>
            <input name = "birth" type = "text" value="<%=birth%>" />
        </div>
        <div>
            <label> 아이디 </label>
            <input name = "ID" type = "text" value="<%=uid%>" />
        </div>
        <button type = "submit"> 전송 </button>
<%
}
    rs.close();
    pstmt.close();
    conn.close();
%>
    </form>
</body>
</html>

