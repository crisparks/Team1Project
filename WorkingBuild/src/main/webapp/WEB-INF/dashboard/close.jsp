<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
	</head>
	<body>
		<div class="w3-respnsive">
			<div class="w3-respnsive">
				<select onchange="toggleAcctAction(value)">
					<option label="Close Account" value="close">
					<option label="Open Account" value="open">
				</select>
			</div>
			<h3>Close an account</h3>
			<form:form id='closeacct' method='post' modelAttribute="dm.cafo"
				style="margin-top: 25px;">
				<fieldset class='fieldset-auto-width'>
					<legend>Close Account</legend>
					<table class="w3-table-all w3-hoverable">
						<tbody>
							<tr class="w3-light-grey">
								<td>Account:</td>
								<td><form:select path="acctToClose" required="true">
										<option value="Account to Close"></option>
										<c:forEach items="${accts}" var="a">
											<option value="${a.getAccountNumber()}">${a.toString()}</option>
										</c:forEach>
								</form:select></td>
							</tr>
							<tr>
								<td><form:select path="balanceTarget" required="true">
										<option value="">Deposit Into</option>
											<c:forEach items="${accts}" var="a">
												<option value="${a.getAccountNumber()}">${a.toString()}</option>
											</c:forEach>
								</form:select></td>								
							</tr>
							<tr>
								<td><input formaction='/closeAccount' type='submit' value='Close Account' /></td>
							</tr>
						</tbody>
					</table>
				</fieldset>
			</form:form>
		</div>	
	</body>
</html>