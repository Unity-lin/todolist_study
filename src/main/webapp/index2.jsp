<%--
  Created by IntelliJ IDEA.
  User: ichaehun
  Date: 2021/05/22
  Time: 12:14 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import ="java.util.Enumeration" %>
<html>
<head>
    <title>Header Information</title>
</head>
<body>
<h1>헤더 정보</h1>
<table border = "0">
    <tr>
        <td>HeaderName</td>
        <td> value</td>
    </tr>
    <% Enumeration e = request.getHeaderNames();
    while(e.hasMoreElements()){
        String name = (String)e.nextElement();
        %>
    <tr>
    <td><%= name%></td>
    <td><%= request.getHeader(name)%></td>
    </tr>
    <%
    }
    %>
</table>
<table border = "0">
    <tr>
        <td colspan = "2"> <h1> 쿠키 정보</h1></td>
    </tr>
    <tr>
        <td> 쿠키 정보</td>
        <%
            Cookie[] cookie = request.getCookies();
            if(cookie == null){
                %>
        <td> 쿠키가 존재하지 않습니다.. </td>
        <%
            }else{
                for(int i = 0; i <cookie.length; i++){
        %>
        <td>
        <%=cookie[i].getName()%>(<%=cookie[i].getValue()%>)&nbsp;&nbsp;
        </td>
        <%
            }
            }
        %>
    </tr>
    <tr>
        <td>서버의 도메인명</td>
        <td><%=request.getServerName()%></td>
    </tr>
    <tr>
        <td>서버의 포트번호</td>
        <td><%=request.getServerPort()%></td>
    </tr>
    <tr>
        <td>요청 url</td>
        <td><%=request.getRequestURL()%></td>
    </tr>
    <tr>
        <td>요청 uri</td>
        <td><%=request.getRequestURI()%></td>
    </tr>
    <tr>
        <td>query</td>
        <td><%=request.getQueryString()%></td>
    </tr>
    <tr>
        <td>클라이언트의 호스트 이름</td>
        <td><%=request.getRemoteHost()%></td>
    </tr>
    <tr>
        <td>클라이언트의 주소</td>
        <td><%=request.getRemoteAddr()%></td>
    </tr>
    <tr>
        <td>요청에 사용된 프로토콜</td>
        <td><%=request.getProtocol()%></td>
    </tr>
    <tr>
        <td>요청에 사용된 요청방식</td>
        <td><%=request.getMethod()%></td>
    </tr>
    <tr>
        <td>컨텍스트 경로</td>
        <td><%=request.getContextPath()%></td>
    </tr>
</table>
</body>
</html>

