<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
	<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
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