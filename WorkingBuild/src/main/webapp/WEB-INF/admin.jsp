<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Admin Dash</title>
		<link href="css/style.css" rel="stylesheet" type="text/css">
		<link href="css/bank.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	</head>
<body>
	<img id="logo" src="MeritBankLogo.gif" alt="MeritBankOfAmericaLogo" />
	<div id="top_links">
		<div id="header">
			<h3>Your Number One Bank</h3>
		</div>
		<div id="navigation">
			<ul>
				<li><a href="login.jsp">HOME</a></li>
				<li><a href="locations.jsp">LOCATIONS</a></li>
				<li><a href="about.jsp">ABOUT US</a></li>
				<li><a href="contact.jsp">CONTACT US </a></li>
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
					<a href="login.jsp" class="w3-bar-item w3-button">HOME</a> <a
						href="locations.jsp" class="w3-bar-item w3-button">LOCATIONS</a> <a
						href="about.jsp" class="w3-bar-item w3-button">ABOUT US</a> <a
						href="contact.jsp" class="w3-bar-item w3-button">CONTACT US</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>