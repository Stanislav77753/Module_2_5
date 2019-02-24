<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>AccessDenied</title>
</head>
<body>
<h1>Доступ закрыт!</h1>
<h2> ${errorMsg}</h2>
<c:set var="amount" value="12345.123456789"/>
<br/>
Default
<br/>
<fmt:formatNumber value="${amount}" type="currency"/>
<br/>
<br/>
maxintdigit = 3
<br/>
<fmt:formatNumber type="number" maxIntegerDigits="3" value="${amount}"/>
<br/>
<br/>
maxFractionDigid = 5;
<br/>
<fmt:formatNumber type="number" maxFractionDigits="5" value="${amount}"/>
<br/>
<br/>



</body>
</html>
