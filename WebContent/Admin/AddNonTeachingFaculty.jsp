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
  	
  		 		}

%>
  
  <!-- Non-Teacher Faculties Add, Update, Find & Delete Form -->
  
  <div class="mt-2 mb-2  d-flex flex-row-reverse">
    <a class="btn btn-primary pr-5" href="/College_Managment_System/Admin/NonTeachingFacultyList.jsp">Non Teaching Faculty List</a>
</div>
	<div class="card mt-5 col-7 offset-2">
	<div class="card-header bg-info text-white">
	<h4 class="text-center">Add Non-Teaching Faculties Form</h4>
	</div>
	<div class="card-body">
	<!-- HTML FORM -->
	<form id="FormNT" action="" method="post" enctype="multipart/form-data">
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
		<div class="text-center d-grid gap-2">
		<input Type="submit" value="Add Faculty" name="ntbtnadd" id="" class="btn btn-lg btn-primary"/>
</div>
</form>
</div>
</div>	
    <%@ include file="../footer.jsp"%>
 <script>
        $(document).ready(function () {
            $('#FormNT').validate({
                rules: {
                    ntid: {
                        required: true
                    },
                    ntname: {
                        required: true
                    },
                    ntqualification: {
                        required: true
                    },
                    ntimage: {
                        required: true
                    }
                    // Add more rules if needed
                },
                messages: {
                    ntid: {
                        required: 'Please enter Support Staff ID'
                    },
                    ntname: {
                        required: 'Please enter Support Staff Name'
                    },
                    ntqualification: {
                        required: 'Please enter Support Staff Qualification'
                    },
                    ntimage: {
                        required: 'Please select Teacher Image'
                    }
                    // Add more messages if needed
                }
            });
        });
    </script>


