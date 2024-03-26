<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<%
if(request.getParameter("eid")!=null){
	  db.executeSql("delete from teachingfaculty where TeacherID=?", request.getParameter("eid"));
	}
%>

<div class="mt-2 mb-2 d-flex flex-row-reverse">
    <a class="btn btn-primary pr-5" href="/College_Managment_System/Admin/AddTeachingFaculty.jsp">Add Teaching Faculty</a>
</div>
<div class="col-10 offset-1">
    <br/>
    <h1>Teaching Faculty List:</h1>
    <table id="table1" class="table table-bordered">
        <thead class="table-dark">
        <tr class="bg-primary">
        <th>Profile Photo</th>
            <th>TeacherID</th>
            <th>Teacher Name</th>
            <th>Teacher Qualification</th>
            <th>Subjects</th>
             <th>LinkedIn</th>
            <th>Delete</th>
        </tr>
        </thead>
        <tbody>
        <%
        ResultSet rs = db.getRows("SELECT * FROM teachingfaculty");
        while(rs.next()){
        %>
        <tr>
        <td>
   <img src="/College_Managment_System/FacultyFiles/<%=rs.getString(7)%>" style="height: 100px;" class="img-fluid rounded-start w-auto" alt="Teacher Profile Photo">
		</td>
            <td><%= rs.getString(2) %></td>
            <td><%= rs.getString(3) %></td>
            <td><%= rs.getString(4) %></td>
            <td><%= rs.getString(5) %></td>
           	 <td>
    <a href="<%=rs.getString(6) %>" class="btn btn-info">LinkedIn</a>
			</td>
            <td class="d-flex text-center">
                <a href="?eid=<%= rs.getString(2) %>" onclick="return confirm('Do you want to delete this record?');" class="btn btn-danger">Delete</a>
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
