<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
   <head>
      <link rel="stylesheet" type="text/css" href="style.css">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Merit Banking</title>
      <link href="style.css" rel="stylesheet" type="text/css">
      <link href="css/bank.css" rel="stylesheet" type="text/css">
      <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
      <!-- <script type="text/javascript" src="JavaScript.js"></script> -->
      <script></script>
   </head>
   <body>
      <img src="MeritBankLogo.gif" alt="MeritBankOfAmericaLogo" width="600"/>
      <div id="top_links">
         <div id="header">
            <h2>Your Number One Bank</h2>
         </div>
         <div id="navigation">
               <div class="container">
                  <button id="login-button">log in</button>
                  <div class="login-container">
                        <c:if test="${lfo.isFailed()} == true">
                           <tr><td class='alert'>Invalid credentials!</td></tr>
                        </c:if>
                        <input type="text" placeholder="Username" required>
                        <input type="password" placeholder="Password" required>
                        <input type="submit" value="SUBMIT" />
                        <a href="register.jsp">REGISTER NOW</a>
                     </form>
                  </div>
                  </div>
               <ul>
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
               <a href="login.jsp" class="w3-bar-item w3-button">LOGIN</a>
               <a href="locations.jsp" class="w3-bar-item w3-button">LOCATIONS</a>
               <a href="about.jsp" class="w3-bar-item w3-button">ABOUT US</a>
               <a href="contact.jsp" class="w3-bar-item w3-button">CONTACT US</a>
               </div>
            </div>
         </div>
         
         <div id="wrapper">
            <div id="main_content">
               <div class="row1">
                  <div class="subcontents lg md sm">
                     <h1 class="content_header">Welcome</h1>
                     <p>"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.</p>
                  </div>
                  <div class="image">
                     <div class="opacity">
                        <img class="contentImage" src="guyinsuit.jpg" alt="GuyInSuit" width="600"/>
                     </div>
                  </div>
               </div>
               <div class="row2">
                  <div class="image">
                     <div class="opacity">
                        <img class="contentImage" src="newspaper.jpg" alt="Newspaper" width="600"/>
                     </div>
                  </div>
                  <div class="subcontents lg md sm">
                     <h1 class="content_header">Mission</span>Statement</h1>
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
                        <img class="contentImage" src="people.jpg" alt="PeopleWalking" width="600"/>
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
           <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
           <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
           <script src="../../assets/js/vendor/popper.min.js"></script>
           <script src="../../dist/js/bootstrap.min.js"></script>
      </div>
      <script type="text/javascript" src="JavaScript.js"></script>
      <script>
         // When the user scrolls the page, execute myFunction 
         // window.onscroll = function() {myFunction()};

         // // Get the navbar
         // var navbar = document.getElementById("navigation");

         // // Get the offset position of the navbar
         // var sticky = navbar.offsetTop;

         // // Add the sticky class to the navbar when you reach its scroll position. Remove "sticky" when you leave the scroll position
         // function myFunction() {
         // if (window.pageYOffset >= sticky) {
         //    navbar.classList.add("sticky")
         // } else {
         //    navbar.classList.remove("sticky");
         // }
         // }
         // $('#login-button').click(function() {
         // $('.login-form').toggleClass('open');
         // })


      </script>
   </body>
</html>