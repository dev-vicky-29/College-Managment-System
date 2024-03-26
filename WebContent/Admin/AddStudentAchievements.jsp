<%@page import="java.sql.ResultSet"%>
<%@page import="javazoom.upload.UploadFile"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@page import="javazoom.upload.UploadBean"%>
<%@ include file="../header.jsp"%>
<!-- Add faculty Related Files -->
  
  <%
  //Sr.No	Name	Date	Type	Title	Description	Report
 	String SrNo="", Name="", Date="", Type="", Title="", Description="";
 	String fileImgName="";
			  
 	String path=request.getRealPath("/PDFFILES/");
 	//
 	//
 	UploadBean upBean=new UploadBean();
 	upBean.setFolderstore(path); //Store Uploaded Files In This Folder.
 	
 		if(MultipartFormDataRequest.isMultipartFormData(request)){
 			MultipartFormDataRequest mrequest=new MultipartFormDataRequest(request);
 			//request (MP) ==> Wrapper ==> MultiFormDataRequest
 				//Add Button Operation
 				if(mrequest.getParameter("ntbtnadd")!=null){
 					SrNo=mrequest.getParameter("srno");
 					Name=mrequest.getParameter("sName");
 					Date=mrequest.getParameter("aDate");
 					Type=mrequest.getParameter("aType");
 					Title=mrequest.getParameter("aTitle");
 					Description=mrequest.getParameter("adesc");
 					Hashtable ht=mrequest.getFiles(); //Hashtable - collection of Key/Value Pair
 					if(ht!=null && ht.size()>0){
 						UploadFile uf=(UploadFile)ht.get("ntimage"); //Return Type ==> Object
 								if(uf!=null && uf.getFileName()!=null && !uf.getFileName().equals("")){
 									fileImgName=uf.getFileName();
 									//Upload / Save File to server
 									upBean.store(mrequest, "ntimage");
 								}
 					}
			db.executeSql("insert into studentsachievements (SrNo, Name, Date, Type, Title, Description, Report)  values (?,?,?,?,?,?,?)", SrNo, Name,Date, Type, Title, Description, fileImgName); //This Line For Insert Record Into Database nonteachingfaculty table	
			successMsg=Name+" Achievement Added Successfully";
			}
  	
  		 		}

%>
  
  <!-- Add Students Achievements Reports -->
  
  <div class="mt-2 mb-2  d-flex flex-row-reverse">
    <a class="btn btn-primary pr-5" href="/College_Managment_System/Admin/StudentAchievementsList.jsp">Students Achievements List</a>
</div>
	<div class="card mt-5 col-7 offset-2">
	<div class="card-header bg-info text-white">
	<h4 class="text-center">Add Students Achievements Reports</h4>
	</div>
	<div class="card-body">
	<!-- HTML FORM -->
	<form id="FormNT" action="" method="post" enctype="multipart/form-data">
	<div class="form-group">
	 Sr.No.
	<input name="srno" class="form-control" autofocus  placeholder="Enter Sr.No." required/> <!-- Form Row -->
	</div>
	<div class="form-group">
	 Student Name
	<input name="sName" class="form-control"   placeholder="Enter Student Name" required/> <!-- Form Row -->
	</div>
	<div class="form-group">
	Achievement Date
	<input name="aDate" class="form-control" type="Date" placeholder="Enter Achievement Date" required/> <!-- Form Row -->
	</div>
	<div class="form-group">
	 Achievement Type
	<input name="aType" class="form-control"   placeholder="Enter Achievement Type" required/> <!-- Form Row -->
	</div>
	<div class="form-group">
	Achievement Title
	<input name="aTitle" class="form-control"  placeholder="Enter Achievement Title" required/> <!-- Form Row -->
	</div>
	<div class="form-group">
	Achievement Description
	<input name="adesc" class="form-control"  placeholder="Enter Achievement Description" required/> <!-- Form Row -->
	</div>
	<div class="form-group mb-3">
	  <label for="formFile" class="form-label">Achievement File</label>
 	 <input name="ntimage" class="form-control" value="<%=fileImgName %>" type="file" id="formFile">
	</div>
		<div class="text-center d-grid gap-2">
		<input Type="submit" value="Add Achievement" name="ntbtnadd" id="" class="btn btn-lg btn-primary"/>
</div>
</form>
</div>
</div>	
    <%@ include file="../footer.jsp"%>
 