<%@ taglib prefix= "security" uri= "http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User</title>
</head>
<body>
<h1>This is user page</h1>
<c:if test="${pageContext.request.userPrincipal.name != null}">
    <form id="logoutForm" method="post" action="${contextPath}/logout">
            <%--<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>--%>
    </form>
    <c:if test="${not empty pageContext.request.userPrincipal}">

        <c:if test="${pageContext.request.isUserInRole('ROLE_USER')}">

            User ${pageContext.request.userPrincipal.name} in USER Group

        </c:if>

    </c:if>
    <h2> <a onclick="document.forms['logoutForm'].submit()">Logout</a>
    </h2>
</c:if>
</body>
</html>
