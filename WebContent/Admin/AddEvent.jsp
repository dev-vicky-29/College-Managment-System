<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<!-- Add Event Page Specific Contents -->

<%
String EventID="", EventName="", EventLink="";
if(request.getParameter("btninsert")!=null){ //Insert Button Clicked
	EventID=request.getParameter("EId");
	EventName=request.getParameter("EName");
	EventLink=request.getParameter("ELink");
	db.executeSql("insert into event values(?,?,?)", EventID,EventName,EventLink); //This Line For Insert Record Into Database Student table	
	successMsg=EventName+" Event Is Added";
}
if(request.getParameter("btnfind")!=null){ //Find Button Clicked
	EventID=request.getParameter("EId");
	
	ResultSet rs= db.getRows("select * From event where EventID=?", EventID); //This Line For Find Event Info Database Student table	
	if(rs.next()){
		EventName=rs.getString(2);
		EventLink=rs.getString(3);	
	} else {
          // Handle the case when no record is found
          errorMsg = "No record found for Event ID: " + EventID;
      }
}
if(request.getParameter("btnupdate")!=null){ //Update Button Clicked
	EventID=request.getParameter("EId");
	EventName=request.getParameter("EName");
	EventLink=request.getParameter("ELink");
	db.executeSql("update event set EventName=?,EventLink=? where EventID=?", EventName,EventLink,EventID); //This Line For Update Record Into Database Student table	
	successMsg="Event Is Updated";
}
if(request.getParameter("btndelete")!=null){ //Delete Button Clicked
	EventID=request.getParameter("EId");
	db.executeSql("Delete From event where EventID=?", EventID); //This Line For Delete Record From Database Student table	
	successMsg=EventName+" Event Is Deleted";
}
%>
<div class="mt-2 mb-2  d-flex flex-row-reverse">
		<a class="btn btn-primary pr-5" href="/College_Managment_System/Admin/EventList.jsp">Event List</a>
</div>
<div class="card mt-5 col-7 offset-2">
<div class="card-header bg-primary text-white">
<h4>Add Event Form</h4>
</div>
<div class="card-body">
<!-- HTML FORM -->
<form action="">
<div class="form-group">
Event ID
<input name="EId" class="form-control" autofocus value="<%=EventID%>" placeholder="Enter Event ID"/> <!-- Form Row -->
</div>
<div class="form-group">
Event Name
<input name="EName" class="form-control" value="<%=EventName%>" placeholder="Enter Event Name"/> <!-- Form Row -->
</div>
<div class="form-group">
Event Link
<input name="ELink" class="form-control" value="<%=EventLink%>" placeholder="Enter Event Valid Link"/> <!-- Form Row -->
</div>
<div class="mt-2 mb-2 d-flex justify-content-center">
<input Type="submit" value="Add Event" name="btninsert" class="btn btn-lg btn-primary"/>
</div>
</form>
</div>
</div>	
<br><br><br><br><br>
<%@ include file="../footer.jsp"%>