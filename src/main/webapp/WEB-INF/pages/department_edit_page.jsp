<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Department edit</title>
</head>
<body>
<c:choose>
    <c:when test="${pageContext.request.isUserInRole('ROLE_ADMIN')}">
        <c:url var="editAction" value="/myapplication/admin/departments/edit/result"/>
    </c:when>
    <c:otherwise>
        <c:url var="editAction" value="/myapplication/moderator/departments/edit/result"/>
    </c:otherwise>
</c:choose>
<form:form action="${editAction}" commandName="department" >
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
                <form:label path="name">
                    <spring:message text="department"/>
                </form:label>
            </td>
            <td>
                <form:input path="name"/>
            </td>
        </tr>
        <tr>
        <td colspan="2">
            <button type="submit">Edit department</button>
        </td>
        </tr>
    </table>
</form:form>
</body>
</html>
