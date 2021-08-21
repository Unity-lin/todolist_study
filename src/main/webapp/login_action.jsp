<%--
  Created by IntelliJ IDEA.
  User: ichaehun
  Date: 2021/08/07
  Time: 11:33 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="java.sql.*"%>
<%
    String user_id = request.getParameter("login_id");
    String user_password = request.getParameter("login_password");


    Connection conn =null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    String url = "jdbc:mysql://localhost:3306/todo_list";
    String id = "root";  //MySQL에 접속을 위한 계정의 ID
    String pwd = "1234";  //MySQL에 접속을 위한 계정의 암호

    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(url, id, pwd);

    String sql = "SELECT * FROM user where user_id = ? and user_password = ?";

    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, user_id);
    pstmt.setString(2, user_password);



    rs = pstmt.executeQuery();
    if (rs.next()) {
        String uid= rs.getString("user_id");
        String password = rs.getString("user_password");
        int user_seq = rs.getInt("user_seq");
        session.setAttribute("user_email", uid);
        session.setAttribute("user_password", password);
        session.setAttribute("user_seq", user_seq);

    %>
    <script>
        alert("로그인 성공 완료!")
        location.href = "todo_list.jsp"
    </script>
    <%
        } else {
        %>
    <script>
        alert("회원이 아닙니다 돌아가서 회원가입을 진행해주세요")
        location.href = "login_form.jsp"
    </script>

    <%
        }

        rs.close();
        pstmt.close();
        conn.close();
    %>
