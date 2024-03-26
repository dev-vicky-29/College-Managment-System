<%@page import="java.sql.ResultSet"%>
<%@page import="javazoom.upload.UploadFile"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@page import="javazoom.upload.UploadBean"%>
<%@ include file="../header.jsp"%>
<!-- Add MOU Related Files -->
<%
    String type = "", year = "", agencyName = "", fileName = "";

    String path = request.getRealPath("/PDFFILES/");
    UploadBean upBean = new UploadBean();
    upBean.setFolderstore(path);

    if (MultipartFormDataRequest.isMultipartFormData(request)) {
        MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);

        // Add Button Operation
        if (mrequest.getParameter("ntbtnadd") != null) {
            type = mrequest.getParameter("mouType");
            year = mrequest.getParameter("mouYear");
            agencyName = mrequest.getParameter("mouAgencyName");

            Hashtable ht = mrequest.getFiles();
            if (ht != null && ht.size() > 0) {
                UploadFile uf = (UploadFile) ht.get("mouFile");
                if (uf != null && uf.getFileName() != null && !uf.getFileName().equals("")) {
                    fileName = uf.getFileName();
                    upBean.store(mrequest, "mouFile");
                }
            }

            db.executeSql("INSERT INTO MOUs (Type, Year, AgencyName, File) VALUES (?, ?, ?, ?)", type, year, agencyName, fileName);

            successMsg = "MOU added successfully";
        }
    }
%>

<!-- Add MOU Form -->
<div class="mt-2 mb-2  d-flex flex-row-reverse">
    <a class="btn btn-primary pr-5" href="/College_Managment_System/Admin/MOUsList.jsp">MOUs List</a>
</div>
<div class="card mt-5 col-7 offset-3">
    <div class="card-header bg-info text-white">
        <h4 class="text-center">Add MOU</h4>
    </div>
    <div class="card-body">
        <form id="FormNT" action="" method="post" enctype="multipart/form-data">
            <div class="form-group">
                Type
                <input name="mouType" class="form-control" placeholder="Enter MOU Type" required/>
            </div>
            <div class="form-group">
                Year
                <input name="mouYear" class="form-control" placeholder="Enter MOU Year" required/>
            </div>
            <div class="form-group">
                Agency Name
                <input name="mouAgencyName" class="form-control" placeholder="Enter Agency Name" required/>
            </div>
            <div class="form-group mb-3">
                <label for="formFile" class="form-label">File</label>
                <input name="mouFile" class="form-control" type="file" id="formFile" required>
            </div>
            <div class="text-center d-grid gap-2">
                <input type="submit" value="Add MOU" name="ntbtnadd" class="btn btn-lg btn-primary"/>
            </div>
        </form>
    </div>
</div>

<%@ include file="../footer.jsp"%>
