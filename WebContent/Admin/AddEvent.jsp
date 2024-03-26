<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<%
String EventID="", EventName="", EventLink="";

if(request.getParameter("btninsert")!=null){ 
    EventID=request.getParameter("EId");
    EventName=request.getParameter("EName");
    EventLink=request.getParameter("ELink");
    
    // Check if the event ID already exists
    ResultSet rs = db.getRows("SELECT * FROM event WHERE EventID=?", EventID);
    if(rs.next()) {
        errorMsg = "Event with ID " + EventID + " already exists.";
    } else {
        // If the event ID doesn't exist, insert the new record
        db.executeSql("INSERT INTO event VALUES (?, ?, ?)", EventID, EventName, EventLink);
        successMsg = EventName + " Event Is Added";
    }
}
%>
<div class="mt-2 mb-2  d-flex flex-row-reverse">
    <a class="btn btn-primary pr-5" href="/College_Managment_System/Admin/EventList.jsp">Event List</a>
</div>
<div class="container mt-1">
  <form method="post" id="Form1">
    <div class="row justify-content-center">
 <div class="col-md-6 custom-border rounded">
   <h2 class="text-center">Add Event Form</h2> <hr/>
            <div class="form-group">
                Event ID
                <input name="EId" id="txtid" class="form-control" autofocus value="<%=EventID%>" placeholder="Enter Event ID"/>
            </div>
            <div class="form-group">
                Event Name
                <input name="EName" id="txtname"  class="form-control" value="<%=EventName%>" placeholder="Enter Event Name"/>
            </div>
            <div class="form-group">
                Event Link
                <input name="ELink" class="form-control" value="<%=EventLink%>" placeholder="Enter Event Valid Link"/>
            </div> <br><br>
            <div class="text-center d-grid gap-2">
                <input type="submit" value="Add Event" name="btninsert" class="btn btn-lg btn-primary"/>
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
                required: "Event ID is Required"
            },
            'EName': {
                required: "Event Name is Required"
            }
        }
    });
});
</script>