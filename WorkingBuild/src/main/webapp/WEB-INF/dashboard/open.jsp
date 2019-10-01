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
					<option label="Open Account" value="open">
					<option label="Close Account" value="close">
				</select>
			</div>
			<h3>Open a new account</h3>
			<form:form id='newacct' method='post' modelAttribute="dm.nafo"
				style="margin-top: 25px;">
				<fieldset class='fieldset-auto-width'>
					<legend>New Account</legend>
					<table class="w3-table-all w3-hoverable">
						<tbody>
							<tr class="w3-light-grey">
								<td>Account Type:</td>
								<td><form:select path="acctType" required="true">
										<option value="">Account Type</option>
										<c:forEach items="${dm.getAccountTypes()}" var="t">
											<option value="${t}">${t}</option>
										</c:forEach>
									</form:select></td>
							</tr>
							<tr>
								<td>Deposit Amount:</td>
								<td><span class="input-symbol-ds"><form:input
											type="number" step="0.01" path="amount"></form:input></span></td>
							</tr>
							<tr>
								<td><form:input type="hidden" path="user_id"
										value="${dm.user.getId()}"></form:input></td>
								<td><input formaction='/createAccount' type='submit'
									value='Open Account' /></td>
							</tr>
						</tbody>
					</table>
				</fieldset>
			</form:form>
		</div>	
	</body>
</html>