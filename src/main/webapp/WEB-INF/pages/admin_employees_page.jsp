
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Employees</title>
</head>
<body>
<c:if test="${!empty listEmployees}">
    <table class="tg">
        <tr>
            <th width="80">ID</th>
            <th width="120">Last name</th>
            <th width="120">Name</th>
            <th width="120">Date of birth</th>
            <th width="120">Date of employment</th>
            <th width="120">Department</th>
            <th width="120">Salary</th>
            <th width="60">Edit</th>
            <th width="60">Delete</th>
        </tr>
        <c:forEach items="${listEmployees}" var="employee">
            <tr>
                <td>${employee.id}</td>
                <td>${employee.lastName}</td>
                <td>${employee.name}</td>
                <td>${employee.dateOfBirth}</td>
                <td>${employee.dateOfEmployment}</td>
                <td>${employee.department}</td>
                <td>${employee.salary}</td>
                <a href="<c:url value='/myapplication/admin/employeess/add'/>">Add employee</a></td>
                <%--<td><a href="<c:url value='/myapplication/admin/users/edit/${user.id}'/>">Edit</a></td>
                <td><a href="<c:url value='/myapplication/admin/users/delete/${user.id}'/>">Delete</a></td>--%>
            </tr>
        </c:forEach>
    </table>
</c:if>
<br/>
<h2>
    <a href="<c:url value="/myapplication/admin"/>">to admin page</a>
</h2>
</body>
</html>
