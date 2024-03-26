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
  	
  		  	}
	
  	
  %>
  <!-- Teacher Faculties Add, Update, Find & Delete Form -->
   <div class="mt-2 mb-2  d-flex flex-row-reverse">
    <a class="btn btn-primary pr-5" href="/College_Managment_System/Admin/TeachingFacultyList.jsp">Teaching Faculty List</a>
</div>
	<div class="card mt-5 col-7 offset-2">
	<div class="card-header bg-info text-white">
	<h4 class="text-center">Teaching Faculty Form</h4>
	</div>
	<div class="card-body">
	<!-- HTML FORM -->
	<form action="" method="post" enctype="multipart/form-data" id="TForm">
	<div class="form-group">
	Teacher ID
	<input name="tid" class="form-control" autofocus value="<%=tID%>" placeholder="Enter Teacher ID" required/> 
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
<div class="text-center d-grid gap-2">
		<input Type="submit" value="Add Facultie" name="tbtnadd" class="btn btn-primary"/>	
</div>
</form>
</div>
</div>	

 
<%@ include file="../footer.jsp"%>

<!-- Add this script section after including jQuery

<script>
  $(document).ready(function () {
    // Add validation rules
    $("#TForm").validate({
      rules: {
        tid: {
          required: true,
          minlength: 3,
        },
        tname: {
          required: true,
        },
        tqualification: {
          required: true,
        },
        tsubject: {
          required: true,
        },
        tLinkedIn: {
          required: true,
          url: true,
        },
        timage: {
          required: true,
        },
        tresume: {
          required: true,
        },
      },
      messages: {
        tid: {
          required: "Please enter Teacher ID",
          minlength: "Teacher ID must be at least 3 characters",
        },
        tname: {
          required: "Please enter Teacher Name",
        },
        tqualification: {
          required: "Please enter Teacher Qualification",
        },
        tsubject: {
          required: "Please enter Teacher Subjects",
        },
        tLinkedIn: {
          required: "Please enter Teacher LinkedIn",
          url: "Please enter a valid LinkedIn URL",
        },
        timage: {
          required: "Please upload Teacher Image",
        },
        tresume: {
          required: "Please upload Teacher Resume",
        },
      },
    });
  });
</script>
 -->