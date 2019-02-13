<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login result</title>
</head>
<body>
<c:if test="${not empty pageContext.request.userPrincipal}">
    <c:if test="${pageContext.request.isUserInRole('ROLE_ADMIN')}">
        <meta http-equiv="refresh" content="1;http://localhost:8080/myapplication/admin" />
    </c:if>
    <c:if test="${pageContext.request.isUserInRole('ROLE_MODERATOR')}">
        <meta http-equiv="refresh" content="1;http://localhost:8080/myapplication/moderator" />
    </c:if>
    <c:if test="${pageContext.request.isUserInRole('ROLE_USER')}">
        <meta http-equiv="refresh" content="1;http://localhost:8080/myapplication/user" />
    </c:if>

</c:if>
</body>
</html>
