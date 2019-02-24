<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Add new department</title>
</head>
<body>
<div>
    <form:form method="POST" modelAttribute="department">
        <h2 >Create new department</h2>
        <form:input type="text" path="name"  placeholder="new department"
                    autofocus="true"></form:input>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
    </form:form>
</div>
</body>
</html>

