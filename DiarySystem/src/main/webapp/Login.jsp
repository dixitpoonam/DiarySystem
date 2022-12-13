<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Seven Day Diary System.</title>
<link rel="stylesheet" href="style2.css" type="text/css" charset="utf-8" />
	
</head>
<body>

<form action="action_page.php" method="post">
  <div class="imgcontainer">
    <!-- <img src="img_avatar2.png" alt="Avatar" class="avatar"> -->
     <img src="images/TW-MobilestyEyeLogo1_thumb1.jpg" align="left">
    <img src="images/Transworld.gif" >
      <p>We care about your Vehicles</p>
          </div>
          <div id="nav">
            <ul>
              <li><a href="index.html">MAIN PAGE</a></li>
              <li><a href="http://www.myfleetview.com">TRACKING</a></li>
              <li><a href="http://www.mobile-eye.in/contact.html">CONTACT US</a></li>
            </ul>
            <div class="clear"> </div>
          </div>
          <div id="gbox">
            <div id="gbox-top"> </div>
            <div id="gbox-bg">
              <div id="gbox-grd">
                <h2 align="center">WELCOME TO OUR DIARY MAINTENANCE SYSTEM</h2>
                
  </div>

  <div class="container">
    <label for="uname"><b>Username</b></label>
    <input type="text" placeholder="Enter Username" name="uname" required>
<br>
    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="psw" required>
    <br>

    <button type="submit">Login</button>
    <label>
      <input type="checkbox" checked="checked" name="remember"> Remember me
    </label>
  </div>

  <div class="container" style="background-color:#f1f1f1">
    <button type="button" class="cancelbtn"komal>Cancel</button>
    <span class="psw">Forgot <a href="#">password?</a></span>
  </div>
</form>
</body>
</html>