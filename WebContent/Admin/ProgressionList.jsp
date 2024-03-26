<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<%
if(request.getParameter("eid")!=null){
	  db.executeSql("delete from Progression where Sr.No=?", request.getParameter("eid"));
	}
%>

<div class="mt-2 mb-2 d-flex flex-row-reverse">
    <a class="btn btn-primary pr-5" href="/College_Managment_System/Admin/StudentProgression.jsp">Back</a>
    <a class="btn btn-primary pr-5" href="/College_Managment_System/Admin/AddStudentProgression.jsp">Add Progression</a>
</div>
<div class="col-10 offset-1">
    <br/>
    <h1>Student Progression List:</h1>
    <table id="table1" class="table table-bordered">
        <thead class="table-dark">
        <tr class="bg-primary">
        <th>Sr.No.</th>           
            <th>Year</th>
            <th>No. Of Student</th>
            <th>File</th>
            <th>Delete</th>
        </tr>
        </thead>
        <tbody>
        <%
        ResultSet rs = db.getRows("SELECT * FROM Progression");
        while(rs.next()){
        %>
        <tr>
            <td><%= rs.getString(1) %></td>
            <td><%= rs.getString(2) %></td>
            <td><%= rs.getString(3) %></td>
            <td><%= rs.getString(4) %></td>
            <td><a href="/College_Managment_System/PDFFILES/<%=rs.getString(5)%>" class="btn btn-info">View</a></td>
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
