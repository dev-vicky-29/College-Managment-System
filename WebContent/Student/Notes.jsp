<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>

<br>

<div class="col-10 offset-1">
    <br/>
    <h1>Notes:</h1>
    <table id="notesTable" class="table table-bordered">
        <thead class="table-dark">
            <tr class="bg-primary">
                <th>ID</th>
                <th>Class</th>
                <th>Subject</th>
                <th>Teacher Name</th>
                <th>Date</th>
                <th>File</th>
                
            </tr>
        </thead>
        <tbody>
            <% 
            ResultSet rs = db.getRows("SELECT * FROM Notes");
            while(rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("ID") %></td>
                <td><%= rs.getString("Class") %></td>
                <td><%= rs.getString("Subject") %></td>
                <td><%= rs.getString("TeacherName") %></td>
                <td><%= rs.getString("Date") %></td>
                <td>
                    <a href="/College_Managment_System/NotesFiles/<%= rs.getString("File") %>" class="btn btn-info" target="_blank">View</a>
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
        $("#notesTable").DataTable(); // Apply DataTable library on Table whose ID is notesTable
    });
</script>
