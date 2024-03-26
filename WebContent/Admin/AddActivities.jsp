<%@page import="java.sql.ResultSet"%>
<%@page import="javazoom.upload.UploadFile"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@page import="javazoom.upload.UploadBean"%>
<%@ include file="../header.jsp"%>
<!-- Add Activities Related Files -->
<%
    String date = "", activity = "",  level = "", title = "", students = "";
    String reportFileName = "";

    String path = request.getRealPath("/PDFFILES/");
    UploadBean upBean = new UploadBean();
    upBean.setFolderstore(path);

    if (MultipartFormDataRequest.isMultipartFormData(request)) {
        MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);

        // Add Button Operation
        if (mrequest.getParameter("ntbtnadd") != null) {
            date = mrequest.getParameter("aDate");
            activity = mrequest.getParameter("aActivity");
            
            level = mrequest.getParameter("aLevel");
            title = mrequest.getParameter("aTitle");
            students = mrequest.getParameter("aStudents");

            Hashtable ht = mrequest.getFiles();
            if (ht != null && ht.size() > 0) {
                UploadFile uf = (UploadFile) ht.get("ntimage");
                if (uf != null && uf.getFileName() != null && !uf.getFileName().equals("")) {
                    reportFileName = uf.getFileName();
                    upBean.store(mrequest, "ntimage");
                }
            }

            db.executeSql("INSERT INTO activities (Date, ActivityType , Level, Title, Students, PDF) " +
                    "VALUES (?, ?, ?, ?, ?, ?)", date, activity, level, title, students, reportFileName);

            successMsg = "Activity added successfully";
        }
    }
%>

<!-- Add Activities Form -->
<div class="mt-2 mb-2  d-flex flex-row-reverse">
    <a class="btn btn-primary pr-5" href="/College_Managment_System/Admin/ActivitiesList.jsp">Activities List</a>
</div>
<div class="card mt-5 col-7 offset-3">
    <div class="card-header bg-info text-white">
        <h4 class="text-center">Add Activities</h4>
    </div>
    <div class="card-body">
        <form id="FormNT" action="" method="post" enctype="multipart/form-data">
            <div class="form-group">
                Date
                <input name="aDate" class="form-control" type="date" placeholder="Enter Date" required/>
            </div>
            <div class="form-group">
                Activity
                <input name="aActivity" class="form-control" placeholder="Enter Activity Type" required/>
            </div>
            
            <div class="form-group">
                Level
                <input name="aLevel" class="form-control" placeholder="Enter Level" required/>
            </div>
            <div class="form-group">
                Title
                <input name="aTitle" class="form-control" placeholder="Enter Title" required/>
            </div>
            <div class="form-group">
                No. of Student Benefitted
                <input name="aStudents" class="form-control" placeholder="Enter No. of Students" required/>
            </div>
            <div class="form-group mb-3">
                <label for="formFile" class="form-label">Report File</label>
                <input name="ntimage" class="form-control" value="<%= reportFileName %>" type="file" id="formFile" required>
            </div>
            <div class="text-center d-grid gap-2">
                <input type="submit" value="Add Activity" name="ntbtnadd" class="btn btn-lg btn-primary"/>
            </div>
        </form>
    </div>
</div>

<%@ include file="../footer.jsp"%>
