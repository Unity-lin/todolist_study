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
<!DOCTYPE html>
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

        String code = request.getParameter("code");

        String sql = "SELECT * FROM todo WHERE seq =" + code;
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
    <form action ="todo_update.jsp" method="post">
    <%
        while (rs.next()) {
            String title = rs.getString("reception_way");
            int seq = rs.getInt("seq");
            String name = rs.getString("work_name");
            String on = rs.getString("isbibration");
            LocalDateTime search = rs.getTimestamp("input_date").toLocalDateTime();
            LocalDateTime startday = rs.getTimestamp("start_date").toLocalDateTime();
            LocalDateTime finishday = rs.getTimestamp("finish_date").toLocalDateTime();


    %>
        <div>
            <label> 순서 </label>
            <input name = "seq" type = "text" value="<%=seq%>" />
        </div>
        <div>
            <label> 검색 날짜 </label>
            <input name = "input_date" type = "datetime-local" value="<%=search%>" />
        </div>
        <div>
            <label> 할밀 목록  </label>
            <input name = "work_list" type="text" value="<%=name%>">
        </div>
        <div>
            <label> 시작날짜 </label>
            <input name = "start_date" type = "datetime-local" value="<%=startday%>" />
        </div>
        <div>
            <label> 끝나는 날짜 </label>
            <input name = "finish_date" type = "datetime-local" value="<%=finishday%>" />
        </div>
        <div>
            <label> 알람 선택 </label>
            <input name = "msg_sns" type = "text" value="<%=title%>" />
        </div>
        <div>
            <label> 진동 </label>
            <input name = "bibration" type = "text" value="<%=on%>" />
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

