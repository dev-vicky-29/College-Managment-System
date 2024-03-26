<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<br><hr>
<div class="container">
<h3 class="text-center">Add Academic Calendar</h3>
<div class="text-center">
<a type="button" class="btn btn-primary btn-lg " href="/College_Managment_System/Admin/AddAcademicCalendar.jsp">Click Here</a>
</div>
</div>

<hr>
<div class="col-10 offset-1">
    <br/>
    <h1>Academic Calendar:</h1>
    <table id="table1" class="table table-bordered">
        <thead class="table-dark">
        <tr class="bg-primary">
        <th>Sr.No.</th>
            <th>Title</th>
            <th>Year</th>
            <th>File</th>
        </tr>
        </thead>
        <tbody>
        <%
        ResultSet rs = db.getRows("SELECT * FROM academiccalendar");
        while(rs.next()){
        %>
        <tr>
            <td><%= rs.getString(1) %></td>
            <td><%= rs.getString(2) %></td>
            <td><%= rs.getString(3) %></td>
            <td><a href="/College_Managment_System/AcademicCalendar/<%=rs.getString(4)%>" class="btn btn-info">View</a></td>
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
