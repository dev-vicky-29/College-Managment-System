<%@page import="java.sql.ResultSet"%>
<%@page import="javazoom.upload.UploadFile"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@page import="javazoom.upload.UploadBean"%>
<%@ include file="../header.jsp"%>
<!-- Add faculty Related Files -->
  
  <%
 	String sPRN="", sName="", sBatch="", sEmail="", sPhone="", sPass="";
 	String ntfImgName="";
			  
 	String path=request.getRealPath("/Photos/");
 	//
 	//
 	UploadBean upBean=new UploadBean();
 	upBean.setFolderstore(path); //Store Uploaded Files In This Folder.
 	
 		if(MultipartFormDataRequest.isMultipartFormData(request)){
 			MultipartFormDataRequest mrequest=new MultipartFormDataRequest(request);
 			//request (MP) ==> Wrapper ==> MultiFormDataRequest
 				//Add Button Operation
 				if(mrequest.getParameter("ntbtnadd")!=null){
 					sPRN=mrequest.getParameter("txtprn");
 					sName=mrequest.getParameter("txtname");
 					sBatch=mrequest.getParameter("txtbatch");
 					sEmail=mrequest.getParameter("txtmail");
 					sPhone=mrequest.getParameter("txtnumber");
 					sPass=mrequest.getParameter("txtpass");
 					Hashtable ht=mrequest.getFiles(); //Hashtable - collection of Key/Value Pair
 					if(ht!=null && ht.size()>0){
 						UploadFile uf=(UploadFile)ht.get("ntimage"); //Return Type ==> Object
 								if(uf!=null && uf.getFileName()!=null && !uf.getFileName().equals("")){
 									ntfImgName=uf.getFileName();
 									//Upload / Save File to server
 									upBean.store(mrequest, "ntimage");
 								}
 					}
 					db.executeSql("insert into studentlogin (PRN,  StudentName,Batch, EmailID, PhoneNumber, Password, Photo)  values (?,?,?,?,?,?,?)", sPRN, sName, sBatch, sEmail,sPhone, sPass, ntfImgName ); //This Line For Insert Record Into Database nonteachingfaculty table	
 					successMsg=sName+" Student Added Successfully";
			}
  	
  		 		}

%>
  
  <!-- Non-Teacher Faculties Add, Update, Find & Delete Form -->
  
  <div class="mt-2 mb-2  d-flex flex-row-reverse">
    <a class="btn btn-primary pr-5" href="/College_Managment_System/Admin/StudentList.jsp">Student List</a>
</div>
	<div class="card mt-5 col-7 offset-3">
	<div class="card-header bg-info text-white">
	<h4 class="text-center">Add Student</h4>
	</div>
	<div class="card-body">
	<!-- HTML FORM -->
	<form id="FormNT" action="" method="post" enctype="multipart/form-data">
	<div class="form-group">
	Student PRN
	<input name="txtprn" class="form-control" autofocus  placeholder="Enter Student PRN" required/> <!-- Form Row -->
	</div>
	<div class="form-group">
	Student Name
	<input name="txtname" class="form-control"  placeholder="Enter Student Name" required/> <!-- Form Row -->
	</div>
	<div class="form-group">
	Batch Year
	<input name="txtbatch" class="form-control"  placeholder="Enter Student Batch Year" required/> <!-- Form Row -->
	</div>
	<div class="form-group">
	Student Email
	<input name="txtmail" class="form-control"  placeholder="Enter Student Email ID" required/> <!-- Form Row -->
	</div>
	<div class="form-group">
	Student Phone Number
	<input name="txtnumber" class="form-control"  placeholder="Enter Student Number" required/> <!-- Form Row -->
	</div>
	<div class="form-group">
	Password
	<input name="txtpass" type="password" class="form-control"  placeholder="Enter Student Password" required/> <!-- Form Row -->
	</div>
	
	<div class="form-group mb-3">
	  <label for="formFile" class="form-label">Student Image</label>
 	 <input name="ntimage" class="form-control" value="<%=ntfImgName %>" type="file" id="formFile" required>
	</div>
		<div class="text-center d-grid gap-2">
		<input Type="submit" value="Add Student" name="ntbtnadd" id="" class="btn btn-lg btn-primary"/>
</div>
</form>
</div>
</div>	
    <%@ include file="../footer.jsp"%>
