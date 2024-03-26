<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<br>
<div class="col-10 offset-1">
    <br/>
    <h1>Student Progression:</h1>
    <table id="table1" class="table table-bordered">
        <thead class="table-dark">
        <tr class="bg-primary">
        <th>Sr.No.</th>
            <th>Year</th>
            <th>No. Of Student</th>
            <th>File</th>
        </tr>
        </thead>
        <tbody>
        <%
        ResultSet rs = db.getRows("SELECT * FROM  Progression");
        while(rs.next()){
        %>
        <tr>
            <td><%= rs.getString(1) %></td>
            <td><%= rs.getString(2) %></td>
            <td><%= rs.getString(3) %></td>
            
            <td><a href="/College_Managment_System/PDFFILES/<%=rs.getString(4)%>" class="btn btn-info">View</a></td>
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

