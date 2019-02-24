<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Departments</title>
</head>
<body>
<c:if test="${!empty listDepartments}">
    <h1>Departments</h1>
    <table class="tg">
        <tr>
            <th width="80">ID</th>
            <th width="120">Department</th>
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

        <c:forEach items="${listDepartments}" var="department">
            <tr>
                <td>${department.id}</td>
                <td>${department.name}</td>
                <c:choose>
                    <c:when test="${pageContext.request.isUserInRole('ROLE_ADMIN')}">
                        <td><a href="<c:url value='/myapplication/admin/departments/edit/${department.id}'/>">Edit</a></td>
                        <td><a href="<c:url value='/myapplication/admin/departments/delete/${department.id}'/>">Delete</a></td>
                    </c:when>
                    <c:when test="${pageContext.request.isUserInRole('ROLE_MODERATOR')}">
                        <td><a href="<c:url value='/myapplication/moderator/departments/edit/${department.id}'/>">Edit</a></td>
                        <td><a href="<c:url value='/myapplication/moderator/departments/delete/${department.id}'/>">Delete</a></td>
                    </c:when>
                </c:choose>
               <%-- <c:if test="${pageContext.request.isUserInRole('ROLE_ADMIN')}">
                <td><a href="<c:url value='/myapplication/admin/departments/edit/${department.id}'/>">Edit</a></td>
                <td><a href="<c:url value='/myapplication/admin/departments/delete/${department.id}'/>">Delete</a></td>
                </c:if>
                <c:if test="${pageContext.request.isUserInRole('ROLE_MODERATOR')}">
                    <td><a href="<c:url value='/myapplication/moderator/departments/edit/${department.id}'/>">Edit</a></td>
                    <td><a href="<c:url value='/myapplication/moderator/departments/delete/${department.id}'/>">Delete</a></td>
                </c:if>--%>
            </tr>
        </c:forEach>
    </table>
</c:if>
<h2>
    <c:choose>
        <c:when test="${pageContext.request.isUserInRole('ROLE_ADMIN')}">
            <a href="<c:url value='/myapplication/admin/departments/add'/>">Add department</a></td> <br/>
            <a href="<c:url value="/myapplication/admin"/>">to admin page</a>
        </c:when>
        <c:when test="${pageContext.request.isUserInRole('ROLE_MODERATOR')}">
            <a href="<c:url value='/myapplication/moderator/departments/add'/>">Add department</a></td> <br/>
            <a href="<c:url value="/myapplication/moderator"/>">to moderator page</a>
        </c:when>
        <c:otherwise>
            <a href="<c:url value="/myapplication/user"/>">to user page</a>
        </c:otherwise>
    </c:choose>
   <%-- <c:if test="${pageContext.request.isUserInRole('ROLE_ADMIN')}">
        <a href="<c:url value='/myapplication/admin/departments/add'/>">Add department</a></td> <br/>
        <a href="<c:url value="/myapplication/admin"/>">to admin page</a>
    </c:if>
    <c:if test="${pageContext.request.isUserInRole('ROLE_MODERATOR')}">
        <a href="<c:url value='/myapplication/moderator/departments/add'/>">Add department</a></td> <br/>
        <a href="<c:url value="/myapplication/moderator"/>">to admin moderator</a>
    </c:if>--%>
</h2>

</body>
</html>
