<%--
  Created by IntelliJ IDEA.
  User: ichaehun
  Date: 2021/07/10
  Time: 11:16 오전
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

        String code = request.getParameter("code");

        String sql = "SELECT * FROM todo WHERE seq =" + code;
        pstmt = conn.prepareStatement(sql);

        rs = pstmt.executeQuery();

        while (rs.next()) {
            String title = rs.getString("reception_way");
            int seq = rs.getInt("seq");
            String name = rs.getString("work_name");
            String on = rs.getString("isbibration");
            LocalDateTime search = rs.getTimestamp("input_date").toLocalDateTime();
            LocalDateTime startday = rs.getTimestamp("start_date").toLocalDateTime();
            LocalDateTime finishday = rs.getTimestamp("finish_date").toLocalDateTime();
    %>
    <tr>
        <td><a href="./todolist_view.jsp?code=<%=seq%>"><%=seq %></a></td>
        <td><%=search%></td>
        <td><%=name%></td>
        <td><%=startday%></td>
        <td><%=finishday%></td>
        <td><%=title%></td>
        <td><%=on%></td>
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

