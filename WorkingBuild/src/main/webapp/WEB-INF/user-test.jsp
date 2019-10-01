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
			<th># Accts</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${users}" var="u">
			<c:set var="addr" value="${u.getAddress()}"></c:set>
			<tr>
				<td>${u.getFirstName()}</td>
				<td>${u.getLastName()}</td>
				<td>${u.getEmail()}</td>
				<td>${u.getPassword()}</td>
				<td>${addr.getLine1()}</td>
				<td>${addr.getLine2()}</td>
				<td>${addr.getCity()}</td>
				<td>${addr.getState()}</td>
				<td>${addr.getZip()}</td>
				<td>
					<table>
						<tbody>
							<c:forEach items="${u.getAccounts()}" var="account">
								<tr>
									<td>${account.getId()}</td>
									<td>${account.getAccountNumber()}</td>
									<td>${account.getBalance()}</td>
									<td>${account.getRate()}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>				
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>



















</body>
</html>