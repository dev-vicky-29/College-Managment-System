<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<%
String NoticeID="", NoticeName="", NoticeLink="";

if(request.getParameter("btninsert")!=null){ 
	NoticeID=request.getParameter("EId");
	NoticeName=request.getParameter("EName");
	NoticeLink=request.getParameter("ELink");
    
    // Check if the event ID already exists
    ResultSet rs = db.getRows("SELECT * FROM notice WHERE NoticeID=?", NoticeID);
    if(rs.next()) {
        errorMsg = "Event with ID " + NoticeID + " already exists.";
    } else {
        // If the event ID doesn't exist, insert the new record
        db.executeSql("INSERT INTO notice VALUES (?, ?, ?)", NoticeID, NoticeName, NoticeLink);
        successMsg = NoticeName + " Event Is Added";
    }
}
%>
<div class="mt-2 mb-2  d-flex flex-row-reverse">
    <a class="btn btn-primary pr-5" href="/College_Managment_System/Admin/NoticeList.jsp">Notice List</a>
</div>
<div class="container mt-1">
  <form method="post" id="Form1">
    <div class="row justify-content-center">
 <div class="col-md-6 custom-border rounded">
   <h2 class="text-center">Add Notice Form</h2> <hr/>
            <div class="form-group">
                Notice ID
                <input name="EId" id="txtid" class="form-control" autofocus value="<%=NoticeID%>" placeholder="Enter Notice ID"/>
            </div>
            <div class="form-group">
                Notice Name
                <input name="EName" id="txtname"  class="form-control" value="<%=NoticeName%>" placeholder="Enter Notice Name"/>
            </div>
            <div class="form-group">
                Notice Link
                <input name="ELink" class="form-control" value="<%=NoticeLink%>" placeholder="Enter Notice Valid Link"/>
            </div> <br> <br>
           <div class="text-center d-grid gap-2">
                <input type="submit" value="Add Notice" name="btninsert" class="btn btn-lg btn-primary"/>
            </div>
            </div>
            </div>
        </form>
    </div>

<br><br><br><br>
<%@ include file="../footer.jsp"%>

<script>
$(function(){
    $("#Form1").validate({
        rules: {
            'EId': {
                required: true
            },
            'EName': {
                required: true
            }
        },
        messages: {
            'EId': {
                required: "Notice ID is Required"
            },
            'EName': {
                required: "Notice Name is Required"
            }
        }
    });
});
</script>