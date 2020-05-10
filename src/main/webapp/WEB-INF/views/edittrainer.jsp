<%-- 
    Document   : newtrainer
    Created on : May 9, 2020, 6:02:08 PM
    Author     : petros_trak
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Trainer</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    </head>
    <body>

        <%
            String updateUrlFINAL = request.getContextPath() + "/" + request.getAttribute("updateurl");
            session.setAttribute("updateUrlFINAL", updateUrlFINAL);
        %>

        <h1>Edit a Trainer</h1>
        <form:form method="POST" action="${updateUrlFINAL}" modelAttribute="trainer">
            <form:input type="hidden" path="id" id="id"/>
            First Name: <form:input path="firstName" /><br />
            Last Name: <form:input path="lastName" /><br />
            Subject : <form:input path="subject" /><br />
            <input type="submit" value="update">
        </form:form>
        <div id="msg">${message}</div>
        <div id="list"><a href="<c:url value='/${trainerService.getListUrl()}' />">Back to the list of Trainers</a></div>
    </body>
</html>
