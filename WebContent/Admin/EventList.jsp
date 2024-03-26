<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<%
if(request.getParameter("eid")!=null){
	  db.executeSql("delete from event where EventID=?", request.getParameter("eid"));
	}
%>

<div class="mt-2 mb-2 d-flex flex-row-reverse">
    <a class="btn btn-primary pr-5" href="/College_Managment_System/Admin/AddEvent.jsp">Add Event</a>
</div>
<div class="col-10 offset-1">
    <br/>
    <h1>Event List:</h1>
    <table id="table1" class="table table-bordered">
        <thead class="table-dark">
        <tr class="bg-primary">
            <th>Event ID</th>
            <th>Event Name</th>
            <th>Event Link</th>
            <th>Delete</th>
        </tr>
        </thead>
        <tbody>
        <%
        ResultSet rs = db.getRows("SELECT * FROM event");
        while(rs.next()){
        %>
        <tr>
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
