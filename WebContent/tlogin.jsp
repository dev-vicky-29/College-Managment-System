<%@page import="java.sql.ResultSet"%>
<%@ include file="header.jsp"%>
<%
if(request.getParameter("btnlogin")!=null) //Button Login Clicked
{
	String user=request.getParameter("teacheruser");
	String pass=request.getParameter("teacherpass");
	//Validate it againest admin login table 
	
	ResultSet rs=db.getRows("select * from adminlogin where UserName=? and UserPass=?", user, pass);
	if(rs.next()){ //True or False
	//Redirect to Admin Dashboard
	session.setAttribute("user", user);
	session.setAttribute("pass", pass);
	
	response.sendRedirect("Admin/admin.jsp");
	} else {
		session.setAttribute("user", null);
		errorMsg="Invalid Login";
	}
}
%>

<!-- Teacher Login Page Specific Contents -->

<div class="container">
<form method="post" id="form1" class="form custom-border mt-8 rounded">
<div class="col-5 offset-3"> <br>
<h1 class="text-center">Teacher Login Form</h1> <hr/>
<div class="form-group" style="font-weight: bold;">
Teacher UserName
<input type="text" name="teacheruser" id="teacheruser" class="form-control" placeholder="Enter ID or Email Address"/>
</div>
<br/>
<div class="form-group" style="font-weight: bold;">
Teacher Password
<input type="password" name="teacherpass" id="teacherpass" class="form-control" placeholder="Enter Password"/>
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
    <a href="tsignup.jsp" class="d-inline" style="font-weight: bold;">Sign Up</a>
</div>
</div>
</form>
</div>
<%@ include file="footer.jsp"%>
<%--
<script>
$(function(){
	$("#form1").validate({
		rules:{
			teacheruser:{
				required:true
			},
			teacherpass:{
				required:true
			}
		},
		messages:{
			teacheruser:{
				required:"UserName is Required"
			},
			teacherpass:{
				required:"Password is Required"
			}
		}
	});
});
</script>
 --%>