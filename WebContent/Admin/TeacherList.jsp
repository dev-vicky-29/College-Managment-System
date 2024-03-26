<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<%
if(request.getParameter("tid")!=null){
    db.executeSql("DELETE FROM teacherlogin WHERE TeacherID=?", request.getParameter("tid"));
}
%>

<div class="mt-2 mb-2 d-flex flex-row-reverse">
    <a class="btn btn-primary pr-5" href="/College_Managment_System/Admin/TeacherList.jsp">Back</a>
</div>
<div class="col-10 offset-1">
    <br/>
    <h1>Teacher List:</h1>
    <table id="teacherTable" class="table table-bordered">
        <thead class="table-dark">
        <tr class="bg-primary">
            <th>Teacher ID</th>
            <th>Teacher Name</th>
            <th>Email</th>
            <th>Number</th>
            <th>Action</th>
            
        </tr>
        </thead>
        <tbody>
        <%
        ResultSet rs = db.getRows("SELECT * FROM teacherlogin");
        while(rs.next()){
        %>
        <tr>
            <td><%= rs.getString("TeacherID") %></td>
            <td><%= rs.getString("TeacherName") %></td>
            <td><%= rs.getString("EmailID") %></td>
            <td><%= rs.getString("Number") %></td>
            <td class="d-flex text-center justify-content-between">
                <a href="/College_Managment_System/Admin/EditTeacher.jsp?id=<%= rs.getString("TeacherID") %>" class="btn btn-primary">Edit</a>
            
                <a href="?tid=<%= rs.getString("TeacherID") %>" onclick="return confirm('Do you want to delete this record?');" class="btn btn-danger">Delete</a>
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
        $("#teacherTable").DataTable(); // Apply DataTable library on Table with ID teacherTable
    });
</script>
