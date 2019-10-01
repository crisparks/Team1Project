<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" type="text/css" href="dashStyle.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Dashboard</title>
</head>
<body>
	<c:set var="usession" value="re"></c:set>
	<img src="img/MeritBankLogo.gif" alt="MeritBankOfAmericaLogo"
		width="600" />
	<div id="top_links">
		<div id="header">
			<h2>Your Number One Bank</h2>
		</div>
		<div id="navigation">
			<ul>
				<li><a href="/logout">LOG OUT</a></li>
				<li><a href="/locations">LOCATIONS</a></li>
				<li><a href="/about">ABOUT US</a></li>
				<li><a href="/contact">CONTACT US</a></li>
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
		<div id="wrapper">
			<h1 class="content_header">Welcome, ${dm.user.getFirstName()}!</h1>
			<div id="main_content">
				<div class="row1">
					<!-- Top Left BOX-->
					<div class="dsubcontents dlg md sm">
						<div class="w3-respnsive">
							<p style="font-size: 20px">${dm.user.getName()}</p>
							<p style="font-size: 15px">${dm.user.getEmail()}</p>
							<p style="font-size: 13px">${dm.user.getAddress().getCity()},
								${dm.user.getAddress().getState()}</p>
							<p style="font-size: 13px">Customer since
								${dm.user.getCreatedDate()}</p>

						</div>
						<div id="newAcct-view">
							<c:choose>
								<c:when test="${dm.showClose == true}">
									<jsp:include page="close.jsp" />
								</c:when>
								<c:otherwise>
									<jsp:include page="open.jsp" />
								</c:otherwise>
							</c:choose>

						</div>
					</div>
					<!-- Top right box-->
					<div class="dsubcontents dlg md sm">
						<div id="account-view">
							<table class="w3-table-all w3-hoverable">
								<thead>
									<tr class="w3-light-grey">
										<th>Account #</th>
										<th>Acct Type</th>
										<th>Balance</th>
										<th>Rate (%)</th>
									</tr>
								</thead>
								<tr>
									<td>${dm.account.getAccountNumber()}</td>
									<td>${dm.account.acctType()}</td>
									<th>${dm.account.getBalance()}</</th>
									<th>${dm.account.getRate()}</th>
								</tr>
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
							</tbody></table>
						</div>
					</div>
				</div>
				<div class="row2">
					<!-- Bottom left box-->
					<div class="dsubcontents dlg md sm">
						<table class="w3-table-all w3-hoverable">
							<thead>
								<tr class="w3-light-grey">
									<th>Account #</th>
									<th>Acct Type</th>
									<th>Balance</th>
									<th>Rate (%)</th>
								</tr>
							</thead>
							<c:forEach items="${dm.user.getAccounts()}" var="acct">
								<c:if test="${acct.acctType() != 'Closed'}">
									<tr onclick="updateAcctView(${acct.getId()});">
										<td>${acct.getAccountNumber()}</td>
										<td>${acct.acctType()}</td>
										<th>${acct.getBalance()}</th>
										<th>${acct.getRate()}</th>
									</tr>
								</c:if>

							</c:forEach>
						</table>
					</div>
					<!--Bottom right -->
					<div class="dsubcontents dlg md sm">
						<span>Transaction</span> <select name="tType" id="tType"
							onchange="transactionSelect(value)">
							<option value="">Select Transaction</option>
							<c:forEach items="${dm.getTransactionTypes()}" var="t">
								<option value="${t}">${t}</option>
							</c:forEach>
						</select>
						<div id="transaction-view" class="w3-responsive">
							<form:form id='transaction' method='post' modelAttribute="dm.tfo">
								<fieldset class='fieldset-auto-width'>
									<legend>Transaction</legend>

								</fieldset>
							</form:form>
						</div>
					</div>
				</div>
				<div id="footer">
					<h1 class="copyright">Copyright&#169; Team Sparks</h1>
				</div>
			</div>
		</div>
		<!--end of footer-->
		<!-- Bootstrap core JavaScript
           ================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
		<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
		<script src="../../assets/js/vendor/popper.min.js"></script>
		<script src="../../dist/js/bootstrap.min.js"></script>
	</div>
	<script>
         // When the user scrolls the page, execute myFunction 
         window.onscroll = function() {myFunction()};
         // Get the navbar
         var navbar = document.getElementById("navigation");
         // Get the offset position of the navbar
         var sticky = navbar.offsetTop;
         // Add the sticky class to the navbar when you reach its scroll position. Remove "sticky" when you leave the scroll position
         function myFunction() {
	         if (window.pageYOffset >= sticky) {
	            navbar.classList.add("sticky")
	         } else {
	            navbar.classList.remove("sticky");
	         }
         }

		function transactionSelect($val){
			var mygetrequest=new XMLHttpRequest();
			mygetrequest.onreadystatechange=function() {
				if (mygetrequest.readyState==4){
					if (mygetrequest.status==200 || window.location.href.indexOf("http")==-1){
						document.getElementById("transaction-view").innerHTML = mygetrequest.responseText;
					} else {
						alert("An error has occured making the request " + mygetrequest.readyState + " " + mygetrequest.status);
					}
				}
			}
			mygetrequest.open("POST", "/transaction/" + $val, true);
			mygetrequest.send(null);
		}		    

		 function updateAcctView($val){
			    var mygetrequest=new XMLHttpRequest();
			    mygetrequest.onreadystatechange=function(){
			     if (mygetrequest.readyState==4){
			      if (mygetrequest.status==200 || window.location.href.indexOf("http")==-1){
			       document.getElementById("account-view").innerHTML = mygetrequest.responseText;
			      }
			      else{
			       alert("An error has occured updating account-view" + mygetrequest.readyState + " " + mygetrequest.status);
			      }
			     }
			    }
			    mygetrequest.open("GET", "/dashboard/acctView/" + $val, true);
			    mygetrequest.send(null);
			}

			function toggleAcctAction($val) {
				if ($val == 'close')
					closeAcct();
				else
					openAcct();
			}

			function openAcct() {
				var mygetrequest=new XMLHttpRequest();
				mygetrequest.onreadystatechange=function() {
					if (mygetrequest.readyState==4){
						if (mygetrequest.status==200 || window.location.href.indexOf("http")==-1){
							document.getElementById("newAcct-view").innerHTML = mygetrequest.responseText;
						} else {
							alert("An error has occured making the request " + mygetrequest.readyState + " " + mygetrequest.status);
						}
					}
				}
				mygetrequest.open("GET", "/dashboard/open", true);
				mygetrequest.send(null);
			}

			function closeAcct() {
				var mygetrequest=new XMLHttpRequest();
				mygetrequest.onreadystatechange=function() {
					if (mygetrequest.readyState==4){
						if (mygetrequest.status==200 || window.location.href.indexOf("http")==-1){
							document.getElementById("newAcct-view").innerHTML = mygetrequest.responseText;
						} else {
							alert("An error has occured making the request " + mygetrequest.readyState + " " + mygetrequest.status);
						}
					}
				}
				mygetrequest.open("GET", "/dashboard/close", true);
				mygetrequest.send(null);
			}
      </script>
</body>
</html>