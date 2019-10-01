<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Dashboard</title>
		<link href="css/style.css" rel="stylesheet" type="text/css">
		<link href="css/w3style.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<script src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
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
	<div id="top-left">
		<div id="user-view">
			<table>
				<thead>
					<tr>
						<th>First</th>
						<th>Last</th>
						<th>Email</th>
						<th>Location</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${dm.user.getFirstName()}</td>
						<td>${dm.user.getLastName()}</td>
						<td>${dm.user.getEmail()}</td>
						<td>${dm.user.getAddress().getCity()},
							${dm.user.getAddress().getState()}</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="open-acct-view">
			<form:form id='newacct' method='post' modelAttribute="dm.nafo">
				<fieldset class='fieldset-auto-width'>
					<legend>New Account</legend>
					<table>
						<tbody>
							<tr>
								<td>Account Type:</td>
								<td><form:select path="acctType" required="true">
										<option value="">Account Type</option>
										<form:options />
									</form:select></td>
							</tr>
							<tr>
								<td>Deposit Amount:</td>
								<td><span class="dollar-sign">$</span>
								<form:input id="amount-input" type="number" step="0.01"
										path="amount"></form:input></td>
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
	</div>
	<div id="top-right">
		<div id="account-view">
			<table>
				<thead>
					<tr>
						<th>Account #</th>
						<th>Acct Type</th>
						<th>Balance</th>
						<th>Rate (%)</th>
				</thead>
				<tbody>
					<tr>
						<td>${dm.account.getAccountNumber()}</td>
						<td>${dm.account.getAccountType().getTypeName()}</td>
						<td>${dm.account.getBalance()}</td>
						<td>${dm.account.getRate()}</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="transaction-view">
			<form:form id='transaction' method='post' modelAttribute="dm.tfo">
				<form:input type="hidden" path="tAcct"
					value="${dm.account.getAccountNumber()}"></form:input>
				<%-- 				<form:input type="hidden" path="account" value="${dm.getAccount()}"></form:input> --%>
				<fieldset class='fieldset-auto-width'>
					<legend>Transaction</legend>
					<table>
						<thead>
							<tr>
								<th>Type</th>
								<th>To/From</th>
								<th>Amount</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${dm.isFailed()==true}">
								<tr>
									<td>${dm.error()}</td>
								</tr>
							</c:if>
							<tr>
								<td><form:select path="tType" required="true">
										<option value="">Transaction Type</option>
										<c:forEach items="${dm.getTransactionTypes()}" var="t">
											<form:option value="${t}">${t}</form:option>
										</c:forEach>
									</form:select></td>
								<td><form:select path="oAcct" required="true">
										<form:option value="">Select</form:option>
										<c:forEach items="${dm.user.getAccounts()}" var="a">
											<form:option value="${a.getId()}">${a.toString()}</form:option>
										</c:forEach>
									</form:select></td>
								<td><span class="dollar-sign">$</span>
								<form:input id="amount-input" type="number" step="0.01"
										path="amount"></form:input></td>
							</tr>
							<tr>
								<td></td>
								<td><input formaction='/transaction' type='submit'
									value='GO' /></td>
							</tr>
						</tbody>
					</table>
				</fieldset>
			</form:form>
		</div>
	</div>
	<div id="bottom-left">
		<div id="account-list">
			<table>
				<thead>
					<tr>
						<td>Account #</td>
						<td>Type</td>
						<td>Balance</td>
						<td>Rate (%)</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${dm.user.getAccounts()}" var="acct">
						<tr onclick="updateAcctView(${acct.getId()});">
							<td>${acct.getAccountNumber()}</td>
							<td>${acct.getAccountType().getTypeName()}</td>
							<td>${acct.getBalance()}</td>
							<td>${acct.getRate()}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div id="bottom-right"></div>
	<script>
		    function updateAcctView($val) {
		        $.ajax({
		            type: "GET",  
		            url: "/acctView/" + $val,
		            success: function(response) {
		                $("#account-view").html( response );
		            }
		        });
		    }
/////////////////////////////////////////////////////////////////////////////				    
		</script>
</body>
</body>
</html>
