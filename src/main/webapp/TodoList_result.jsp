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
    String dateinput = request.getParameter("a");
    String worklist = request.getParameter("job");
    String sT = request.getParameter("start-time");
    String start = request.getParameter("c");
    String fT = request.getParameter("finish-time");
    String finish = request.getParameter("d");
    String bibration = request.getParameter("zz");
    String msg_sns = request.getParameter("msg_sns");

    String startTime = start.concat(" ").concat(sT);
    System.out.println(startTime);
    DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    LocalDateTime startTimeResult = LocalDateTime.parse(startTime, formatter2);
    System.out.println(startTimeResult);

    String finishTime = finish.concat(" ").concat(fT);
    System.out.println(finishTime);
    LocalDateTime finishTimeResult = LocalDateTime.parse(finishTime, formatter2);
    System.out.println(finishTimeResult);


    Connection conn =null;
    PreparedStatement pstmt = null;

    String url = "jdbc:mysql://localhost:3306/todo_list";
    String id = "root";  //MySQL에 접속을 위한 계정의 ID
    String pwd = "1234";  //MySQL에 접속을 위한 계정의 암호

    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(url, id, pwd);

    String sql =
            "insert into todo (input_date, work_name, start_date, finish_date, reception_way, isbibration)\n" +
                    "values (now(), ?, ?, ?, ?, ?)";

    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, worklist);
    pstmt.setTimestamp(2, Timestamp.valueOf(startTimeResult));
    pstmt.setTimestamp(3, Timestamp.valueOf(finishTimeResult));
    pstmt.setString(4, msg_sns);
    pstmt.setString(5, bibration);

    pstmt.executeUpdate();

    pstmt.close();
    conn.close();


    System.out.println(dateinput);
    System.out.println(worklist);
    System.out.println(start);
    System.out.println(finish);
    System.out.println(bibration);
    System.out.println(msg_sns);
    System.out.println(sT);
    System.out.println(fT);


    out.println(dateinput);
    out.println(worklist);
    out.println(start);
    out.println(finish);
    out.println(bibration);
    out.println(msg_sns);
    out.println(sT);
    out.println(fT);
%>
<script>
    alert("저장 성공!");
    location.href = 'todolist_form.jsp';
</script>
