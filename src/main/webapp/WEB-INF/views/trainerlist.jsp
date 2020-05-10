<%-- 
    Document   : trainerlist
    Created on : May 9, 2020, 6:01:58 PM
    Author     : petros_trak
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trainer's List</title>
    </head>
    <body>
        <h1>Trainer List</h1>
        <table>
		<tr>
                    <td>ID</td><td>FIRST NAME</td><td>LAST NAME</td><td>SUBJECT</td><td></td>
		</tr>
		<c:forEach items="${trainers}" var="trainer"> 
			<tr>
                            <!-- edit: http://localhost:8081/edit/{id} -->
                            <td><a href="<c:url value='${editurl}/${trainer.id}' />">${trainer.id}</a></td>
                            <td>${trainer.firstName}</td>
                            <td>${trainer.lastName}</td>
                            <td>${trainer.subject}</td>
                            <td><a href="<c:url value='${deleteurl}/${trainer.id}' />">delete</a></td>
			</tr>
		</c:forEach>
	</table>
        <div id="msg">${msg}</div>
    </body>
</html>
