<%@page import="java.sql.ResultSet"%>
<%@page import="javazoom.upload.UploadFile"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@page import="javazoom.upload.UploadBean"%>
<%@ include file="../header.jsp"%>
<!-- Add faculty Related Files -->
  
  <%
 	String SrNo="",  Year="", Class="";
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
 					
 					Year=mrequest.getParameter("ntqualification");
 					Class=mrequest.getParameter("rClass");
 					Hashtable ht=mrequest.getFiles(); //Hashtable - collection of Key/Value Pair
 					if(ht!=null && ht.size()>0){
 						UploadFile uf=(UploadFile)ht.get("ntimage"); //Return Type ==> Object
 								if(uf!=null && uf.getFileName()!=null && !uf.getFileName().equals("")){
 									fileImgName=uf.getFileName();
 									//Upload / Save File to server
 									upBean.store(mrequest, "ntimage");
 								}
 					}
			db.executeSql("insert into Progression (Sr.No, Year, Students, File)  values (?,?,?,?)", SrNo, Year, Class, fileImgName); //This Line For Insert Record Into Database nonteachingfaculty table	
			successMsg=" Student Progression Added Successfully";
			}
  	
  		 		}

%>
  
  <!-- Academic calendar Add Form -->
  
  <div class="mt-2 mb-2  d-flex flex-row-reverse">
    <a class="btn btn-primary pr-5" href="/College_Managment_System/Admin/ProgressionList.jsp">Progression List</a>
</div>
	<div class="card mt-5 col-7 offset-2">
	<div class="card-header bg-info text-white">
	<h4 class="text-center">Add Student Progression Form</h4>
	</div>
	<div class="card-body">
	<!-- HTML FORM -->
	<form id="FormNT" action="" method="post" enctype="multipart/form-data">
	<div class="form-group">
	Progression Sr.No.
	<input name="ntid" class="form-control" autofocus value="<%=SrNo%>" placeholder="Enter Sr.No."/> <!-- Form Row -->
	</div>
	<div class="form-group">
	Progression Year
	<input name="ntqualification" class="form-control" value="<%=Year%>" placeholder="Enter Result Year"/> <!-- Form Row -->
	</div>
	<div class="form-group">
	No. Of Student
	<input name="rClass" class="form-control" value="<%=Class%>" placeholder="Enter Result Class"/> <!-- Form Row -->
	</div>
	<div class="form-group mb-3">
	  <label for="formFile" class="form-label">Progression File</label>
 	 <input name="ntimage" class="form-control" value="<%=fileImgName %>" type="file" id="formFile">
	</div>
		<div class="text-center d-grid gap-2">
		<input Type="submit" value="Add Progression" name="ntbtnadd" id="" class="btn btn-lg btn-primary"/>
</div>
</form>
</div>
</div>	
    <%@ include file="../footer.jsp"%>
 