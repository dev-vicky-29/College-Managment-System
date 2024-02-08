<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<!-- Add Notice & Announcement Page Specific Contents -->

<%
String NoticeID="", NoticeName="", NoticeLink="";
if(request.getParameter("btninsert")!=null){ //Insert Button Clicked
	NoticeID=request.getParameter("NId");
	NoticeName=request.getParameter("NName");
	NoticeLink=request.getParameter("NLink");
	db.executeSql("insert into notice values(?,?,?)", NoticeID,NoticeName,NoticeLink); //This Line For Insert Record Into Database Student table	
	successMsg=NoticeName+" Notice Is Added";
}
if(request.getParameter("btnfind")!=null){ //Find Button Clicked
	NoticeID=request.getParameter("NId");
	
	ResultSet rs= db.getRows("select * From notice where NoticeID=?", NoticeID); //This Line For Find Event Info Database Student table	
	if(rs.next()){
		NoticeName=rs.getString(2);
		NoticeLink=rs.getString(3);	
	} else {
          // Handle the case when no record is found
          errorMsg = "No record found for Notice ID: " + NoticeID;
      }
}
if(request.getParameter("btnupdate")!=null){ //Update Button Clicked
	NoticeID=request.getParameter("NId");
	NoticeName=request.getParameter("NName");
	NoticeLink=request.getParameter("NLink");
	db.executeSql("update notice set NoticeName=?,NoticeLink=? where NoticeID=?", NoticeName,NoticeLink,NoticeID); //This Line For Update Record Into Database Student table	
	successMsg="Notice Is Updated";
}
if(request.getParameter("btndelete")!=null){ //Delete Button Clicked
	NoticeID=request.getParameter("NId");
	db.executeSql("Delete From notice where NoticeID=?", NoticeID); //This Line For Delete Record From Database Student table	
	successMsg=NoticeName+" Notice Is Deleted";
}
%>
<div class="mt-2 mb-2  d-flex flex-row-reverse">
		<a class="btn btn-primary pr-5" href="/College_Managment_System/Admin/NoticeList.jsp">Notice List</a>
</div>
<div class="card mt-5 col-7 offset-2">
<div class="card-header bg-primary text-white">
<h4>Add Notice & Announcement Form</h4>
</div>
<div class="card-body">
<!-- HTML FORM -->
<form action="">
<div class="form-group">
Notice ID
<input name="NId" class="form-control" autofocus value="<%=NoticeID%>" placeholder="Enter Notice ID"/> <!-- Form Row -->
</div>
<div class="form-group">
Notice Name
<input name="NName" class="form-control" value="<%=NoticeName%>" placeholder="Enter Notice Name"/> <!-- Form Row -->
</div>
<div class="form-group">
Notice Link
<input name="NLink" class="form-control" value="<%=NoticeLink%>" placeholder="Enter Notice Valid Link"/> <!-- Form Row -->
</div>
<div class="mt-2 mb-5 d-flex justify-content-between">
<input Type="submit" value="Add Notice" name="btninsert" class="btn btn-primary"/>
<input Type="submit" value="Update Notice" name="btnupdate" class="btn btn-secondary"/>
<input Type="submit" value="Find Notice" name="btnfind" class="btn btn-info"/>
<input Type="submit" value="Delete Notice" name="btndelete" class="btn btn-danger"/>
</div>
</form>
</div>
</div>	
<br><br><br><br><br>
<%@ include file="../footer.jsp"%>