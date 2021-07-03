<%--
  Created by IntelliJ IDEA.
  User: ichaehun
  Date: 2021/06/19
  Time: 12:05 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="java.sql.*"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;">
    <title>Insert title here</title>
</head>
<body>
<%
    Connection conn =null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    //localhost는 MySQL이 설치된 곳의 IP
    //mysql : DB 명
    //3306 : MySQL 접속을 위한 디폴트 포트
        String url = "jdbc:mysql://localhost:3306/todo_list";
        String id = "root";  //MySQL에 접속을 위한 계정의 ID
        String pwd = "1234";  //MySQL에 접속을 위한 계정의 암호

        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, id, pwd);

        System.out.println("<h1>MySQL DB 연결 성공</h1>");

        String sql = "select * from todo";
        pstmt = conn.prepareStatement(sql);

        rs = pstmt.executeQuery();

        while (rs.next()){
            String title = rs.getString("work_name");

        %>
            <%=title%>
        <%
            }
        %>


</body>
</html>
