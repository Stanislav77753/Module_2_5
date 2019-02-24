
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>User edit</title>
</head>
<body>
<form:form action="/myapplication/admin/users/edit/result" commandName="user" >
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
        <tr>
            <td>Roles:</td>
            <td>
                <form:select path="newRole">
                    <form:option value="0" label="Select"/>
                    <form:options items="${all_roles}"/>
                </form:select>
            </td>
        </tr>
        <td colspan="2">
            <input type="submit" value="<spring:message text="Edit User"/>"/>
        </td>
        </tr>
    </table>
</form:form>
</body>
</html>
