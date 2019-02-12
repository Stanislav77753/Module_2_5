<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <meta charset="UTF-8">
    <title>login</title>
    <link rel="stylesheet" href="/resources/css/style.css" type="text/css">
</head>
<body>
<section class="container">
    <div class="111">
        <h1 class="text">
            Log in form
        </h1>
        <form method="POST" action="${contextPath}/login">
            <input name="userName" type="text" placeholder="Username"
                   autofocus="true"/>
            <input name="password" type="password"  placeholder="Password"/>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <button  type="submit">Log In</button>
            <a href="<c:url value="/registration"/>">Create an account</a>
        </form>
    </div>
</section>
</body>
</html>
