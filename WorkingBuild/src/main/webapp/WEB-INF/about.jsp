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
	
	<div id="wrapper">
         	<div id="msgs">
         		<c:if test="${msg != null}">
         			<p>${msg}</p>
         		</c:if>
         	</div>
            <div id="main_content">
               <div class="row1">
                  <div class="subcontents lg md sm">
                     <h1 class="content_header">Sparks</h1>
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
                     <h1 class="content_header">Joseph</h1>
                     <p> "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.</p>
                  </div>
               </div>
               <div class="row3">
                  <div class="subcontents lg md sm">
                     <h1 class="content_header">Joe</h1>
                     <p>"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.</p>
                  </div>
                  <div class="image">
                     <div class="opacity">
                        <img class="contentImage" src="img/people.jpg" alt="PeopleWalking" width="600"/>
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
                     <h1 class="content_header">Liz</h1>
                     <p> "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.</p>
                  </div>
               </div>
               <div class="row3">
                  <div class="subcontents lg md sm">
                     <h1 class="content_header">Zhenli</h1>
                     <p>"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.</p>
                  </div>
                  <div class="image">
                     <div class="opacity">
                        <img class="contentImage" src="img/people.jpg" alt="PeopleWalking" width="600"/>
                     </div>
                  </div>
               </div>
         <div id="footer">
               <h1 class="copyright">Copyright&#169; Team Sparks </h1>
           </div>
           <script type="text/javascript" src="JavaScript.js"></script>
</body>
<!-- end -->
</html>