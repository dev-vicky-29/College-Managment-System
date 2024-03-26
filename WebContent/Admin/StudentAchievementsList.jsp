<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<%
if(request.getParameter("eid")!=null){
	  db.executeSql("delete from studentsachievements where SrNo=?", request.getParameter("eid"));
	}
%>

<div class="mt-2 mb-2 d-flex flex-row-reverse">
    <a class="btn btn-primary pr-5" href="/College_Managment_System/Admin/AddStudentAchievements.jsp">Add Students Achievements</a>
</div>
<div class="col-10 offset-1">
    <br/>
    <h1>Students Achievements List:</h1>
    <table id="table1" class="table table-bordered">
        <thead class="table-dark">
        <tr class="bg-primary">
 <th>Sr.No.</th>
            <th>Name</th>
            <th>Date</th>
            <th>Type</th>
            <th>Title</th>
            <th>Description</th>
             <th>Action</th>
             
        </tr>
        </thead>
        <tbody>
        <%
        ResultSet rs = db.getRows("SELECT * FROM studentsachievements");
        while(rs.next()){
        %>
        <tr>
            <td><%= rs.getString(1) %></td>
            <td><%= rs.getString(2) %></td>
            <td><%= rs.getString(3) %></td>
            <td><%= rs.getString(4) %></td>
            <td><%= rs.getString(5) %></td>
            <td><%= rs.getString(6) %></td>
            <td class="d-flex text-center">
            	<a href="/College_Managment_System/PDFFILES/<%=rs.getString(7)%>" class="btn btn-info">View</a>
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
