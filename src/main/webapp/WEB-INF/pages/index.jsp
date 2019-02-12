<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>popovich.com</title>
    <link rel="stylesheet" href="/resources/css/style.css" type="text/css"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" >
</head>
<body>
<header>
    <h1> Database of employees</h1>
</header>
<section>
    <spring:form class="login_form"  modelAttribute="user" method="POST" action="/myapplication/login/process">
        <p class="field">
            <spring:input type="text" name="userName" placeholder="userName" autofocus="true" path="userName"/>
            <i class="fas fa-user"></i>
        </p>
        <p class="field">
            <spring:input type="password" name="password" placeholder="password" path="password"/>
            <%--<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>--%>
            <i class="fas fa-lock"></i>
        </p>
        <p class="submit">
            <spring:button type="submit" name="submit"><i class="fas fa-arrow-circle-right"></i></spring:button>
        </p>
        <p class="reg_ref">
            <a href="<c:url value="/registration"/>">Create an account</a>
        </p>
    </spring:form>
</section>
<footer>
    <h3>
        popovich.com
    </h3>
</footer>
</body>
</html>
