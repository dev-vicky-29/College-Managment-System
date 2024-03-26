<%@ include file="../header.jsp"%>
<!-- About Page Specific Contents -->

<style>
        /* Custom Styles */
        body {
            background-color: #f8f9fa;
            color: #333;
            font-family: Arial, sans-serif;
            padding-top: 20px;
        }
        .container {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 30px;
        }
        h1, h2 {
            color: #007bff;
        }
        th {
            background-color: #007bff;
            color: #fff;
        }
        .table {
            background-color: #f8f9fa;
        }
        .table th, .table td {
            border-top: none;
        }
        .table-striped tbody tr:nth-of-type(odd) {
            background-color: rgba(0, 123, 255, 0.1);
        }
    </style>

  <div class="container">
        <h1 class="text-center mb-5">Courses Offered</h1>

        <div class="row">
            <div class="col-md-6">
                <h2>Undergraduate:</h2>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Course</th>
                            <th>Affiliation</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>B.Sc. Computer Science (Entire)</td>
                            <td>Shivaji University, Kolhapur</td>
                        </tr>
                        <tr>
                            <td>B.Sc. Computer Science (Optional)</td>
                            <td>Shivaji University, Kolhapur</td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="col-md-6">
                <h2>Postgraduate:</h2>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Course</th>
                            <th>Affiliation</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>M.Sc. Computer Science</td>
                            <td>Shivaji University, Kolhapur</td>
                        </tr>
                        <tr>
                            <td>M.C.A.</td>
                            <td>YCMOU</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <h2>Certification Courses:</h2>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Course</th>
                            <th>Department</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Office Automation</td>
                            <td>Computer Science</td>
                        </tr>
                        <tr>
                            <td>Graphics Design</td>
                            <td>Computer Science</td>
                        </tr>
                        <tr>
                            <td>Frontend Development using Bootstrap</td>
                            <td>Computer Science</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
<%@ include file="../footer.jsp"%>