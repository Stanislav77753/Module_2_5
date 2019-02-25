<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Edit employee</title>
</head>
<body>
<c:choose>
    <c:when test="${pageContext.request.isUserInRole('ROLE_ADMIN')}">
        <c:url var="editAction" value="/myapplication/admin/employees/edit/result"/>
    </c:when>
    <c:otherwise>
        <c:url var="editAction" value="/myapplication/moderator/employees/edit/result"/>
    </c:otherwise>
</c:choose>
<form:form action="${editAction}" commandName="employee" >
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
                <form:label path="lastName">
                    <spring:message text="Last name"/>
                </form:label>
            </td>
            <td>
                <form:input path="lastName"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="name">
                    <spring:message text="Last name"/>
                </form:label>
            </td>
            <td>
                <form:input path="name"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="dateOfBirth">
                    <spring:message text="Date of birth"/>
                </form:label>
            </td>
            <td>
                <form:input type="date" path="dateOfBirth"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="departmentName">
                    <spring:message text="Department"/>
                </form:label>
            </td>
            <td>
                <form:select path="departmentName">
                    <form:option value="0" label="Select"/>
                    <form:options items="${departmentsList}"/>
                </form:select>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="dateOfEmployment">
                    <spring:message text="Date of birth"/>
                </form:label>
            </td>
            <td>
                <form:input type="date" path="dateOfEmployment"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="salary">
                    <spring:message text="Date of birth"/>
                </form:label>
            </td>
            <td>
                <form:input path="salary"/>
            </td>
        </tr>
        <tr>
        <td colspan="2">
            <input type="submit" value="<spring:message text="Edit User"/>"/>
        </td>
        </tr>
    </table>
</form:form>
</body>
</html>

