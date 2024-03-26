<%@page import="java.sql.ResultSet"%>
<%@page import="javazoom.upload.UploadFile"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@page import="javazoom.upload.UploadBean"%>
<%@ include file="../header.jsp"%>

<%
    // Initialize variables to store form data
    String projectName = "";
    String studentName = "";
    String partnerName = "";
    String description = "";
    String mentor = "";
    String year = "";
    String fileName = "";

    // Get the path for storing files
    String path = request.getRealPath("/ProjectFiles/");
    
    // Initialize upload bean
    UploadBean upBean = new UploadBean();
    upBean.setFolderstore(path);

    // Check if the request is multipart form data
    if (MultipartFormDataRequest.isMultipartFormData(request)) {
        MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);

        // Check if form is submitted
        if (mrequest.getParameter("btnAddProject") != null) {
            // Retrieve form data
            projectName = mrequest.getParameter("projectName");
            studentName = mrequest.getParameter("studentName");
            partnerName = mrequest.getParameter("partnerName");
            description = mrequest.getParameter("description");
            mentor = mrequest.getParameter("mentor");
            year = mrequest.getParameter("year");

            // Get uploaded file
            Hashtable ht = mrequest.getFiles();
            if (ht != null && ht.size() > 0) {
                UploadFile uf = (UploadFile) ht.get("projectFile");
                if (uf != null && uf.getFileName() != null && !uf.getFileName().equals("")) {
                    fileName = uf.getFileName();
                    // Upload file to server
                    upBean.store(mrequest, "projectFile");
                }
            }

            // Insert project data into database
            db.executeSql("INSERT INTO studentprojects (ProjectName, StudentName, PartnerName, Description, Mentor, Year, File) VALUES (?, ?, ?, ?, ?, ?, ?)", 
                           projectName, studentName, partnerName, description, mentor, year, fileName);

            successMsg = "Student project added successfully";
        }
    }
%>

<div class="mt-2 mb-2 d-flex flex-row-reverse">
    <a class="btn btn-primary pr-5" href="/College_Managment_System/Admin/StudentProjectList.jsp">Project List</a>
</div>

<div class="card mt-5 col-7 offset-2">
    <div class="card-header bg-info text-white">
        <h4 class="text-center">Add Student Project</h4>
    </div>
    <div class="card-body">
        <form id="FormProject" action="" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="projectName">Project Name</label>
                <input name="projectName" class="form-control" placeholder="Enter Project Name" required/>
            </div>
            <div class="form-group">
                <label for="studentName">Student Name</label>
                <input name="studentName" class="form-control" placeholder="Enter Student Name" required/>
            </div>
            <div class="form-group">
                <label for="partnerName">Partner Name</label>
                <input name="partnerName" class="form-control" placeholder="Enter Partner Name" required/>
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea name="description" class="form-control" rows="3" placeholder="Enter Project Description" required></textarea>
            </div>
            <div class="form-group">
                <label for="mentor">Mentor</label>
                <input name="mentor" class="form-control" placeholder="Enter Mentor Name" required/>
            </div>
            <div class="form-group">
                <label for="year">Year</label>
                <input name="year" class="form-control" type="text" placeholder="Enter Year" required/>
            </div>
            <div class="form-group mb-3">
                <label for="projectFile">Project File</label>
                <input name="projectFile" class="form-control" type="file" required>
            </div>
            <div class="text-center d-grid gap-2">
                <input type="submit" value="Add Project" name="btnAddProject" class="btn btn-lg btn-primary"/>
            </div>
        </form>
    </div>
</div>

<%@ include file="../footer.jsp"%>
