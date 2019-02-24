<%@ taglib prefix= "security" uri= "http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Moderator</title>
</head>
<body>
<h1>This is moderator page</h1>
User name: ${pageContext.request.userPrincipal.name} <br/>
<h2>
    <a href="<c:url value="/myapplication/moderator/employees"/>">Show all employees</a>
</h2>
<h2>
    <a href="<c:url value="/myapplication/moderator/departments"/>">Show all departments</a>
</h2>
<form id="logoutForm" method="post" action="${contextPath}/logout">
    <%--<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>--%>
</form>
<h2> <a onclick="document.forms['logoutForm'].submit()">Logout</a>
</h2>
</body>
</html>
