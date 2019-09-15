<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html lang="en">
   <head>
      <link rel="stylesheet" type="text/css" href="dashStyle.css">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>User Dashboard</title>
      <script src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
      <script type="text/javascript">
      </script>
   </head>
   <body>
      <img src="MeritBankLogo.gif" alt="MeritBankOfAmericaLogo" width="600"/>
      <div id="top_links">
         <div id="header">
            <h2>Your Number One Bank</h2>
         </div>
         <div id="navigation">
               <ul>
                  <li><a href="index.jsp">HOME</a></li>
                  <li><a href="locations.jsp">LOCATIONS</a></li>
                  <li><a href="about.jsp">ABOUT US</a></li>
                  <li><a href="contact.jsp">CONTACT US </a></li>
               </ul>
               <div id="formcontainer">
                  <form class="navbar-form navbar-right">
                     <input class="form-control col-lg-8" type="text" placeholder="  Search" aria-label="Search">
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
               <a href="index.jsp" class="w3-bar-item w3-button">HOME</a>
               <a href="locations.jsp" class="w3-bar-item w3-button">LOCATIONS</a>
               <a href="about.jsp" class="w3-bar-item w3-button">ABOUT US</a>
               <a href="contact.jsp" class="w3-bar-item w3-button">CONTACT US</a>
               </div>
            </div>
         </div>
         <div id="wrapper">
		    <h1 class="content_header">Welcome, ${dm.user.getFirstName()}</h1>
            <div id="main_content">
               <div class="row1">
			   <!-- Top Left BOX-->
                  <div class="dsubcontents dlg md sm">
					  <div class = "w3-respnsive">
						  <table class="w3-table-all w3-hoverable">
							<thead>
							  <tr class="w3-light-grey">
								<th>First</th> 
								<th>Last</th>
								<th>Email</th>
								<th>Address</th>
							  </tr>
							</thead>
							<tr>
							  <td>${dm.user.getFirstName()}</td>  <!-- User First Name -->
							  <td>${dm.user.getLastName()}</td>  <!-- User Last Name -->
							  <td>${dm.user.getEmail()}</td>  <!-- User Email -->
							  <td>${dm.user.getAddress().getCity()}, ${dm.user.getAddress().getState()} </td>  <!-- User Email -->
							</tr>
						  </table>
						
					  </div>
					  <div class = "w3-respnsive">			
						<form:form id='newacct' method='post' modelAttribute="dm.nafo">
							<fieldset class='fieldset-auto-width'>
								<legend>New Account</legend>
								<table class= "w3-table-all w3-hoverable"><tbody>
									<tr class= "w3-light-grey">
										<td>Account Type:</td>
										<td>
											<form:select  path="acctType" required="true">
												<option value="">Account Type</option>
												<form:options />
											</form:select>									
										</td>
									</tr>
									<tr>
										<td>Deposit Amount:</td>
										<td>									
											<span class="dollar-sign">$</span><form:input id="amount-input" type="number" step="0.01" path="amount"></form:input>						
										</td>
									</tr>							
									<tr>
										<td><form:input type="hidden" path="user_id" value="${dm.user.getId()}"></form:input></td>
										<td><input formaction='/createAccount' type='submit' value='Open Account'/></td>
									</tr>
								</tbody></table>						
							</fieldset>	
						</form:form>			
					</div>
                  </div>
				  <!-- Top right box-->
                <div class="dsubcontents dlg md sm">
					<div class = "w3-respnsive">
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
							  <td>${dm.account.getAccountType().getTypeName()}</td>  
							  <th>${dm.account.getBalance()}</</th>     
							  <th>${dm.account.getRate()}</th>       
							</tr>
						</table>
						</div>
					<div class = "w3-respnsive">
						<form:form id='transaction' method='post' modelAttribute="dm.tfo">
							<form:input type="hidden" path="tAcct"
							value="${dm.account.getAccountNumber()}"></form:input>
							<fieldset class='fieldset-auto-width'>
								<legend>Transaction</legend>
								<table class="w3-table-all w3-hoverable">
									<thead>
										<tr class="w3-light-grey">
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
								<tr onclick="updateAcctView(${acct.getId()});">
									<td>${acct.getAccountNumber()}</td>
									<td>${acct.getAccountType().getTypeName()}</td>
									<th>${acct.getBalance()}</th>
									<th>${acct.getRate()}</th>
								</tr>
							</c:forEach>
					  </table>
				</div>
					<!--Bottom right -->
                  <div class="dsubcontents dlg md sm">
                      <h1 class="content_header">Log Box</h1>
                  </div>
               </div>
               <div id="advertisement">
                  <h1 class="copyright">Copyright&#169; Team Sparks </h1>
               </div>
            </div>
         </div>
   <!--end of footer-->
   <!-- Bootstrap core JavaScript
           ================================================== -->
           <!-- Placed at the end of the document so the pages load faster -->
           <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
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
		 
		 function updateAcctView($val) {
		        $.ajax({
		            type: "GET",  
		            url: "/acctView/" + $val,
		            success: function(response) {
		                $("#account-view").html( response );
		            }
		        });
		    }  
      </script>
   </body>
</html>
