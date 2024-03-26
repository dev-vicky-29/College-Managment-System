<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<%
// Check if form is submitted
if ("POST".equalsIgnoreCase(request.getMethod())) {
    // Retrieve form data
    String teacherID = request.getParameter("teacherID");
    String teacherName = request.getParameter("teacherName");
    String email = request.getParameter("email");
    String number = request.getParameter("number");

    // Update teacher details in the database
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/collegedb", "root", "VICK2909");
        PreparedStatement pstmt = conn.prepareStatement("UPDATE teacherlogin SET TeacherName=?, EmailID=?, Number=? WHERE TeacherID=?");
        pstmt.setString(1, teacherName);
        pstmt.setString(2, email);
        pstmt.setString(3, number);
        pstmt.setString(4, teacherID);

        int rowsAffected = pstmt.executeUpdate();

        // Display appropriate message based on update result
        if (rowsAffected > 0) {
%>
            <div class="alert alert-success" role="alert">
                Teacher details updated successfully!
            </div>
<%
        } else {
%>
            <div class="alert alert-danger" role="alert">
                Failed to update teacher details!
            </div>
<%
        }

        // Close resources
        pstmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
        // Handle database error
%>
        <div class="alert alert-danger" role="alert">
            Database error: <%= e.getMessage() %>
        </div>
<%
    }
}

// Fetch teacher details from the database using the teacherID
String teacherID = request.getParameter("id");
ResultSet rs = db.getRows("SELECT * FROM teacherlogin WHERE TeacherID=?", teacherID);
if (rs.next()) {
    // Extract teacher details from the result set
    String teacherName = rs.getString("TeacherName");
    String email = rs.getString("EmailID");
    String number = rs.getString("Number");
%>
<div class="mt-2 mb-2 d-flex flex-row-reverse">
    <a class="btn btn-primary pr-5" href="/College_Managment_System/Admin/TeacherList.jsp">Back</a>
</div>
<div class="col-6 offset-3">
    <br/>
    
    <form action="" method="post" class="form custom-border mt-8 rounded">
    <h1 class="text-center">Edit Teacher</h1>
        <input type="hidden" name="teacherID" value="<%= teacherID %>">
        <div class="form-group">
            <label for="teacherName">Teacher Name:</label>
            <input type="text" class="form-control" id="teacherName" name="teacherName" value="<%= teacherName %>" required>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" class="form-control" id="email" name="email" value="<%= email %>" required>
        </div>
        <div class="form-group">
            <label for="number">Number:</label>
            <input type="text" class="form-control" id="number" name="number" value="<%= number %>" required>
        </div> <br> <hr> 
         <div class="text-center d-grid gap-2">
        <button type="submit" class="btn btn-primary">Update</button>
        </div>
    </form>
</div>
<%
} else {
%>
<div class="alert alert-danger" role="alert">
    Teacher ID <%= teacherID %> not found!
</div>
<%
}
%>

<%@ include file="../footer.jsp"%>
