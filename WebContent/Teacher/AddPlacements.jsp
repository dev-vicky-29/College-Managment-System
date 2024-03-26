<%@page import="java.sql.ResultSet"%>
<%@page import="javazoom.upload.UploadFile"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@page import="javazoom.upload.UploadBean"%>
<%@ include file="../header.jsp"%>
<!-- Add Placement Related Files -->
<%
    String studentName = "", batchYear = "", companyName = "", jobTitle = "", placementYear = "", salary = "", placementType = "", jobLocation = "", linkedInLink = "";
    String studentPhotoFileName = "";

    String path = request.getRealPath("/StudentPhotos/");
    UploadBean upBean = new UploadBean();
    upBean.setFolderstore(path);

    if (MultipartFormDataRequest.isMultipartFormData(request)) {
        MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);

        // Add Button Operation
        if (mrequest.getParameter("ntbtnadd") != null) {
            studentName = mrequest.getParameter("StudentName");
            batchYear = mrequest.getParameter("BatchYear");
            companyName = mrequest.getParameter("CompanyName");
            jobTitle = mrequest.getParameter("JobTitle");
            placementYear = mrequest.getParameter("PlacementYear");
            salary = mrequest.getParameter("Salary");
            placementType = mrequest.getParameter("PlacementType");
            jobLocation = mrequest.getParameter("JobLocation");
            linkedInLink = mrequest.getParameter("LinkedInLink");

            Hashtable ht = mrequest.getFiles();
            if (ht != null && ht.size() > 0) {
                UploadFile uf = (UploadFile) ht.get("ntimage");
                if (uf != null && uf.getFileName() != null && !uf.getFileName().equals("")) {
                    studentPhotoFileName = uf.getFileName();
                    upBean.store(mrequest, "ntimage");
                }
            }

            db.executeSql("INSERT INTO placement (StudentName, BatchYear, CompanyName, JobTitle, PlacementYear, Salary, PlacementType, JobLocation, LinkedInLink, StudentPhoto) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", studentName, batchYear, companyName, jobTitle, placementYear, salary, placementType, jobLocation, linkedInLink, studentPhotoFileName);

            successMsg = "Placement added successfully";
        }
    }
%>

<!-- Add Placement Form -->

<div class="card mt-5 col-7 offset-3">
    <div class="card-header bg-info text-white">
        <h4 class="text-center">Add Placement</h4>
    </div>
    <div class="card-body">
        <form id="FormNT" action="" method="post" enctype="multipart/form-data">
            <div class="form-group">
                Student Name
                <input name="StudentName" class="form-control" autofocus placeholder="Enter Student Name" required/>
            </div>
            <div class="form-group">
                Batch Year
                <input name="BatchYear" class="form-control" placeholder="Enter Batch Year" required/>
            </div>
            <div class="form-group">
                Company Name
                <input name="CompanyName" class="form-control" placeholder="Enter Company Name" required/>
            </div>
            <div class="form-group">
                Job Title
                <input name="JobTitle" class="form-control" placeholder="Enter Job Title" required/>
            </div>
            <div class="form-group">
                Placement Year
                <input name="PlacementYear" class="form-control" placeholder="Enter Placement Year" required/>
            </div>
            <div class="form-group">
                Salary
                <input name="Salary" class="form-control" placeholder="Enter Salary" required/>
            </div>
            <div class="form-group">
                Placement Type
                <input name="PlacementType" class="form-control" placeholder="Enter Placement Type" required/>
            </div>
            <div class="form-group">
                Job Location
                <input name="JobLocation" class="form-control" placeholder="Enter Job Location" required/>
            </div>
            <div class="form-group">
                LinkedIn Link
                <input name="LinkedInLink" class="form-control" placeholder="Enter LinkedIn Profile Link"/>
            </div>
            <div class="form-group mb-3">
                <label for="formFile" class="form-label">Student Photo</label>
                <input name="ntimage" class="form-control" type="file" id="formFile" required>
            </div>
            <div class="text-center d-grid gap-2">
                <input type="submit" value="Add Placement" name="ntbtnadd" class="btn btn-lg btn-primary"/>
            </div>
        </form>
    </div>
</div>

<%@ include file="../footer.jsp"%>
