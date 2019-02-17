<%@ taglib prefix= "security" uri= "http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Admin</title>
</head>
<body>
<h1>This is admin page</h1>
<c:if test="${pageContext.request.userPrincipal.name != null}">
    <form id="logoutForm" method="post" action="${contextPath}/logout">
        <%--<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>--%>
    </form>
    <c:if test="${not empty pageContext.request.userPrincipal}">

        <c:if test="${pageContext.request.isUserInRole('ROLE_ADMIN')}">

            User ${pageContext.request.userPrincipal.name} in ADMIN Group

        </c:if>

    </c:if>
    <h2> <a onclick="document.forms['logoutForm'].submit()">Logout</a>
    </h2>

    <h2>
        <a href="<c:url value="/myapplication/admin/users"/>">Show all users</a>
    </h2>
</c:if>
</body>
</html>
