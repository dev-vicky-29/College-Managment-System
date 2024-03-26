<%@page import="java.sql.ResultSet"%>
<%@page import="javazoom.upload.UploadFile"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@page import="javazoom.upload.UploadBean"%>
<%@ include file="../header.jsp"%>
<!-- Add faculty Related Files -->
  
  <%
 	String SrNo="", Title="", Year="";
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
 					SrNo=mrequest.getParameter("ntid");
 					Title=mrequest.getParameter("ntname");
 					Year=mrequest.getParameter("ntqualification");
 					Hashtable ht=mrequest.getFiles(); //Hashtable - collection of Key/Value Pair
 					if(ht!=null && ht.size()>0){
 						UploadFile uf=(UploadFile)ht.get("ntimage"); //Return Type ==> Object
 								if(uf!=null && uf.getFileName()!=null && !uf.getFileName().equals("")){
 									fileImgName=uf.getFileName();
 									//Upload / Save File to server
 									upBean.store(mrequest, "ntimage");
 								}
 					}
			db.executeSql("insert into timetable (SrNo, Title, Year, File)  values (?,?,?,?)", SrNo, Title, Year, fileImgName); //This Line For Insert Record Into Database nonteachingfaculty table	
			successMsg=Year+" Time Table Added Successfully";
			}
  	
  		 		}

%>
  
  <!-- Academic calendar Add Form -->
  
  <div class="mt-2 mb-2  d-flex flex-row-reverse">
    <a class="btn btn-primary pr-5" href="/College_Managment_System/Admin/TimeTableList.jsp">Academic Calendar List</a>
</div>
	<div class="card mt-5 col-7 offset-2">
	<div class="card-header bg-info text-white">
	<h4 class="text-center">Add Departmental Time Table Form</h4>
	</div>
	<div class="card-body">
	<!-- HTML FORM -->
	<form id="FormNT" action="" method="post" enctype="multipart/form-data">
	<div class="form-group">
	Time Table Sr.No.
	<input name="ntid" class="form-control" autofocus value="<%=SrNo%>" placeholder="Enter Sr.No."/> <!-- Form Row -->
	</div>
	<div class="form-group">
	Time Table Title
	<input name="ntname" class="form-control" value="<%=Title%>" placeholder="Enter Time Table Title"/> <!-- Form Row -->
	</div>
	<div class="form-group">
	Time Table Year
	<input name="ntqualification" class="form-control" value="<%=Year%>" placeholder="Enter Time Table Year"/> <!-- Form Row -->
	</div>
	<div class="form-group mb-3">
	  <label for="formFile" class="form-label">Time Table File</label>
 	 <input name="ntimage" class="form-control" value="<%=fileImgName %>" type="file" id="formFile">
	</div>
		<div class="text-center d-grid gap-2">
		<input Type="submit" value="Add Time Table" name="ntbtnadd" id="" class="btn btn-lg btn-primary"/>
</div>
</form>
</div>
</div>	
    <%@ include file="../footer.jsp"%>
 