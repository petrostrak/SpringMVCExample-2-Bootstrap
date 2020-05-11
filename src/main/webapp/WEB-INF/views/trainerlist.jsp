<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Users List</title>
	<link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
	<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
</head>

<body>
	<div class="generic-container">
		<div class="panel panel-default">
		  	<div class="panel-heading"><span class="lead">List of Trainers </span></div>
			<table class="table table-hover">
	    		<thead>
		      		<tr>
				        <th>Firstname</th>
				        <th>Lastname</th>
				        <th>Subject</th>
				        <th width="100"></th>
				        <th width="100"></th>
					</tr>
		    	</thead>
	    		<tbody>
				<c:forEach items="${trainers}" var="trainer">
					<tr>
						<td>${trainer.firstName}</td>
						<td>${trainer.lastName}</td>
						<td>${trainer.subject}</td>
						<td><a href="<c:url value='${editurl}/${trainer.id}' />" class="btn btn-success custom-width">edit</a></td>
						<td><a href="<c:url value='${deleteurl}/${trainer.id}' />" class="btn btn-danger custom-width">delete</a></td>
					</tr>
				</c:forEach>
	    		</tbody>
	    	</table>
		</div>
	 	<div class="well">
	 		<a href="<c:url value='/new' />">Add New Trainer</a>
	 	</div>
   	</div>
</body>
</html>