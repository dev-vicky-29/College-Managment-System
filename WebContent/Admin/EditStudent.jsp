<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@ include file="../header.jsp"%>

<%
// Check if form is submitted
if ("POST".equalsIgnoreCase(request.getMethod())) {
    // Retrieve form data
    String studentID = request.getParameter("studentID");
    String rollNumber = request.getParameter("rollNumber");
    String batch = request.getParameter("batch");
    String studentName = request.getParameter("studentName");
    String email = request.getParameter("email");
    String phoneNumber = request.getParameter("phoneNumber");
    String classValue = request.getParameter("class");

    // Update student details in the database
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/collegedb", "root", "VICK2909");
        PreparedStatement pstmt = conn.prepareStatement("UPDATE studentlogin SET RollNumber=?, Batch=?, StudentName=?, EmailID=?, PhoneNumber=?, Class=? WHERE ID=?");
        pstmt.setString(1, rollNumber);
        pstmt.setString(2, batch);
        pstmt.setString(3, studentName);
        pstmt.setString(4, email);
        pstmt.setString(5, phoneNumber);
        pstmt.setString(6, classValue);
        pstmt.setString(7, studentID);

        int rowsAffected = pstmt.executeUpdate();

        // Display appropriate message based on update result
        if (rowsAffected > 0) {
%>
            <div class="alert alert-success" role="alert">
                Student details updated successfully!
            </div>
<%
        } else {
%>
            <div class="alert alert-danger" role="alert">
                Failed to update student details!
            </div>
<%
        }

        // Close resources
        pstmt.close();
        conn.close();
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
        // Handle database error
%>
        <div class="alert alert-danger" role="alert">
            Database error: <%= e.getMessage() %>
        </div>
<%
    }
}

// Fetch student details from the database using the studentID
String studentID = request.getParameter("id");
ResultSet rs = db.getRows("SELECT * FROM studentlogin WHERE ID=?", studentID);
if (rs.next()) {
    // Extract student details from the result set
    String prn = rs.getString("PRN");
    String rollNumber = rs.getString("RollNumber");
    String batch = rs.getString("Batch");
    String studentName = rs.getString("StudentName");
    String email = rs.getString("EmailID");
    String phoneNumber = rs.getString("PhoneNumber");
    String classValue = rs.getString("Class");

    // Display the form pre-filled with student details for editing
%>
<div class="mt-2 mb-2 d-flex flex-row-reverse">
    <a class="btn btn-primary pr-5" href="/College_Managment_System/Admin/StudentList.jsp">Back</a>
</div>
<div class="col-6 offset-3">
    <br/>
    
    <form action="" method="post" class="form custom-border mt-8 rounded">
    <h1 class="text-center">Edit Student</h1>
        <input type="hidden" name="studentID" value="<%= studentID %>">
        <div class="form-group">
            <label for="prn">Student PRN:</label>
            <input type="text" class="form-control" id="prn" name="prn" value="<%= prn %>" readonly>
        </div>
        <div class="form-group">
            <label for="rollNumber">Roll Number:</label>
            <input type="text" class="form-control" id="rollNumber" name="rollNumber" value="<%= rollNumber %>" required>
        </div>
        <div class="form-group">
            <label for="batch">Batch:</label>
            <input type="text" class="form-control" id="batch" name="batch" value="<%= batch %>" required>
        </div>
        <div class="form-group">
            <label for="studentName">Student Name:</label>
            <input type="text" class="form-control" id="studentName" name="studentName" value="<%= studentName %>" required>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" class="form-control" id="email" name="email" value="<%= email %>" required>
        </div>
        <div class="form-group">
            <label for="phoneNumber">Phone Number:</label>
            <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" value="<%= phoneNumber %>" required>
        </div>
        <div class="form-group">
            <label for="class">Class:</label>
            <input type="text" class="form-control" id="class" name="class" value="<%= classValue %>" required>
        </div>
        <hr>
         <div class="text-center d-grid gap-2">
        <button type="submit" class="btn btn-primary">Update</button>
        </div>
    </form>
</div>
<%
} else {
%>
<div class="alert alert-danger" role="alert">
    Student ID <%= studentID %> not found!
</div>
<%
}
%>

<%@ include file="../footer.jsp"%>
