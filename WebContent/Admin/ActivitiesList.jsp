<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<%
if(request.getParameter("eid")!=null){
    db.executeSql("delete from activities where ID=?", request.getParameter("eid"));
}
%>

<div class="mt-2 mb-2 d-flex flex-row-reverse">
    <a class="btn btn-primary pr-5" href="/College_Managment_System/Admin/AddActivities.jsp">Add Activity</a>
</div>
<div class="col-10 offset-1">
    <br/>
    <h1>Activities List:</h1>
    <table id="table1" class="table table-bordered">
        <thead class="table-dark">
            <tr class="bg-primary">
                <th>ID</th>
                <th>Date</th>
                <th>ActivityType</th>
                <th>Level</th>
                <th>Title</th>
                <th>Students</th>
                <th>PDF</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
        <%
        ResultSet rs = db.getRows("SELECT * FROM activities");
        while(rs.next()){
        %>
        <tr>
            <td><%= rs.getString("ID") %></td>
            <td><%= rs.getString("Date") %></td>
            <td><%= rs.getString("ActivityType") %></td>
            <td><%= rs.getString("Level") %></td>
            <td><%= rs.getString("Title") %></td>
            <td><%= rs.getString("Students") %></td>
            <td><a href="/College_Managment_System/PDFFILES/<%=rs.getString("PDF")%>" class="btn btn-info">View</a></td>
            <td class="d-flex text-center">
                <a href="?eid=<%= rs.getString("ID") %>" onclick="return confirm('Do you want to delete this record?');" class="btn btn-danger">Delete</a>
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
