<%--
  Created by IntelliJ IDEA.
  User: ichaehun
  Date: 2021/07/10
  Time: 10:50 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="java.sql.*"%>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDateTime" %>
<table>
    <%
       if(session.getAttribute("user_seq") == null){

          response.sendRedirect("login_form.jsp");
       }
    %>
<%

    Connection conn =null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    String url = "jdbc:mysql://localhost:3306/todo_list";
    String id = "root";  //MySQL에 접속을 위한 계정의 ID
    String pwd = "1234";  //MySQL에 접속을 위한 계정의 암호

    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(url, id, pwd);

    int user_seq = (Integer) session.getAttribute("user_seq");

    String sql = "SELECT * FROM todo where user_seq = 1" ;
    pstmt = conn.prepareStatement(sql);

    rs = pstmt.executeQuery();

    while (rs.next()) {
        String way = rs.getString("reception_way");
        int seq = rs.getInt("seq");
        String name = rs.getString("work_name");
        String isbibration = rs.getString("isbibration");
        LocalDateTime input_date = rs.getTimestamp("input_date").toLocalDateTime();
        LocalDateTime startday = rs.getTimestamp("start_date").toLocalDateTime();
        LocalDateTime finishday = rs.getTimestamp("finish_date").toLocalDateTime();
%>
<tr>
    <td><a href="./todo_view.jsp?code=<%=seq%>"><%=seq %></a></td>
    <td><%=input_date%></td>
    <td><%=name%></td>
    <td><%=startday%></td>
    <td><%=finishday%></td>
    <td><%=way%></td>
    <td><%=isbibration%></td>
</tr>
<%
    }
%>
</table>
<a href = "todo_form.jsp"> form으로 돌아가기 </a>
<%
    rs.close();
    pstmt.close();
    conn.close();
%>