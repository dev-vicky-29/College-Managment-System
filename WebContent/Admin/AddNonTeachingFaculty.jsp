<%@page import="java.sql.ResultSet"%>
<%@page import="javazoom.upload.UploadFile"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@page import="javazoom.upload.UploadBean"%>
<%@ include file="../header.jsp"%>
<!-- Add faculty Related Files -->
  
  <%
 	String ntID="", ntName="", ntQualification="";
 	String ntfImgName="";
			  
 	String path=request.getRealPath("/NonTeachingFacultyFiles/");
 	//
 	//
 	UploadBean upBean=new UploadBean();
 	upBean.setFolderstore(path); //Store Uploaded Files In This Folder.
 	
 		if(MultipartFormDataRequest.isMultipartFormData(request)){
 			MultipartFormDataRequest mrequest=new MultipartFormDataRequest(request);
 			//request (MP) ==> Wrapper ==> MultiFormDataRequest
 				//Add Button Operation
 				if(mrequest.getParameter("ntbtnadd")!=null){
 					ntID=mrequest.getParameter("ntid");
 					ntName=mrequest.getParameter("ntname");
 					ntQualification=mrequest.getParameter("ntqualification");
 					Hashtable ht=mrequest.getFiles(); //Hashtable - collection of Key/Value Pair
 					if(ht!=null && ht.size()>0){
 						UploadFile uf=(UploadFile)ht.get("ntimage"); //Return Type ==> Object
 								if(uf!=null && uf.getFileName()!=null && !uf.getFileName().equals("")){
 									ntfImgName=uf.getFileName();
 									//Upload / Save File to server
 									upBean.store(mrequest, "ntimage");
 								}
 					}
			db.executeSql("insert into nonteachingfaculty (SupportStaffID,SupportStaffName,SupportStaffQualification,SupportStaffProfilePhoto)  values (?,?,?,?)", ntID, ntName, ntQualification, ntfImgName); //This Line For Insert Record Into Database nonteachingfaculty table	
			successMsg="Non-Teaching Faculty Added Successfully";
			}
  	
  		//Find Button Operation
  		
  		if (mrequest.getParameter("ntbtnfind") != null) {
  	        ntID = mrequest.getParameter("ntid");
  	        // Use PreparedStatement to avoid SQL injection
  	       ResultSet rs= db.getRows("SELECT * FROM nonteachingfaculty  WHERE SupportStaffID=?", ntID);
  	        

  	        if (rs.next()) {
  	            ntName = rs.getString("SupportStaffName");
  	            ntQualification = rs.getString("SupportStaffQualification");
  	          ntfImgName = rs.getString("SupportStaffProfilePhoto");
  	         } else {
  	            // Handle the case when no record is found
  	            errorMsg = "No record found for Support Staff ID: " + ntID;
  	        }
  		}
  	        
  		//Update Record Operation
  		
  		if(mrequest.getParameter("ntbtnupdate")!=null){ //Update Button Clicked
  				ntID=mrequest.getParameter("ntid");
				ntName=mrequest.getParameter("ntname");
				ntQualification=mrequest.getParameter("ntqualification");
	
	db.executeSql("update nonteachingfaculty  set SupportStaffName=?,SupportStaffQualification=? where SupportStaffID=?" ,ntName,ntQualification,ntID); //This Line For Update Record Into Database nonteachingfaculty table	
	successMsg="Non-Teaching Faculty Record Is Updated Successfully!";
  		}
	
  			//Delete Record Operation
  			  	if(mrequest.getParameter("ntbtndelete")!=null){ //Delete Button Clicked
  			  	ntID=mrequest.getParameter("ntid");
  			  		db.executeSql("Delete From nonteachingfaculty where SupportStaffID=?", ntID); //This Line For Delete Record From Database nonteachingfaculty table	
  			  	successMsg="Non-Teaching Faculty Record Is Deleted Successfully!";
  			  	}
	
 		}

%>
  
  <!-- Non-Teacher Faculties Add, Update, Find & Delete Form -->
  
  
	<div class="card mt-5 col-7 offset-2">
	<div class="card-header bg-info text-white">
	<h4 class="text-center">Non-Teaching Faculties Form</h4>
	</div>
	<div class="card-body">
	<!-- HTML FORM -->
	<form action="" method="post" enctype="multipart/form-data">
	<div class="form-group">
	Support Staff ID
	<input name="ntid" class="form-control" autofocus value="<%=ntID%>" placeholder="Enter Support Staff ID"/> <!-- Form Row -->
	</div>
	<div class="form-group">
	Support Staff Name
	<input name="ntname" class="form-control" value="<%=ntName%>" placeholder="Enter Support Staff Name"/> <!-- Form Row -->
	</div>
	<div class="form-group">
	Support Staff Qualification
	<input name="ntqualification" class="form-control" value="<%=ntQualification%>" placeholder="Enter Support Staff Education"/> <!-- Form Row -->
	</div>
	<div class="form-group mb-3">
	  <label for="formFile" class="form-label">Teacher Image</label>
 	 <input name="ntimage" class="form-control" value="<%=ntfImgName %>" type="file" id="formFile">
	</div>
<div class="mt-2 mb-5 d-flex justify-content-between">
		<input Type="submit" value="Add Faculty" name="ntbtnadd" class="btn btn-primary"/>
		<input Type="submit" value="Find Faculty" name="ntbtnfind" class="btn btn-info"/>
		<input Type="submit" value="Update Faculty" name="ntbtnupdate" class="btn btn-secondary"/>
		<input Type="submit" value="Delete Faculty" name="ntbtndelete" class="btn btn-danger"/>	
</div>
</form>
</div>
</div>	
  




<%@ include file="../footer.jsp"%>