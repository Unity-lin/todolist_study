<%--
  Created by IntelliJ IDEA.
  User: ichaehun
  Date: 2021/07/13
  Time: 6:05 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="java.sql.*"%>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDateTime" %>
<table>
  <%
    Connection conn =null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    String url = "jdbc:mysql://localhost:3306/todo_list";
    String id = "root";  //MySQL에 접속을 위한 계정의 ID
    String pwd = "1234";  //MySQL에 접속을 위한 계정의 암호

    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(url, id, pwd);

    String sql = "SELECT * FROM user";
    pstmt = conn.prepareStatement(sql);

    rs = pstmt.executeQuery();

    while (rs.next()) {
      String uname = rs.getString("user_name");
      String email = rs.getString("email");
      String uid = rs.getString("user_id");
      int seq = rs.getInt("user_seq");
      LocalDateTime birth = rs.getTimestamp("birthday").toLocalDateTime();
  %>
  <tr>
    <td> <a href="./user_view.jsp?code=<%=seq%>"><%=seq %></a> </td>
    <td> <%=uname%> </td>
    <td> <%=email%> </td>
    <td> <%=uid%> </td>
    <td> <%=birth%> </td>
  </tr>
  <%
    }
  %>
</table>
<%
  rs.close();
  pstmt.close();
  conn.close();
%>
