<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javazoom.upload.UploadFile"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@page import="javazoom.upload.UploadBean"%>
<%@ include file="../header.jsp"%>
<!-- Edit Syllabus Page Related Files -->

 <%
	String sSrNo="", sSTitle="", sSClass="";
	String fSFileName="";
	
  		String path=request.getRealPath("/SyllabusFiles/");
	//College Managment System/WebContent/images/FacultyFiles
	//E:\Eclipse\College Managment System\WebContent\images\FacultyFiles
	UploadBean upBean=new UploadBean();
	upBean.setFolderstore(path); //Store Uploaded Files In This Directory/Folder

  	
  
  	
  	if(MultipartFormDataRequest.isMultipartFormData(request)){
  		MultipartFormDataRequest mrequest=new MultipartFormDataRequest(request);
  		//request (MP) ==> Wrapper ===>  MultipartFormDataRequest
  				//Add Button Operation
  				if(mrequest.getParameter("sbtnadd")!=null){
  					sSrNo=mrequest.getParameter("essrno");
  					sSTitle=mrequest.getParameter("esst");
  					sSClass=mrequest.getParameter("essc");
  				Hashtable ht=mrequest.getFiles();//HashTable - Collection of Key/Value pair
  				if(ht!=null && ht.size()>0){
  					UploadFile uf=(UploadFile)ht.get("essf");//Return Type ===> Object
  							if(uf!=null && uf.getFileName()!=null && !uf.getFileName().equals("")){
  								fSFileName=uf.getFileName();
  								//Upload / Save File To Server
  								upBean.store(mrequest, "essf");
  							}
  				}
			db.executeSql("insert into syllabus (srno,Title,Class,PDF)  values (?,?,?,?)", sSrNo, sSTitle, sSClass, fSFileName); //This Line For Insert Record Into Database Syllabus table	
			successMsg=sSClass + " Class Syllabus Added Successfully";
			}

  		//Find Button Operation
  		
  		if (mrequest.getParameter("sbtnfind") != null) {
  			 sSClass =  mrequest.getParameter("essc");
  	        // Use PreparedStatement to avoid SQL injection
  	     ResultSet rs= db.getRows("SELECT * FROM syllabus WHERE Class=?", sSClass);

  	        if (rs.next()) {
  	        	sSrNo = rs.getString("srno");
  	        	sSTitle = rs.getString("Title");
  	        	sSClass = rs.getString("Class");
  	         } else {
  	            // Handle the case when no record is found
  	            errorMsg = "No Syllabus found for Class: " + sSClass;
  	        }
  		}
  

  	        
  		//Update Record Operation
  		
  		if(mrequest.getParameter("sbtnupdate")!=null){ //Update Button Clicked
  			sSrNo=mrequest.getParameter("essrno");
  			sSTitle=mrequest.getParameter("esst");
  			sSClass=mrequest.getParameter("essc");
	db.executeSql("update syllabus set srno=?,Title=? where Class=?" ,sSrNo,sSTitle,sSClass); //This Line For Update Record Into Database Syllabus table	
	successMsg=sSClass+ " Class Syllabus Is Updated";
  		}
	
  			//Delete Record Operation
  			  	if(mrequest.getParameter("sbtndelete")!=null){ //Delete Button Clicked
  			  		sSrNo=mrequest.getParameter("essrno");
  			  		db.executeSql("Delete From syllabus where srno=?", sSrNo); //This Line For Delete Record From Database Syllabus table	
  			  	successMsg= sSClass + " Syllabus Is Deleted Successfully!";
  			  	}
  			}
	
  	
  %>

<div class="mt-2 mb-2  d-flex flex-row-reverse">
		<a class="btn btn-primary pr-5" href="/College_Managment_System/Admin/syllabus.jsp">Back To Syllabus</a>
</div>

<!-- Teacher Faculties Add, Update, Find & Delete Form -->
	<div class="card mt-5 col-6 offset-3 mb-3">
	<div class="card-header bg-info text-white">
	<h4 class="text-center">Edit Syllabus Form</h4>
	</div>
	<div class="card-body">
	<!-- HTML FORM -->
	<form action="" method="post" enctype="multipart/form-data">
	<div class="form-group">
	Sr. No.
	<input name="essrno" class="form-control" autofocus value="<%=sSrNo%>" placeholder="Enter Sr. No. Of Syllabus"/> 
	</div>
	<div class="form-group">
	Syllabus Title
	<input name="esst" class="form-control" value="<%=sSTitle%>"  placeholder="Enter Title of Syllabus"/>
	</div>
	<div class="form-group">
	Syllabus Class
	<input name="essc" class="form-control" value="<%=sSClass%>" placeholder="Enter Class Of Syllabus"/> 
	</div>
	<div class="form-group mb-3">
	  <label for="formFileResume" class="form-label">Syllabus File</label>
 	 <input name="essf" class="form-control" type="file" id="formFileResume">
	</div>
<div class="mt-2 mb-3 d-flex justify-content-between">
		<input Type="submit" value="Add Syllabus" name="sbtnadd" class="btn btn-primary"/>
		<input Type="submit" value="Find Syllabus" name="sbtnfind" class="btn btn-info"/>
		<input Type="submit" value="Update Syllabus" name="sbtnupdate" class="btn btn-secondary"/>
		<input Type="submit" value="Delete Syllabus" name="sbtndelete" class="btn btn-danger"/>	
</div>
</form>
</div>
</div>	

<%@ include file="../footer.jsp"%>