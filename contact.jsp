<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
}

* {
  box-sizing: border-box;
}

/* Style inputs */

input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  margin-top: 5px;
  margin-bottom: 5px;
  margin: 0 auto;

  
}

input[type=submit] {
  background-color: #71CDE0;
  color: white;
  padding: 12px 20px;
  border: none;
  cursor: pointer;
  
}

input[type=submit]:hover {
  background-color: #71CDE0;
}

/* Style the container/contact section */
.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 10px;
}

/* Create two columns that float next to eachother */
.column {
  float: left;
  width: 30%;
  margin-top: 6px;
  padding: 10px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 400px) {
  .column, input[type=submit] {
    width: 100%;
    margin-top: 5px;
  }
}

.header {
  padding: 20px;
  text-align: center;
  background: #71CDE0;
  color: white;
  font-size: 20px;
}
</style>
</head>
<body>

<div class="container"> 
  <div style="text-align:center">
    <div class="header">
        <h1>Contact Us</h1>
      </div>
  </div>
  <div class="row">
    <div class="column">
      <form action="/action_page.php">
        <label for="name">Name</label>
        <input type="text" id="name" name="name" placeholder="Your first and last name..">
        <label for="email">Email</label>
        <input type="text" id="email" email="email" placeholder="Your email address..">
        <label for="subject">Subject</label>
        <textarea id="subject" name="subject" placeholder="Write something.." style="height:120px"></textarea>
        <input type="submit" value="Submit">
      </form>
      <br></br>
      <br></br>
      <br></br>
    </div>
  </div>
</div>
    <td><div align="center"> Phone:<a href="tel:#">+1 000 000 0000</a></span></div>

</body>
</html>
          <td><div align="center"><span class="bottombar"><strong>&copy; Merit Bank of America, All Rights Reserved. </strong></span></div></td>     
</table>
</body>
</html>