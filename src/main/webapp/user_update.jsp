<%--
  Created by IntelliJ IDEA.
  User: ichaehun
  Date: 2021/07/24
  Time: 9:32 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="java.sql.*"%>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDateTime" %>
<table>
<%
        String email = request.getParameter("EM");
        String ID = request.getParameter("ID");
        String name = request.getParameter("UN");
        String birth = request.getParameter("birth");
        String user_seq = request.getParameter("user_seq");

        Connection conn =null;
        PreparedStatement pstmt = null;

        String url = "jdbc:mysql://localhost:3306/todo_list";
        String id = "root";  //MySQL에 접속을 위한 계정의 ID
        String pwd = "1234";  //MySQL에 접속을 위한 계정의 암호

        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, id, pwd);

        String sql = "UPDATE user SET user_name = ?, email = ?, birthday = ?, user_id = ? WHERE user_seq = ?";

        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, name);
        pstmt.setString(2, email);
        pstmt.setString(3, birth);
        pstmt.setString(4, ID);
        pstmt.setString(5, user_seq);

        int rowCount = pstmt.executeUpdate();

    pstmt.close();
    conn.close();

%>
    <script>
        alert("<%=rowCount%>행 변경 완료");
        location.href = 'user_list.jsp';
    </script>



