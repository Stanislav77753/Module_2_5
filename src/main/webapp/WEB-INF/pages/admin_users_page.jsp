<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix= "security" uri= "http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Users</title>
</head>
<body>
<c:if test="${!empty listUsers}">
    <h1>Users</h1>
    <table class="tg">
        <tr>
            <th width="80">ID</th>
            <th width="120">Username</th>
            <th width="120">Role</th>
            <th width="60">Edit</th>
            <th width="60">Delete</th>
        </tr>
        <c:forEach items="${listUsers}" var="user">
            <tr>
                <td>${user.id}</td>
                <td>${user.userName}</td>
                <td>
                <c:forEach items="${user.roles.toArray()}" var="role">
                    ${role.name}
                </c:forEach>
                </td>
                <td><a href="<c:url value='/myapplication/admin/users/edit/${user.id}'/>">Edit</a></td>
                <td><a href="<c:url value='/myapplication/admin/users/delete/${user.id}'/>">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>
<br/>
<h2>
    <a href="<c:url value="/myapplication/admin/users/add"/>">Add new user</a>
</h2>
<h2>
    <a href="<c:url value="/myapplication/admin"/>">to admin page</a>
</h2>
</body>
</html>
