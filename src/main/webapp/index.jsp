<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP스크립트 Example</title>
</head>
<body>
<h1>Script Example1</h1>
<%! String declaration = "Declaration";%>
<%! public String decMethod(){
    return declaration;}
    %>
<%
    String scriptlet = "Sciptlet";
    String comment = "Comment";
    out.println("내장객체를 이용한 출력 : " + declaration + "<p/>");
%>
    선언문의 출력1 : <%= declaration%><p/>
    선언문의 출력2 : <%=decMethod()%>
    스크립트릿의 출력 : <%=scriptlet%><p/>
    <!--JSP주석-->
    <!--JSP주석1 : <%=comment%>--><p/>
    <%-- JSP주석2 : <%=comment%>--%>
    <% /* 주석
     (여러줄 주석)
     */
    %>
<% //주석(한줄 주석)%>
<br/>
<a href="hello-servlet">Hello Servlet. hahah</a>
</body>
</html>