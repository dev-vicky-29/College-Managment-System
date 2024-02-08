<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<!-- Syllabus Page Specific Contents -->
<div class="mt-2 mb-2  d-flex flex-row-reverse">
	<a class="btn btn-primary pr-5" href="/College_Managment_System/Admin/EditSyllabus.jsp">Edit Syllabus</a>
</div>
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
                    <a href="/College_Management_System/SyllabusFiles/<%=rs.getString(4)%>" class="btn btn-outline-success downloadBtn">Download</a>
                </td>
            </tr>
        </tbody>
        <%
            }
        %>
    </table>
</div>
<script>
    var downloadButtons = document.querySelectorAll('.downloadBtn');

    downloadButtons.forEach(function(button) {
        button.addEventListener('click', function (event) {
            event.preventDefault(); // Prevents the default behavior of the link

            var fileUrl = this.getAttribute('href');

            // Display a confirmation dialog using SweetAlert
            Swal.fire({
                title: 'Department of Computer Science, Karad',
                text: 'Do you want to download this file?',
                icon: 'question',
                showCancelButton: true,
                confirmButtonText: 'Yes, download it!',
                cancelButtonText: 'No, cancel!',
            }).then((result) => {
                if (result.isConfirmed) {
                    downloadFile(fileUrl);
                }
            });
        });
    });

    function downloadFile(fileUrl) {
        var xhr = new XMLHttpRequest();
        xhr.open('GET', fileUrl, true);
        xhr.responseType = 'blob';

        xhr.onload = function () {
            var a = document.createElement('a');
            var url = window.URL.createObjectURL(xhr.response);
            a.href = url;
            a.download = fileUrl.substring(fileUrl.lastIndexOf('/') + 1);
            document.body.appendChild(a);
            a.click();
            window.URL.revokeObjectURL(url);
        };

        xhr.send();
    }
</script>

<%@ include file="../footer.jsp"%>
