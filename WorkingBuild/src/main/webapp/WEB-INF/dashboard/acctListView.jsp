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
					<td>Account #</td>
					<td>Acct Type</td>
					<td>Balance</td>
					<td>Rate (%)</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${accounts}" var="acct">
					<tr onclick="updateAcctView(${acct.getId()});">
						<td>${acct.getAccountNumber()}</td>
						<td>${acct.getAccountType().getTypeName()}</td>
						<td>${acct.getBalance()}</td>
						<td>${acct.getRate()}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</body>
</html>