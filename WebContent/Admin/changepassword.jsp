<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<!-- Admin1 Change Password Related Page -->
 
 <%
 if(request.getParameter("btnchange")!=null) {
	    String opass = request.getParameter("txtopass");
	    String npass = request.getParameter("txtnpass");
	    String cnpass = request.getParameter("txtcnpass");

	    //Check Old Password is Valid or Not
	    String user = (String) session.getAttribute("user");
	    String pass = (String) session.getAttribute("pass");

	    // Use PreparedStatement to prevent SQL injection
	    String sql = "SELECT * FROM adminlogin WHERE UserName=? AND UserPass=?";
	    db.cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/collegedb","root","VICK2909");
	    PreparedStatement pstmt = db.cn.prepareStatement(sql);
	    pstmt.setString(1, user);
	    pstmt.setString(2, pass);
	    ResultSet rs = pstmt.executeQuery();

	    if(!opass.equals(pass)) {
	        errorMsg = "Please Enter Valid Old Password";
	    } else {
	        // Use PreparedStatement to prevent SQL injection
	        String updateSql = "UPDATE adminlogin SET UserPass=? WHERE UserName=?";
	        PreparedStatement updateStmt = db.cn.prepareStatement(updateSql);
	        updateStmt.setString(1, npass);
	        updateStmt.setString(2, user);
	        updateStmt.executeUpdate();
	        successMsg = "Password Changed SuccessFully";
	        response.sendRedirect("/College_Managment_System/Admin/changepassword.jsp");
            return;
	    }
	}
 
 %> 
<!-- Admin Change Password Related Page-->
                    
<div class="container mt-2">

<form method="post" id="formapc">
<div class="row justify-content-center">
<div class="col-md-6 custom-border rounded">
<h2 class="text-center">Admin Change Password Form</h2> <hr/>
                    
<div class="form-group" style="font-weight: bold;">
Current Password
<input type="password" name="txtopass" id="txtopass" class="form-control" placeholder="Enter Your Old Password"/>
</div>
<br/>
<div class="form-group" style="font-weight: bold;">
New Password
<input type="password" name="txtnpass" id="txtnpass" class="form-control" placeholder="Enter New Password"/>
</div>
<br/>
<div class="form-group" style="font-weight: bold;">
Confirm New Password
<input type="password" name="txtcnpass" id="txtcnpass" class="form-control" placeholder="Re-Enter New Password"/>
</div>
<br/>
<div class="text-center d-grid gap-2">
<input type="submit" name="btnchange" value="Change Password" class="btn btn-lg btn-primary"/>
</div>
</div>
            </div>
                    </form>
                </div>
           

<!-- Include Bootstrap JS (optional) -->
<%@ include file="../footer.jsp"%>

<script>
$(function(){
	$("#formapc").validate({
		rules:{
			txtopass:{
				required:true
			},
			txtnpass:{
				required:true
			},
			txtcnpass:{
				required:true,
				equalTo:"#txtnpass"
			}
		},
		messages:{
			txtopass:{
				required:"Old Password is Required"
			},
			txtnpass:{
				required:"New Password is Required"
			},
			txtcnpass:{
				required:"Confirm New Password is Required",
				equalTo:"Password Is Mismatch"
			}
		}
	});
});
</script>