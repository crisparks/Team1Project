<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="css/login.css">
		<title>Merit Banking Services</title>
	</head>
	<body id='login'>
		<div class='container'>
			<div><h1>Merit Banking Services</h1></div>
			<div>
				<form method='post'>
					<fieldset class='fieldset-auto-width'>
						<legend>Login</legend>
						<table><tbody>
						<c:if test="${failed} == true">
							<tr><td class='alert'>Invalid credentials!</td></tr>
						</c:if>
							<tr>
								<td>Email:</td><td><input type='text' name='email'/></td>
							</tr>
							<tr>
								<td>Password:</td><td><input type='password' name='pass'/></td>
							</tr>
						</tbody></table>
	
						<input formaction='/signup' type='submit' value='Create Account' />
						<input formaction='/signin' type='submit' value='Access Account' />
					</fieldset>				
				</form>
			</div>
		</div>
		<form><input formaction='/user-test' type='submit' value='All Users'></form>
	</body>
</html>