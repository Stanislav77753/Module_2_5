<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix= "security" uri= "http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Users</title>
</head>
<body>
<c:if test="${!empty listUsers}">
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
                <td><a href="<c:url value='/myapplication/admin/users/pre_edit/${user.id}'/>">Edit</a></td>
                <td><a href="<c:url value='/myapplication/admin/users/delete/${user.id}'/>">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>
<c:url var="editAction" value="/myapplication/admin/users/edit"/>
<form:form action="${editAction}" commandName="user" >
    <table>
            <tr>
                <td>
                    <form:label path="id">
                        <spring:message text="ID"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="id" readonly="true" size="8" disabled="true"/>
                    <form:hidden path="id"/>
                </td>
            </tr>
        <tr>
            <td>
                <form:label path="userName">
                    <spring:message text="username"/>
                </form:label>
            </td>
            <td>
                <form:input path="userName"/>
            </td>
        </tr>
            <c:forEach items="${user.roles.toArray()}" var="user_role">
                <tr>
                    <td>
                        <form:label path="roles">
                            <spring:message text="role"/>
                        </form:label>
                    </td>
                    <td>
                            <%-- <form:input path="roles"/>--%>
                    </td>
                </tr>
            </c:forEach>
            <td colspan="2">
                <input type="submit" value="<spring:message text="Edit User"/>"/>
            </td>
        </tr>
    </table>
</form:form>
</body>
</html>
