<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<html>
<head>
    <title>Add new employee</title>
</head>
<body>
<form:form method="POST" modelAttribute="employee">
    <h2>Create new employee</h2>
    <table>
        <tr>
            <td>
                Lastname:
            </td>
            <td>
                <form:input type="text" path="lastName" placeholder="Lastname"></form:input>
            </td>
        </tr>
        <tr>
            <td>
                Name:
            </td>
            <td>
                <form:input type="text" path="name" placeholder="Name"></form:input>
            </td>
        </tr>
        <tr>
            <td>
                Date of birth:
            </td>
            <td>
                <form:input type="date" path="dateOfBirth" placeholder="Date of birth"  ></form:input>
            </td>
        </tr>
        <tr>
            <td>Department:</td>
            <td>
                <form:select path="departmentName">
                    <form:option value="0" label="Select"/>
                    <form:options items="${departmentsList}"/>
                </form:select>
            </td>
        </tr>
        <tr>
            <td>
                Date of employment:
            </td>
            <td>
                <form:input type="date" path="dateOfEmployment" placeholder="Date Of Employment"></form:input>
            </td>
        </tr>
        <tr>
            <td>Salary</td>
            <td>
                <form:input type="text" path="salary" placeholder="Salary"></form:input>
            </td>
        </tr>
    </table>
    <button  type="submit">Add new Employee</button>
</form:form>
</body>
</html>
