<%--
  Created by IntelliJ IDEA.
  User: ichaehun
  Date: 2021/05/29
  Time: 11:47 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="java.sql.*"%>
<%

    String email = request.getParameter("EM");
    String ID = request.getParameter("ID");
    String name = request.getParameter("UN");
    int age = 2021 - Integer.parseInt(request.getParameter("age")) + 1;

    Connection conn =null;
    PreparedStatement pstmt = null;

    String url = "jdbc:mysql://localhost:3306/todo_list";
    String id = "root";  //MySQL에 접속을 위한 계정의 ID
    String pwd = "1234";  //MySQL에 접속을 위한 계정의 암호

    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(url, id, pwd);

    String sql =
            "insert into user (user_name, email, birthday, user_id)\n" +
            "values (?, ?, now(), ?)";

    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, name);
    pstmt.setString(2, email);
    pstmt.setString(3, ID);

    pstmt.executeUpdate();

    pstmt.close();
    conn.close();





    System.out.println(age);
    System.out.println(email);
    System.out.println(ID);
    System.out.println(name);

    out.println(email);
    out.println(ID);
    out.println(name);
    out.println(age);

%>
<script>
    alert("저장 성공!");
    location.href = 'user_form.jsp';
</script>
