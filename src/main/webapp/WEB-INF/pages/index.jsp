<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix= "security" uri= "http://www.springframework.org/security/tags" %>
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
        <security:authorize access= "hasAnyRole('ROLE_ADMIN','ROLE_MODERATOR', 'ROLE_USER')" var= "isUSer"/>
        <font size= "2" color= "red">
            <c:if test= "${not isUSer}">
                <c:if test= "${empty param.error}">
                    Вы не вошли
                </c:if>
            </c:if>
        </font>

        <font size= "2" color= "green">
            <c:if test= "${isUSer}">Вы вошли как:
                <security:authentication property= "principal.username"/> с ролью:
                <b><security:authentication property= "principal.authorities"/></b>
            </c:if>
        </font>
        <br/>
        <p class="field">
            <spring:input type="text" name="userName" placeholder="username" autofocus="true" path="userName"/>
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
