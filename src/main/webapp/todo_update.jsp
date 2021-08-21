<%--
  Created by IntelliJ IDEA.
  User: ichaehun
  Date: 2021/06/12
  Time: 11:19 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="java.sql.*"%>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDateTime" %>
<%
    if(session.getAttribute("user_seq") == null){

        response.sendRedirect("login_form.jsp");
    }
%>
<%
    String input_date = request.getParameter("input_date");
    String work_list = request.getParameter("work_list");
    String start_date = request.getParameter("start_date");
    String finish_date = request.getParameter("finish_date");
    String bibration = request.getParameter("bibration");
    String msg_sns = request.getParameter("msg_sns");
    String seq = request.getParameter("seq");

    String[] startDate = start_date.split("T");

    String startTime = startDate[0].concat(" ").concat(startDate[1]);
    DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    LocalDateTime startTimeResult = LocalDateTime.parse(startTime, formatter2);
    String[] finishDate = finish_date.split("T");
    String finishTime = finishDate[0].concat(" ").concat(finishDate[1]);
    LocalDateTime finishTimeResult = LocalDateTime.parse(finishTime, formatter2);

    Connection conn =null;
    PreparedStatement pstmt = null;

    String url = "jdbc:mysql://localhost:3306/todo_list";
    String id = "root";  //MySQL에 접속을 위한 계정의 ID
    String pwd = "1234";  //MySQL에 접속을 위한 계정의 암호

    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(url, id, pwd);

    String sql = "UPDATE todo SET input_date = ?, work_name = ?, start_date = ?, finish_date = ?,  reception_way = ?, isbibration = ? WHERE seq = ? and user_seq = ?";

    int user_seq = (Integer) session.getAttribute("user_seq");

    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, input_date);
    pstmt.setString(2, work_list);
    pstmt.setTimestamp(3, Timestamp.valueOf(startTimeResult));
    pstmt.setTimestamp(4, Timestamp.valueOf(finishTimeResult));
    pstmt.setString(5, msg_sns);
    pstmt.setString(6, bibration);
    pstmt.setString(7, seq);
    pstmt.setInt(8, user_seq);

    int rowCount = pstmt.executeUpdate();

    pstmt.close();
    conn.close();

%>
<script>
    alert("<%=rowCount%>행 변경 완료");
    location.href = 'todo_list.jsp';
</script>
