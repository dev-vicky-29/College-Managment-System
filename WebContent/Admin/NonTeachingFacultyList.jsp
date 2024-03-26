<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<%
if(request.getParameter("eid")!=null){
	  db.executeSql("delete from nonteachingfaculty where SupportStaffID=?", request.getParameter("eid"));
	}
%>

<div class="mt-2 mb-2 d-flex flex-row-reverse">
    <a class="btn btn-primary pr-5" href="/College_Managment_System/Admin/AddNonTeachingFaculty.jsp">Add Non-Teaching Faculty</a>
</div>
<div class="col-10 offset-1">
    <br/>
    <h1>Non-Teaching Faculty List:</h1>
    <table id="table1" class="table table-bordered">
        <thead class="table-dark">
        <tr class="bg-primary">
        <th>Profile Photo</th>
            <th>Support Staff ID</th>
            <th>Support Staff Name</th>
            <th>Qualification</th>
            <th>Delete</th>
        </tr>
        </thead>
        <tbody>
        <%
        ResultSet rs = db.getRows("SELECT * FROM nonteachingfaculty");
        while(rs.next()){
        %>
        <tr>
        <td>
   <img src="/College_Managment_System/NonTeachingFacultyFiles/<%=rs.getString(4)%>" style="height: 100px;" class="img-fluid rounded-start w-auto" alt="Support Staff Profile Photo">
		</td>
            <td><%= rs.getString(1) %></td>
            <td><%= rs.getString(2) %></td>
            <td><%= rs.getString(3) %></td>
            <td class="d-flex text-center">
                <a href="?eid=<%= rs.getString(1) %>" onclick="return confirm('Do you want to delete this record?');" class="btn btn-danger">Delete</a>
            </td>
        </tr>
        <%
        }
        %>
        </tbody>
    </table>
</div>
<%@ include file="../footer.jsp"%>
<script>
    $(function(){
        $("#table1").DataTable(); // Apply DataTable library on Table whose ID is table1
    });
</script>
