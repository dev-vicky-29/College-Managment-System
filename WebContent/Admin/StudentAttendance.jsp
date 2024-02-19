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
	    }
	}




if(request.getParameter("btnchange")!=null)
	{
		String opass=request.getParameter("txtopass");
		String npass=request.getParameter("txtnpass");
		String cnpass=request.getParameter("txtcnpass");
		
		//Check Old Password is Valid or Not
		String user=session.getAttribute("user")+" "; //Convert Object to String
		String pass=session.getAttribute("pass")+" ";
		
		if(!opass.equals(pass)){	//if not matching db password
			errorMsg="Please Enter Valid Old Password";
		} else {
			db.executeSql("Update adminlogin set UserPass=? where UserName=?",npass,user);
			successMsg="Password Changed SuccessFully";
		}
	}
 %>