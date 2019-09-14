<!DOCTYPE html>
<html lang="en">
   <head>
      <link rel="stylesheet" type="text/css" href="style.css">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>User Dashboard</title>
      <link href="style.css" rel="stylesheet" type="text/css">
      <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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
		    <h1 class="content_header">Welcome, ${user.getFirstName()}</h1>
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
							  <td>Cristo</td>  <!-- ${user.getFirstName()} -->
							  <td>Sparks</td>  <!-- ${user.getLastName()} -->
							  <td>Crisparks@hotmai.com</td>  <!-- ${dm.user.getEmail()} -->
							  <td>656 Florborn Road 75061 Dallas, Texas </td>  <!-- ${dm.user.getAddress().getCity()}, ${dm.user.getAddress().getState()} -->
							</tr>
						  </table>
					  </div>
					  Open Account Placeholder
					  <!--
					  <div id="open-acct-view">			
						<form:form id='newacct' method='post' modelAttribute="dm.nafo">
							<fieldset class='fieldset-auto-width'>
								<legend>New Account</legend>
								<table><tbody>
									<tr>
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
					-->
                  </div>
				  <!-- Top right box-->
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
							<tr>
							  <td>6565114225</td> <!-- ${dm.acct.user.getAccounts()} -->
							  <td>Checking</td>   <!-- ${dm.acct.getAccountType().getTypeName()}  -->
							  <th>50,000</th>     <!-- ${dm.acct.getBalance()} -->
							  <th>2.6%</th>       <!-- ${dm.acct.getRate()} -->
							</tr>
						</table>
					<h1 class="content_header">Transaction Placeholder</h1>
				  <!--
                     <form:form id='transaction' method='post' modelAttribute="tfo">
						<fieldset class='fieldset-auto-width'>
						<legend>Transaction</legend>
							<table class="w3-table-all w3-hoverable">
								<tbody>
									<c:if test="${failed==true}">
										<tr><td>${error}</td></tr>
									</c:if>
									<tr>
										<td>${account}</td>
										<td>									
											<form:select  path="target" required="true">
												<form:option value="">Select Target</form:option>
												<c:forEach items="${accounts}" var="a">
													<form:option value="${a.getId()}">${a.toString()}</form:option>
												</c:forEach>
											</form:select>								
										</td>
										<td>
											<span class="dollar-sign">$</span>
											<form:input id="amount-input" type="number" step="0.01" path="amount">
											</form:input>
										</td>	
									</tr>
									<tr>
										<td colspan="2"><input formaction='/createAccount' type='submit' value='Open Account'/></td>
									</tr>
								</tbody>
							</table>						
						</fieldset>	
					</form:form>
					-->
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
						
						<!-- 
							<c:forEach items="${dm.user.getAccounts()}" var="acct">

							<tr onclick="updateAcctView(${acct.getId()});">

								<td>${acct.getAccountNumber()}</td>

								<td>${acct.getAccountType().getTypeName()}</td>

								<th>${acct.getBalance()}</th>

								<th>${acct.getRate()}</th>

							</tr>

							</c:forEach>
						-->
						<tr>
						  <td>6565114225</td> <!-- ${acct.user.getAccounts()} -->
						  <td>Checking</td>   <!-- ${acct.getAccountType().getTypeName()}  -->
						  <th>50,000</th>     <!-- ${acct.getBalance()} -->
						  <th>2.6%</th>       <!-- ${acct.getRate()} -->
						</tr>
						<tr>
						  <td>Eve</td>
						  <td>Jackson</td>
						  <td>94</td>
						  <th>Points</th>
						</tr>
						<tr>
						  <td>Adam</td>
						  <td>Johnson</td>
						  <td>67</td>
						  <th>Points</th>
						</tr>
						<tr>
						  <td>Adam</td>
						  <td>Johnson</td>
						  <td>67</td>
						  <th>Points</th>
						</tr>
					  </table>
				</div>
					<!--Bottom right -->
                  <div class="dsubcontents dlg md sm">
					 <table class="w3-table-all w3-hoverable">
						<thead>
						  <tr class="w3-light-grey">
							<th>Account</th>
							<th>Transfer Amount</th>
							<th>Account</th>
							<th>Date</th>
						  </tr>
						</thead>
						<tr>
						  <td>666516</td>
						  <th>$35,000</th>
						  <td>752036</td>
						  <td>10/01/2019</td>
						</tr>
					  </table>
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
		 
		 //Needed code?
		 /*function updateAcctView($val) {
		        $.ajax({
		            type: "GET",  
		            url: "/acctView/" + $val,
		            success: function(response) {
		                $("#account-view").html( response );
		            }
		        });
		    } */ 
      </script>
   </body>
</html>
