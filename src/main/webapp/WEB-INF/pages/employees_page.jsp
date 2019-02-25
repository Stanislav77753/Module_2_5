
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Employees</title>
</head>
<body>
<c:if test="${!empty listEmployees}">
    <h1>Employees</h1>
    <table class="tg">
        <tr>
            <th width="80">ID</th>
            <th width="120">Last name</th>
            <th width="120">Name</th>
            <th width="120">Date of birth</th>
            <th width="120">Date of employment</th>
            <th width="120">Department</th>
            <th width="120">Salary</th>
            <c:choose>
                <c:when test="${pageContext.request.isUserInRole('ROLE_ADMIN')}">
                    <th width="60">Edit</th>
                    <th width="60">Delete</th>
                </c:when>
                <c:when test="${pageContext.request.isUserInRole('ROLE_MODERATOR')}">
                    <th width="60">Edit</th>
                    <th width="60">Delete</th>
                </c:when>
            </c:choose>
        </tr>
        <c:forEach items="${listEmployees}" var="employee">
            <tr>
                <td>${employee.id}</td>
                <td>${employee.lastName}</td>
                <td>${employee.name}</td>
                <td>${employee.dateOfBirth}</td>
                <td>${employee.dateOfEmployment}</td>
                <td>${employee.department.name}</td>
                <td>${employee.salary}</td>
                <c:choose>
                    <c:when test="${pageContext.request.isUserInRole('ROLE_ADMIN')}">
                        <td><a href="<c:url value='/myapplication/admin/employees/edit/${employee.id}'/>">Edit</a></td>
                        <td><a href="<c:url value='/myapplication/admin/employees/delete/${employee.id}'/>">Delete</a></td>
                    </c:when>
                    <c:when test="${pageContext.request.isUserInRole('ROLE_MODERATOR')}">
                        <td><a href="<c:url value='/myapplication/moderator/employees/edit/${employee.id}'/>">Edit</a></td>
                        <td><a href="<c:url value='/myapplication/moderator/employees/delete/${employee.id}'/>">Delete</a></td>
                    </c:when>
                </c:choose>
            </tr>
        </c:forEach>
    </table>
</c:if>
<br/>
<h2>
    <c:choose>
        <c:when test="${pageContext.request.isUserInRole('ROLE_ADMIN')}">
            <a href="<c:url value='/myapplication/admin/employees/add'/>">Add employee</a></td> <br/>
            <a href="<c:url value="/myapplication/admin"/>">to admin page</a>
        </c:when>
        <c:when test="${pageContext.request.isUserInRole('ROLE_MODERATOR')}">
            <a href="<c:url value='/myapplication/moderator/employees/add'/>">Add employee</a></td> <br/>
            <a href="<c:url value="/myapplication/moderator"/>">to moderator page</a>
        </c:when>
        <c:otherwise>
            <a href="<c:url value="/myapplication/user"/>">to user page</a>
        </c:otherwise>
    </c:choose>
</h2>
</body>
</html>
