<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/dashboard.css">
</head>
<body>
	<table class="w3-table-all w3-hoverable">
		<thead>
			<tr class="w3-light-grey">
				<th>Account #</th>
				<th>Acct Type</th>
				<th>Balance</th>
				<th>Rate (%)</th>
		</thead>
		<tbody>
			<tr>
				<td>${dm.account.getAccountNumber()}</td>
				<td>${dm.account.acctType()}</td>
				<td>${dm.account.getBalance()}</td>
				<td>${dm.account.getRate()}</td>
			</tr>
		</tbody>
	</table>
	<table class="scroll-table" style="height: 300px; overflow-y: auto;">
		<tbody>
			<c:forEach items="${dm.account.getTransactions()}" var="t">
				<tr>
					<td>${t.getType()}</td>
					<td>${t.getDescription()}</td>
					<td>${t.getAmount()}</td>
					<td>${t.getCreated()}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>