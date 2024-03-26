<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<br>
<div class="col-10 offset-1">
    <br/>
    <h1>IMP Links:</h1>
    <table id="table1" class="table table-bordered">
        <thead class="table-dark">
        <tr class="bg-primary">
        
            <th>Name</th>
            <th>URL</th>
        </tr>
        </thead>
        <tbody>
        <%
        ResultSet rs = db.getRows("SELECT * FROM implinks");
        while(rs.next()){
        %>
        <tr>
            
            <td><%= rs.getString(2) %></td>
            
            <td><a href="<%=rs.getString(3) %>" class="btn btn-info">Click Here</a></td>
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

