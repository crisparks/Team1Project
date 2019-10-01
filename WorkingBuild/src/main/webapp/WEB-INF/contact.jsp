<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Merit Banking</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="css/bank.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script type="text/javascript">
	
</script>
</head>
<body>
	<img src="img/MeritBankLogo.gif" alt="MeritBankOfAmericaLogo" />
	<div id="top_links">
		<div id="header">
			<h2>Your Number One Bank</h2>
		</div>
		<div id="navigation">
			<ul>
				<li><a href="/">HOME</a></li> 
				<li><a href="/locations">LOCATIONS</a></li>
				<li><a href="/about">ABOUT US</a></li>
				<li><a href="/contact">CONTACT US </a></li>
			</ul>
			<div id="formcontainer">
				<form class="navbar-form navbar-right">
					<input class="form-control col-lg-8" type="text"
						placeholder="  Search" aria-label="Search">
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
				</form>
			</div>

			<div class="w3-dropdown-hover">
				<button class="w3-button">
					<div class="bar"></div>
					<div class="bar"></div>
					<div class="bar"></div>
				</button>
				<div class="w3-dropdown-content w3-bar-block w3-border">
					<a href="/" class="w3-bar-item w3-button">HOME</a> <a
						href="/locations" class="w3-bar-item w3-button">LOCATIONS</a> <a
						href="/about" class="w3-bar-item w3-button">ABOUT US</a> <a
						href="/contact" class="w3-bar-item w3-button">CONTACT US</a>
				</div>
			</div>
		</div>
	</div>
	
	<div class="inputs">
		<div align="center">
			<form:form method='post' modelAttribute="ufo">
				<input type="hidden" name="_method" value="put" />
				<fieldset class='fieldset-auto-width'>
					<legend>Get in touch</legend>
					<table>
						<tbody>
							<c:if test="${error == true}">
								<p class='alert'>That email address is in use!</p>
							</c:if>
							<tr>
								<td>First name:</td>
								<td><input type='text' name='firstName' required></td>
							</tr>
							<tr>
								<td>Last name:</td>
								<td><input type='text' name='lastName' required></td>
							</tr>
							<tr>
								<td>Email:</td>
								<td><input type='email' id='email' name='email' required></td>
								<td><form:errors path="email" cssStyle="color: #ff0000;" /></td>
							</tr>
							<tr>
								<td>Subject:</td>
								<td><textarea id="subject" name="subject"
									placeholder="Write something.." style="height: 120px"></textarea></td>
							</tr>
						</tbody>
					</table>
					<input formaction='/createUser' id='btn_create' type='submit' value='Submit' disabled /> 
					<input type='reset' value='Clear' />
				</fieldset>
			</form:form>
		</div>
	</div>

	<div id="footer">
               <h1 class="copyright">Copyright&#169; Team Sparks </h1>
            </div>
	<script type="text/javascript" src="JavaScript.js"></script>
</body>
</html>






