<%--
  Created by IntelliJ IDEA.
  User: ichaehun
  Date: 2021/07/31
  Time: 11:44 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%session.invalidate();%>

<script>
    alert("세션값 초기화 완료!")
    location.href="sessionTest.jsp"
</script>