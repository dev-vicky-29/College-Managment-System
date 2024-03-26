<%@page import="java.sql.ResultSet"%>
<%@page import="javazoom.upload.UploadFile"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@page import="javazoom.upload.UploadBean"%>
<%@ include file="../header.jsp"%>

<%
    String classValue = "", subject = "", teacherName = "",  fileName = "";
    
    // Path to store uploaded files
    String path = request.getRealPath("/NoteFiles/");
    UploadBean upBean = new UploadBean();
    upBean.setFolderstore(path);

    if (MultipartFormDataRequest.isMultipartFormData(request)) {
        MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);

        // Add Button Operation
        if (mrequest.getParameter("btnAdd") != null) {
            classValue = mrequest.getParameter("class");
            subject = mrequest.getParameter("subject");
            teacherName = mrequest.getParameter("teacherName");
            HttpSession Session = request.getSession();
            String Email = (String) session.getAttribute("mail");

            // Handle file upload
            Hashtable ht = mrequest.getFiles();
            if (ht != null && ht.size() > 0) {
                UploadFile uf = (UploadFile) ht.get("file");
                if (uf != null && uf.getFileName() != null && !uf.getFileName().equals("")) {
                    fileName = uf.getFileName();
                    upBean.store(mrequest, "file");
                }
            }

            // Insert data into database
            db.executeSql("INSERT INTO Notes (Class, Subject, TeacherName,EmailID, File) VALUES (?, ?, ?, ?, ?)", classValue, subject, teacherName,Email, fileName);
            successMsg = "Note added successfully";
        }
    }
%>
<div class="card mt-5 col-7 offset-3">
    <div class="card-header bg-info text-white">
        <h4 class="text-center">Add Notes</h4>
    </div>
    <div class="card-body">
    <form method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="class">Class</label>
            <input type="text" class="form-control" id="class" name="class" placeholder="Enter class Name" required>
        </div>
        <div class="form-group">
            <label for="subject">Subject</label>
            <input type="text" class="form-control" id="subject" name="subject" placeholder="Enter subject Name" required>
        </div>
        <div class="form-group">
            <label for="teacherName">Teacher Name</label>
            <input type="text" class="form-control" id="teacherName" name="teacherName" placeholder="Enter teacher name" required>
        </div>
        <div class="form-group">
            <label for="file">File</label>
            <input type="file" class="form-control-file" id="file" name="file" required>
        </div>
        <button type="submit" class="btn btn-primary" name="btnAdd">Add Note</button>
    </form>
</div>
</div>
<%@ include file="../footer.jsp"%>
