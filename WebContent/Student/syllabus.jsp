<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<!-- Syllabus Page Specific Contents -->
<div class="container mt-3 table-responsive">
    <table class="table table-bordered border-primary table-striped table-hover caption-top">
        <caption class="fw-bolder">Syllabus Of BSC(Entire) & BSC Optional</caption>
        <thead class="table-dark text-center">
            <tr>
                <th>Sr.No.</th>
                <th>Title</th>
                <th>Class</th>
                <th>Links</th>
            </tr>
        </thead>
        <%
            ResultSet rs=db.getRows("select * from syllabus");
            while(rs.next()){
        %>
        <tbody>
            <tr>
                <td><%=rs.getString(1) %></td>
                <td><%=rs.getString(2) %></td>
                <td><%=rs.getString(3) %></td>
                <td class="d-flex justify-content-between">
                    <a href="/College_Managment_System/SyllabusFiles/<%=rs.getString(4)%>" class="btn btn-outline-info">View</a>
                      </td>
            </tr>
        </tbody>
        <%
            }
        %>
    </table>
</div>

<%@ include file="../footer.jsp"%>