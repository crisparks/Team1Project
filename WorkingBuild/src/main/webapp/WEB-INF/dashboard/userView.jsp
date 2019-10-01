<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="css/dashboard.css">
	</head>
	<body>
		<table>
			<thead>
				<tr>
					<th>First</th>
					<th>Last</th>
					<th>Email</th>
					<th>Location</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${user.getFirstName()}</td>
					<td>${user.getLastName()}</td>
					<td>${user.getEmail()}</td>
					<td>${user.getAddress().getCity()}, ${user.getAddress().getState()}</td>
				</tr>
			</tbody>
		</table>
	</body>
</html>