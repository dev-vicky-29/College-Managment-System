<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<%
String  EventName="", EventLink="";

if(request.getParameter("btninsert")!=null){ 
   
    EventName=request.getParameter("EName");
    EventLink=request.getParameter("ELink");
    
    // Check if the IMP Link already exists
    ResultSet rs = db.getRows("SELECT * FROM implinks WHERE LinkName=?", EventName);
    if(rs.next()) {
        errorMsg = "IMP Link with Name " + EventName + " already exists.";
    } else {
        // If the event ID doesn't exist, insert the new record
        db.executeSql("INSERT INTO implinks ( LinkName, LinkUrl) VALUES ( ?, ?)", EventName, EventLink);
        successMsg = EventName + " IMP Link Is Added";
    }
}
%>
<div class="mt-2 mb-2  d-flex flex-row-reverse">
    <a class="btn btn-primary pr-5" href="/College_Managment_System/Student/IMPLinkList.jsp">IMP Link List</a>
</div>
<div class="container mt-1">
  <form method="post" id="Form1">
    <div class="row justify-content-center">
 <div class="col-md-6 custom-border rounded">
   <h2 class="text-center">Add IMP Link Form</h2> <hr/>
            
            <div class="form-group">
               IMP Link Name
                <input name="EName" id="txtname"  class="form-control" value="<%=EventName%>" placeholder="Enter IMP Link Name" required/>
            </div>
            <div class="form-group">
                IMP Link Url
                <input name="ELink" class="form-control" value="<%=EventLink%>" placeholder="Enter  Valid Link" required/>
            </div> <br><br>
            <div class="text-center d-grid gap-2">
                <input type="submit" value="Add IMP Link" name="btninsert" class="btn btn-lg btn-primary"/>
            </div>
            </div>
            </div>
        </form>
    </div>

<br><br><br><br>
<%@ include file="../footer.jsp"%>

