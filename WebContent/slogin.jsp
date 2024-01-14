<%@ include file="header.jsp"%>
<!-- Login Page Specific Contents -->
<div class="container">
<form class="form custom-border mt-8 rounded">
<div class="col-5 offset-3"> <br>
<h1 class="text-center">Student Login Form</h1> <hr/>
<div class="form-group" style="font-weight: bold;">
Student UserName
<input type="text" name="studentuser" id="studentuser" class="form-control" placeholder="Enter PRN or Email Address"/>
</div>
<br/>
<div class="form-group" style="font-weight: bold;">
Student Password
<input type="password" name="studentpass" id="studentpass" class="form-control" placeholder="Enter Password"/>
</div>
<br/>
<div class="text-center d-grid gap-2">
<input type="submit" name="btnlogin" value="Login" class="btn btn-lg btn-primary"/>
</div> <hr>
<div class="text-center mt-3">
<a class="text-center text-decoration-none" style="color: black;" href="#">Forgot Password?</a>
</div> <hr/>
<div class="text-center border p-3 hover-effect mt-3">
    <h6 class="d-inline color-black" style="color: black;">Don't have an account? </h6>
    <a href="ssignup.jsp" class="d-inline" style="font-weight: bold;">Sign Up</a>
</div>
</div>
</form>
</div>
<%@ include file="footer.jsp"%>