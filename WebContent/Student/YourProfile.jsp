<%@page import="java.sql.ResultSet"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="javazoom.upload.UploadBean"%>
<%@page import="javazoom.upload.UploadFile"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@ include file="../header.jsp" %>

<%
    String email = "", prn="", rollNumber="", batch="", studentName="", phoneNumber="", password="", photo="", studentClass="";

    email = session.getAttribute("mail").toString();

    String path = request.getRealPath("/Photos/");
    if (MultipartFormDataRequest.isMultipartFormData(request)) {
        MultipartFormDataRequest mreq = new MultipartFormDataRequest(request);

        if (mreq.getParameter("updateProfileBtn") != null) {
            prn = mreq.getParameter("prn");
            rollNumber = mreq.getParameter("rollNumber");
            studentName = mreq.getParameter("studentName");
            batch = mreq.getParameter("batch");
            phoneNumber = mreq.getParameter("phoneNumber");
            password = mreq.getParameter("password");

            try {
                db.executeSql("UPDATE studentlogin SET RollNumber=?, StudentName=?, Batch=?, PhoneNumber=?, Password=? WHERE EmailID=?", rollNumber, studentName, batch, phoneNumber, password, email);
                out.println("<script> showMsg('Profile Updated');</script>");
            } catch (Exception ex) {
                // Handle the exception
                ex.printStackTrace();
            }
        } else if (mreq.getParameter("updatePhotoBtn") != null) {
            Hashtable ht = mreq.getFiles();
            UploadFile ufile = (UploadFile) ht.get("photo");
            if(ufile != null) {
                photo = ufile.getFileName();

                UploadBean ub = new UploadBean();
                ub.setFolderstore(path);
                ub.store(mreq, "photo");

                try {
                    db.executeSql("UPDATE studentlogin SET Photo=? WHERE EmailID=?", photo, email);
                    out.println("<script> showMsg('Photo Updated');</script>");
                } catch (Exception ex) {
                    // Handle the exception
                    ex.printStackTrace();
                }
            }
        }
    }

    ResultSet rs = db.getRows("SELECT * FROM studentlogin WHERE EmailId=?", email);
    if (rs.next()) {
        prn = rs.getString("PRN");
        rollNumber = rs.getString("RollNumber");
        studentName = rs.getString("StudentName");
        batch = rs.getString("Batch");
        phoneNumber = rs.getString("PhoneNumber");
        password = rs.getString("Password");
        photo = rs.getString("Photo");
        studentClass = rs.getString("Class");
    }
%>

<section id="form" class="mt-5"><!--form-->
    <div class="container">
        <div class="row  justify-content-center">
            <div class="col-lg-8"><!-- Increased width to col-lg-8 -->
                <div class="card shadow-lg border-0 rounded-lg mt-5">
                    <div class="card-header">
                        <h3 class="text-center font-weight-light my-4">Manage your Profile</h3>
                    </div>
                    <div class="card-body">
                        <form method="post" name="form1" id="form1" enctype="multipart/form-data" class="form custom-border mt-8 rounded">
                        <div class="form-group">
                                <img src="/College_Managment_System/Photos/<%= photo %>" width="150" height="150" alt="NA" class="img-thumbnail rounded-circle mx-auto d-block"/>
                            </div>
                            <div class="form-group">
                                <label class="small mb-1" for="inputEmail">Email ID</label>
                                <input type="email" class="form-control py-4" name="email" readonly="readonly" value="<%= email %>" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <label class="small mb-1" for="inputPRN">PRN</label>
                                <input type="text" class="form-control py-4" name="prn" readonly="readonly" value="<%= prn %>" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <label class="small mb-1" for="inputRollNumber">Roll Number</label>
                                <input type="text" class="form-control py-4" name="rollNumber" value="<%= rollNumber %>" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <label class="small mb-1" for="inputStudentName">Student Name</label>
                                <input type="text" class="form-control py-4" name="studentName" value="<%= studentName %>" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <label class="small mb-1" for="inputBatch">Batch</label>
                                <input type="text" class="form-control py-4" name="batch" value="<%= batch %>" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <label class="small mb-1" for="inputPhoneNumber">Phone Number</label>
                                <input type="text" class="form-control py-4" name="phoneNumber" value="<%= phoneNumber %>" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <label class="small mb-1" for="inputPassword">Password</label>
                                <input type="password" class="form-control py-4" name="password" value="<%= password %>" class="form-control"/>
                            </div>
                            <div class="form-group mt-4 mb-0">
                            <div class="text-center d-grid gap-2">
                                <button type="submit" name="updateProfileBtn" class="btn btn-primary btn-block">Update Profile</button>
                           </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section><!--/form-->

<section id="photo" class="mt-5"><!--photo-->
    <div class="container">
        <div class="row  justify-content-center">
            <div class="col-lg-8"><!-- Increased width to col-lg-8 -->
                <div class="card shadow-lg border-0 rounded-lg mt-5">
                    <div class="card-header">
                        <h3 class="text-center font-weight-light my-4">Update your Photo</h3>
                    </div>
                    <div class="card-body">
                        <form method="post" name="photoForm" id="photoForm" enctype="multipart/form-data" class="form custom-border mt-8 rounded">
                            <div class="form-group">
                                <label class="small mb-1" for="inputPhoto">Upload Photo</label>
                                <input type="file" name="photo" class="form-control" value="<%= photo %>"/>
                            </div>
                            <div class="form-group mt-4 mb-0">
                            <div class="text-center d-grid gap-2">
                                <button type="submit" name="updatePhotoBtn" class="btn btn-primary btn-block">Update Photo</button>
                            </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section><!--/photo-->

<%@ include file="../footer.jsp" %>
