<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javazoom.upload.UploadFile"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@page import="javazoom.upload.UploadBean"%>
<%@ include file="../header.jsp"%>
<!-- Add faculty Related Files -->

  <%
	String tID="", tName="", tQualification="", tSubject="", tLinkedIn="" ;
	String fImgName="", fResumeName="";
	
  		String path=request.getRealPath("/FacultyFiles/");
	//College Managment System/WebContent/images/FacultyFiles
	//E:\Eclipse\College Managment System\WebContent\images\FacultyFiles
	UploadBean upBean=new UploadBean();
	upBean.setFolderstore(path); //Store Uploaded Files In This Directory/Folder

  	
  
  	
  	if(MultipartFormDataRequest.isMultipartFormData(request)){
  		MultipartFormDataRequest mrequest=new MultipartFormDataRequest(request);
  		//request (MP) ==> Wrapper ===>  MultipartFormDataRequest
  				//Add Button Operation
  				if(mrequest.getParameter("tbtnadd")!=null){
  				tID=mrequest.getParameter("tid");
  				tName=mrequest.getParameter("tname");
  				tQualification=mrequest.getParameter("tqualification");
  				tSubject=mrequest.getParameter("tsubject");
  				tLinkedIn=mrequest.getParameter("tLinkedIn");
  				Hashtable ht=mrequest.getFiles();//HashTable - Collection of Key/Value pair
  				if(ht!=null && ht.size()>0){
  					UploadFile uf=(UploadFile)ht.get("timage");//Return Type ===> Object
  							if(uf!=null && uf.getFileName()!=null && !uf.getFileName().equals("")){
  								fImgName=uf.getFileName();
  								//Upload / Save File To Server
  								upBean.store(mrequest, "timage");
  							}
  				}
  			if(ht!=null && ht.size()>0){
  					UploadFile uf=(UploadFile)ht.get("tresume");//Return Type ===> Object
  							if(uf!=null && uf.getFileName()!=null && !uf.getFileName().equals("")){
  								fResumeName=uf.getFileName();
  								//Upload / Save File To Server
  								upBean.store(mrequest, "tresume");
  							}
  				} 
			db.executeSql("insert into teachingfaculty (TeacherID,TeacherName,TeacherQualification,Subjects,LinkedIn,TeacherProfilePhoto,TeacherResume)  values (?,?,?,?,?,?,?)", tID, tName, tQualification, tSubject, tLinkedIn, fImgName, fResumeName); //This Line For Insert Record Into Database Student table	
			successMsg="Teacher Faculty Added Successfully";
			}
  	
  		//Find Button Operation
  		
  		if (mrequest.getParameter("tbtnfind") != null) {
  	        tID = mrequest.getParameter("tid");
  	        // Use PreparedStatement to avoid SQL injection
  	       ResultSet rs= db.getRows("SELECT * FROM teachingfaculty WHERE TeacherID=?", tID);
  	        

  	        if (rs.next()) {
  	            tName = rs.getString("TeacherName");
  	            tQualification = rs.getString("TeacherQualification");
  	            tSubject = rs.getString("Subjects");
  	            tLinkedIn = rs.getString("LinkedIn");
  	          	fImgName = rs.getString("TeacherProfilePhoto");
  	          fResumeName = rs.getString("TeacherResume");
  	         } else {
  	            // Handle the case when no record is found
  	            errorMsg = "No record found for Teacher ID: " + tID;
  	        }
  		}
  	        
  		//Update Record Operation
  		
  		if(mrequest.getParameter("tbtnupdate")!=null){ //Update Button Clicked
  				tID=mrequest.getParameter("tid");
				tName=mrequest.getParameter("tname");
				tQualification=mrequest.getParameter("tqualification");
				tSubject=mrequest.getParameter("tsubject");
				tLinkedIn=mrequest.getParameter("tLinkedIn");
	
	db.executeSql("update teachingfaculty set TeacherName=?,TeacherQualification=?,Subjects=?,LinkedIn=? where TeacherID=?" ,tName,tQualification,tSubject,tLinkedIn,tID); //This Line For Update Record Into Database Student table	
	successMsg="Teaching Faculty Record Is Updated";
  		}
	
  			//Delete Record Operation
  			  	if(mrequest.getParameter("tbtndelete")!=null){ //Delete Button Clicked
  			  	tID=mrequest.getParameter("tid");
  			  		db.executeSql("Delete From teachingfaculty where TeacherID=?", tID); //This Line For Delete Record From Database teachingfaculty table	
  			  	successMsg="Faculty Record Is Deleted";
  			  	}
  	}
	
  	
  %>
  <!-- Teacher Faculties Add, Update, Find & Delete Form -->
	<div class="card mt-5 col-7 offset-2">
	<div class="card-header bg-info text-white">
	<h4 class="text-center">Teaching Faculty Form</h4>
	</div>
	<div class="card-body">
	<!-- HTML FORM -->
	<form action="" method="post" enctype="multipart/form-data">
	<div class="form-group">
	Teacher ID
	<input name="tid" class="form-control" autofocus value="<%=tID%>" placeholder="Enter Teacher ID"/> 
	</div>
	<div class="form-group">
	Teacher Name
	<input name="tname" class="form-control" value="<%=tName%>" placeholder="Enter Teacher Name"/>
	</div>
	<div class="form-group">
	Teacher Qualification
	<input name="tqualification" class="form-control" value="<%=tQualification%>" placeholder="Enter Teacher Qualification"/> 
	</div>
	<div class="form-group">
	Teacher Subject's
	<input name="tsubject" class="form-control" value="<%=tSubject%>" placeholder="Enter Subject's"/>
	</div>
	<div class="form-group">
	Teacher LinkedIn
	<input name="tLinkedIn" class="form-control" value="<%=tLinkedIn%>" placeholder="Enter Teacher LinkendIn Valid Link"/> 
	</div>
	<div class="form-group mb-3">
	  <label for="formFileImage" class="form-label">Teacher Image</label>
 	 <input name="timage" class="form-control" value="<%=fImgName%>" type="file" id="formFileImage">
	</div>
	<div class="form-group mb-3">
	  <label for="formFileResume" class="form-label">Teacher Resume File</label>
 	 <input name="tresume" class="form-control" value="<%=fResumeName%>" type="file" id="formFileResume">
	</div>
<div class="mt-2 mb-5 d-flex justify-content-between">
		<input Type="submit" value="Add Facultie" name="tbtnadd" class="btn btn-primary"/>
		<input Type="submit" value="Find Facultie" name="tbtnfind" class="btn btn-info"/>
		<input Type="submit" value="Update Facultie" name="tbtnupdate" class="btn btn-secondary"/>
		<input Type="submit" value="Delete Facultie" name="tbtndelete" class="btn btn-danger"/>	
</div>
</form>
</div>
</div>	


 
<%@ include file="../footer.jsp"%>