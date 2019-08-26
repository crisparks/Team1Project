<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
				<form:form id='signup' method='post' onsubmit="return validateSignup();" modelAttribute="user">
		    		<input type="hidden" name="_method" value="put">
					<fieldset class='fieldset-auto-width'>
						<legend>New Account</legend>
						<table><tbody>
							<tr>
								<td>First name:</td><td><input type='text' name='firstName' required></td>
							</tr>
							<tr>
								<td>Last name:</td><td><input type='text' name='lastName' required></td>
							</tr>
							<tr>
								<td>Email:</td><td><input type='email' id='email' name='email' required></td>
							</tr>
							<tr>
								<td>Password:</td><td><input type='password' name='password' required></td>
							</tr>
							<tr>
								<td>Confirm:</td><td><input type='password' name='pwc' required></td>
							</tr>
							<tr>
								<td>Address1:</td><td><input type='text' name='line1' required></td>
							</tr>
							<tr>
								<td>Address2:</td><td><input type='text' name='line2'></td>
							</tr>
							<tr>
								<td>City:</td><td><input type='text' name='city' required></td>
							</tr>
							<tr>
								<td>State:</td><td><input type='text' name='state' required></td>
							</tr>
							<tr>
								<td>Zip:</td><td><input type='text' name='zip' required></td>
							</tr>
						</tbody></table>
	
						<input formaction='/create' id='btn_create' type='submit' value='Create Account' disabled />
						<input type='reset' value='Clear' />
					</fieldset>	
				</form:form>
			</div>
		</div>
		<script>
			const x = document.getElementById('signup');
			const btnCreate = document.getElementById('btn_create');
			const email = document.getElementById('email');
		
			function validateSignup() {
				var first = x["first"];
				var last = x["last"];
				var pw = x["pw"].value;
				var pwc = x["pwc"].value;
				var email = x["email"];
				var addr1 = x["addr1"];
				var addr2 = x["addr2"];
				var city = x["city"];
				var state = x["state"];
				var zip = x["zip"];
				alert("PW: " + pw + "   -   PWC: " + pwc);
				if (!(pw === pwc)) {
				    alert("Passwords don't match!");
				    return false;		
				}
				x.submit();
			}
			
			email.addEventListener('keyup', function (event) {
				  isValidEmail = email.checkValidity();
				  
				  if ( isValidEmail ) {
					  btnCreate.disabled = false;
				  } else {
					  btnCreate.disabled = true;
				  }
				});
			
			
			window.onload = function() {
			}
			
		</script>
	</body>
</html>