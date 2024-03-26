<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<%
String eid = (String) session.getAttribute("eid");
ResultSet rs = db.getRows("SELECT * from teachingfaculty");

String teacherId = "";
String teacherName = "";
String teacherQualification = "";
String subjects = "";
String linkedIn = "";
String teacherProfilePhoto = "";
String teacherResume = "";

if (rs.next()) {
    teacherId = rs.getString("ID");
    teacherName = rs.getString("TeacherName");
    teacherQualification = rs.getString("TeacherQualification");
    subjects = rs.getString("Subjects");
    linkedIn = rs.getString("LinkedIn");
    teacherProfilePhoto = rs.getString("TeacherProfilePhoto");
    teacherResume = rs.getString("TeacherResume");
}

if (request.getParameter("btnupdate") != null) {
    teacherName = request.getParameter("teacherName");
    teacherQualification = request.getParameter("teacherQualification");
    subjects = request.getParameter("subjects");
    linkedIn = request.getParameter("linkedIn");
    teacherProfilePhoto = request.getParameter("teacherProfilePhoto");
    teacherResume = request.getParameter("teacherResume");

    if (teacherName.isEmpty() || teacherQualification.isEmpty() || subjects.isEmpty() || linkedIn.isEmpty() || teacherProfilePhoto.isEmpty() || teacherResume.isEmpty()) {
        errorMsg = "All fields are required";
    } else {
        int rowsAffected = db.executeSql("UPDATE teachingfaculty SET TeacherName=?, TeacherQualification=?, Subjects=?, LinkedIn=?, TeacherProfilePhoto=?, TeacherResume=? WHERE ID=?", teacherName, teacherQualification, subjects, linkedIn, teacherProfilePhoto, teacherResume, teacherId);

        if (rowsAffected > 0) {
            successMsg = teacherId + " Record Updated Successfully";
        } else {
            errorMsg = "Failed to update record";
        }
    }
}

// Get categories from the database
ResultSet categories = db.getRows("SELECT * FROM category");
%>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <h2 class="mb-4">Edit Teacher</h2>
            <% if (!errorMsg.isEmpty()) { %>
                <div class="alert alert-danger" role="alert">
                    <%= errorMsg %>
                </div>
            <% } else if (!successMsg.isEmpty()) { %>
                <div class="alert alert-success" role="alert">
                    <%= successMsg %>
                </div>
            <% } %>
            <form method="post">
                <div class="form-group">
                    <label for="teacherId">Teacher ID:</label>
                    <input type="text" id="teacherId" name="teacherId" class="form-control" value="<%= teacherId %>" readonly>
                </div>
                <div class="form-group">
                    <label for="teacherName">Teacher Name:</label>
                    <input type="text" id="teacherName" name="teacherName" class="form-control" value="<%= teacherName %>">
                </div>
                <div class="form-group">
                    <label for="teacherQualification">Teacher Qualification:</label>
                    <input type="text" id="teacherQualification" name="teacherQualification" class="form-control" value="<%= teacherQualification %>">
                </div>
                <div class="form-group">
                    <label for="subjects">Subjects:</label>
                    <input type="text" id="subjects" name="subjects" class="form-control" value="<%= subjects %>">
                </div>
                <div class="form-group">
                    <label for="linkedIn">LinkedIn:</label>
                    <input type="text" id="linkedIn" name="linkedIn" class="form-control" value="<%= linkedIn %>">
                </div>
                <div class="form-group">
                    <label for="teacherProfilePhoto">Teacher Profile Photo:</label>
                    <input type="text" id="teacherProfilePhoto" name="teacherProfilePhoto" class="form-control" value="<%= teacherProfilePhoto %>">
                </div>
                <div class="form-group">
                    <label for="teacherResume">Teacher Resume:</label>
                    <input type="text" id="teacherResume" name="teacherResume" class="form-control" value="<%= teacherResume %>">
                </div>
                <div class="text-center">
                    <button type="submit" name="btnupdate" class="btn btn-primary">Update</button>
                </div>
            </form>
        </div>
    </div>
</div>

<%@ include file="../footer.jsp"%>
