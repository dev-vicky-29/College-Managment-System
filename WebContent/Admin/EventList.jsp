<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>

<div class="mt-2 mb-2  d-flex flex-row-reverse">
		<a class="btn btn-primary pr-5" href="/College_Managment_System/Admin/AddEvent.jsp">Add Event</a>
</div>
<div class="container">
<table class="table table-bordered">
<tr class="bg-primary text-white">
<th>Event ID</th>
<th>Event Name</th>
<th>Event Link</th>
<th>Delete & Edit</th>
</tr>

<%
DataAccess obj=new DataAccess();
ResultSet rs=obj.getRows("select * from event");
while(rs.next()){  //boolean next() ==> true if record exits otherwise false
out.println("<tr>");
out.println("<td>");
out.println(rs.getString(1));
out.println("</td>");
out.println("<td>");
out.println(rs.getString(2));
out.println("</td>");
out.println("<td>");
out.println(rs.getString(3));
out.println("</td>");
%>
<td>
<div class="mt-2 mb-2 d-flex justify-content-center">
<input Type="submit" value="Edit" name="btnedit" class="btn btn-sm btn-primary"/>
<input Type="submit" value="Delete" name="btnedit" class="btn btn-sm btn-primary"/>
</div>
</td>
<%
out.println("</tr>");	
}
%>

</table>
</div>

<%@ include file="../footer.jsp"%>