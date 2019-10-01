<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
   <head>
      <link rel="stylesheet" type="text/css" href="css/style.css">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Merit Banking</title>
      <link href="css/bank.css" rel="stylesheet" type="text/css">
      <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
   </head>
   <body>
      <img src="img/MeritBankLogo.gif" alt="MeritBankOfAmericaLogo" width="600"/>
      <c:if test="${logout == true}">
      	<p class="alert">You have been successfully logged out!</p>
      </c:if>
      <div id="top_links">
         <div id="header">
            <h2>Your Number One Bank</h2>
         </div>
         <div id="navigation">
               <div class="container">
                  <button id="login-button">log in</button>
	                   <div id="login-container" class="hidden-login">
	                  	<form:form action="/signin" method="post" modelAttribute="lfo">
	                        <c:if test="${lfo.isFailed() == true}">
	                           <p class='alert'>Invalid credentials!</p>
	                        </c:if>
	                        <form:input type="text" placeholder="Username" path="email" required="required"></form:input>
	                        <form:input type="password" placeholder="Password" path="password" required="required"></form:input>
	                        <input type="submit" value="Sign In"/>
	                     </form:form>
	                     <form><button formaction="/signup" formmethod="post">Sign Up</button></form>
	                  </div>                    
               </div>
               <div>
               <ul id="navList">
                  <li id="locations"><a href="/locations">LOCATIONS</a></li>
                  <li id="about"><a href="/about">ABOUT US</a></li>
                  <li id="contact"><a href="/contact">CONTACT US</a></li>
               </ul>
               </div>
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
               <a href="/" class="w3-bar-item w3-button">HOME</a>
               <a href="/locations" class="w3-bar-item w3-button">LOCATIONS</a>
               <a href="/about" class="w3-bar-item w3-button">ABOUT US</a>
               <a href="/contact" class="w3-bar-item w3-button">CONTACT US</a>
               </div>
            </div>
         </div>
         
         <div id="wrapper">
         	<div id="msgs">
         		<c:if test="${msg != null}">
         			<p>${msg}</p>
         		</c:if>
         	</div>
            <div id="main_content">
               <div class="row1">
                  <div class="subcontents lg md sm">
                     <h1 class="content_header">Welcome</h1>
                     <p>"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.</p>
                  </div>
                  <div class="image">
                     <div class="opacity">
                        <img class="contentImage" src="img/guyinsuit.jpg" alt="GuyInSuit" width="600"/>
                     </div>
                  </div>
               </div>
               <div class="row2">
                  <div class="image">
                     <div class="opacity">
                        <img class="contentImage" src="img/newspaper.jpg" alt="Newspaper" width="600"/>
                     </div>
                  </div>
                  <div class="subcontents lg md sm">
                     <h1 class="content_header">Mission Statement</h1>
                     <p> "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.</p>
                  </div>
               </div>
               <div class="row3">
                  <div class="subcontents lg md sm">
                     <h1 class="content_header">What to add here?</h1>
                     <p>"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.</p>
                  </div>
                  <div class="image">
                     <div class="opacity">
                        <img class="contentImage" src="img/people.jpg" alt="PeopleWalking" width="600"/>
                     </div>
                  </div>
               </div>
            </div>
            <div id="footer">
               <h1 class="copyright">Copyright&#169; Team Sparks </h1>
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
      <script type="text/javascript" src="JavaScript.js"></script>
      <script>

    	$('#login-button').click(function() {
    		$('#login-container').toggleClass('hidden-login show-login');
    	});
    	
      </script>
   </body>
</html>