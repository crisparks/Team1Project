<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Open CD</title>
	</head>
	<body>
		<table>
			<thead>
				<tr>
					<td>Account #</td>
					<td>Amout</td>
					<td>Rate</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${cds}" var="a">
					<tr>
						<td>${a.toString()}</td>
						<td>${a.getBalance()}</td>
						<td>${a.getRate()}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div>
			<h2>With a deposit amount of ${amount}, you can choose from these CDs...</h2>
			<form method="post">
				<c:forEach items="${options}" var="o">
				  	<button formaction="/openCd/${o.getId()}">${o.getTerm()} Years - ${o.getRate()}%</button>
				</c:forEach>
			</form>
		</div>
	</body>
</html>