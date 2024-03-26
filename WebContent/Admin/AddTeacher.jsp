<%@page import="java.sql.ResultSet"%>
<%@page import="javazoom.upload.UploadFile"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@page import="javazoom.upload.UploadBean"%>
<%@ include file="../header.jsp"%>
<!-- Add Teacher Related Files -->
<%
    String teacherID = "", teacherName = "", emailID = "", number = "", password = "";
    String teacherImage = "";

    String path = request.getRealPath("/Photos/");
    UploadBean upBean = new UploadBean();
    upBean.setFolderstore(path);

    if (MultipartFormDataRequest.isMultipartFormData(request)) {
        MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);

        if (mrequest.getParameter("ntbtnadd") != null) {
            teacherID = mrequest.getParameter("txtteacherid");
            teacherName = mrequest.getParameter("txtteachername");
            emailID = mrequest.getParameter("txtemail");
            number = mrequest.getParameter("txtnumber");
            password = mrequest.getParameter("txtpassword");

            Hashtable ht = mrequest.getFiles();
            if (ht != null && ht.size() > 0) {
                UploadFile uf = (UploadFile) ht.get("ntimage");
                if (uf != null && uf.getFileName() != null && !uf.getFileName().equals("")) {
                    teacherImage = uf.getFileName();
                    upBean.store(mrequest, "ntimage");
                }
            }

            db.executeSql("INSERT INTO teacherlogin (TeacherID, TeacherName, EmailID, Number, Password, TeacherImage) VALUES (?,?,?,?,?,?)",
                    teacherID, teacherName, emailID, number, password, teacherImage);
            successMsg = teacherName + " Teacher Added Successfully";
        }
    }
%>

<!-- Teacher Add Form -->
<div class="mt-2 mb-2 d-flex flex-row-reverse">
    <a class="btn btn-primary pr-5" href="/College_Managment_System/Admin/TeacherList.jsp">Teacher List</a>
</div>
<div class="card mt-5 col-7 offset-3">
    <div class="card-header bg-info text-white">
        <h4 class="text-center">Add Teacher</h4>
    </div>
    <div class="card-body">
        <form id="FormNT" action="" method="post" enctype="multipart/form-data">
            <div class="form-group">
                Teacher ID
                <input name="txtteacherid" class="form-control" autofocus placeholder="Enter Teacher ID" required/>
            </div>
            <div class="form-group">
                Teacher Name
                <input name="txtteachername" class="form-control" placeholder="Enter Teacher Name" required/>
            </div>
            <div class="form-group">
                Email
                <input name="txtemail" class="form-control" placeholder="Enter Teacher Email ID" required/>
            </div>
            <div class="form-group">
                Number
                <input name="txtnumber" class="form-control" placeholder="Enter Teacher Number" required/>
            </div>
            <div class="form-group">
                Password
                <input name="txtpassword" class="form-control" placeholder="Enter Teacher Password" required/>
            </div>
            <div class="form-group mb-3">
                <label for="formFile" class="form-label">Teacher Image</label>
                <input name="ntimage" class="form-control" type="file" id="formFile" required>
            </div>
            <div class="text-center d-grid gap-2">
                <input Type="submit" value="Add Teacher" name="ntbtnadd" class="btn btn-lg btn-primary"/>
            </div>
        </form>
    </div>
</div>
<%@ include file="../footer.jsp"%>
