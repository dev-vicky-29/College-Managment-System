<%@page import="java.sql.ResultSet"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="javazoom.upload.UploadBean"%>
<%@page import="javazoom.upload.UploadFile"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@ include file="../header.jsp" %>

<%
    String email = "", tID="", tName="", number = "", password = "", teacherImage = "";

    email = session.getAttribute("mail").toString();

    String path = request.getRealPath("/Photos/");
    if (MultipartFormDataRequest.isMultipartFormData(request)) {
        MultipartFormDataRequest mreq = new MultipartFormDataRequest(request);

        if (mreq.getParameter("btn") != null) {
            tID = mreq.getParameter("gender");
            tName = mreq.getParameter("bdate");
            number = mreq.getParameter("number");
            password = mreq.getParameter("password");

            Hashtable ht = mreq.getFiles();
            UploadFile ufile = (UploadFile) ht.get("teacherImage");
            teacherImage = ufile.getFileName();

            UploadBean ub = new UploadBean();
            ub.setFolderstore(path);
            ub.store(mreq, "teacherImage");

            try {
                db.executeSql("UPDATE teacherlogin SET TeacherName=?,  Number=?, Password=?, TeacherImage=? WHERE EmailID=?", tName, number, password, teacherImage, email);
            } catch (Exception ex) {
                out.println("<script> showMsg('Profile Updated');</script>");
            }
        }
    }

    ResultSet rs = db.getRows("SELECT * FROM teacherlogin WHERE EmailId=?", email);
    if (rs.next()) {
        tID = rs.getString("TeacherID");
        tName = rs.getString("TeacherName");
        number = rs.getString("Number");
        password = rs.getString("Password");
        teacherImage = rs.getString("TeacherImage");
    }
%>

<section id="form" class="mt-5"><!--form-->
    <div class="container">
        <div class="row  justify-content-center">
            <div class="col-lg-6">
                <div class="card shadow-lg border-0 rounded-lg mt-5">
                    <div class="card-header">
                        <h3 class="text-center font-weight-light my-4">Manage your Profile</h3>
                    </div>
                    <div class="card-body">
                        <form method="post" name="form1" id="form1" enctype="multipart/form-data">
                            <div class="form-group">
                                <img src="/College_Managment_System/Photos/<%= teacherImage %>" width="150" height="150" alt="NA" class="img-thumbnail rounded-circle mx-auto d-block"/>
                            </div>
                            <div class="form-group">
                                <label class="small mb-1" for="inputEmail">Email ID</label>
                                <input type="email" class="form-control py-4" name="email" readonly="readonly" value="<%= email %>" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <label class="small mb-1" for="inputTeacherID">Teacher ID</label>
                                <input type="text" class="form-control py-4" name="teacherID" readonly="readonly" value="<%= tID %>" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <label class="small mb-1" for="inputTeacherName">Teacher Name</label>
                                <input type="text" class="form-control py-4" name="teacherName" value="<%= tName %>" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <label class="small mb-1" for="inputNumber">Number</label>
                                <input type="text" class="form-control py-4" name="number" value="<%= number %>" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <label class="small mb-1" for="inputPassword">Password</label>
                                <input type="password" class="form-control py-4" name="password" value="<%= password %>" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <label class="small mb-1" for="inputTeacherImage">Upload Photo</label>
                                <input type="file" name="teacherImage" class="form-control" value="<%= teacherImage %>"/>
                            </div>
                            <div class="form-group mt-4 mb-0">
                                <button type="submit" name="btn" class="btn btn-primary btn-block">Update Profile</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section><!--/form-->

<%@ include file="../footer.jsp" %>
