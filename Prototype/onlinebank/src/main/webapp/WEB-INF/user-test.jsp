<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Test</title>
</head>
<body>
<table>
	<thead>
		<tr>
			<th>First</th>
			<th>Last</th>
			<th>Email</th>
			<th>Password</th>
			<th>addr1</th>
			<th>addr2</th>
			<th>City</th>
			<th>State</th>
			<th>Zip</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${users}" var="u">
			<tr>
				<td>${u.getFirstName()}</td>
				<td>${u.getLastName()}</td>
				<td>${u.getEmail()}</td>
				<td>${u.getPassword()}</td>
				<td>${u.getAddress().getLine1()}</td>
				<td>${u.getAddress().getLine2()}</td>
				<td>${u.getAddress().getCity()}</td>
				<td>${u.getAddress().getState()}</td>
				<td>${u.getAddress().getZip()}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
</body>
</html>