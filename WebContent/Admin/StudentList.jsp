<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>

<%
    if (request.getParameter("sid") != null) {
        db.executeSql("DELETE FROM studentlogin WHERE ID=?", request.getParameter("sid"));
    }
%>

<div class="mt-2 mb-2 d-flex flex-row-reverse">
    <a class="btn btn-primary pr-5" href="/College_Managment_System/Admin/AddStudent.jsp">Add Student</a>
</div>

<div class="col-10 offset-1">
    <br/>
    <h1>Student List:</h1>
    <table id="studentTable" class="table table-bordered">
        <thead class="table-dark">
            <tr class="bg-primary">
                <th>Student PRN</th>
                <th>Roll Number</th>
                <th>Batch</th>
                <th>Student Name</th>
                <th>Email</th>
                <th>Phone Number</th>
                <th>Class</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%
                ResultSet rs = db.getRows("SELECT * FROM studentlogin");
                while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("PRN") %></td>
                <td><%= rs.getString("RollNumber") %></td>
                <td><%= rs.getString("Batch") %></td>
                <td><%= rs.getString("StudentName") %></td>
                <td><%= rs.getString("EmailID") %></td>
                <td><%= rs.getString("PhoneNumber") %></td>
                <td><%= rs.getString("Class") %></td>
                <td class="d-flex text-center justify-content-between">
                    <a href="/College_Managment_System/Admin/EditStudent.jsp?id=<%= rs.getString("ID") %>" class="btn btn-primary">Edit</a>
                    <a href="?sid=<%= rs.getString("ID") %>" onclick="return confirm('Do you want to delete this record?');" class="btn btn-danger">Delete</a>
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
    $(function () {
        $("#studentTable").DataTable(); // Apply DataTable library on Table with ID studentTable
    });
</script>
