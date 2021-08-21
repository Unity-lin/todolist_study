<%--
  Created by IntelliJ IDEA.
  User: ichaehun
  Date: 2021/07/31
  Time: 11:43 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.setAttribute("value", "세션값 있음~");
    session.setAttribute("name", "홍길동");
%>

<script>
    alert("세션값 생성 완료!")
    location.href="sessionTest.jsp"
</script>
