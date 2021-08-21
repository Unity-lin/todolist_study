<%--
  Created by IntelliJ IDEA.
  User: ichaehun
  Date: 2021/07/31
  Time: 11:38 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String value = (String)session.getAttribute("value");
    if( value == null){
        value = "세션값 없음!";
    }
%>

<h1>세션 값 : <%= value %></h1>
<h1>세션 값(이름) :  <%= session.getAttribute("name") %></h1>
<input type = "button" value = "세션값 생성" onclick = "location.href = 'sessionSet.jsp'">
<input type = "button" value = "세션값 삭제" onclick = "location.href = 'sessionDel.jsp'">
<input type = "button" value = "세션값 초기화" onclick = "location.href = 'sessionInvalidate.jsp'">
