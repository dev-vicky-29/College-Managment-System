<%@ include file="../header.jsp"%>


<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">
                    <h4>Your Profile</h4>
                </div>
                <div class="card-body">
                    <form>
                        <div class="mb-3">
                            <label for="profilePicture" class="form-label">Profile Picture</label>
                            <input type="file" class="form-control" id="profilePicture">
                        </div>
                        <div class="mb-3">
                            <label for="studentName" class="form-label">Student Name</label>
                            <input type="text" class="form-control" id="studentName" required>
                        </div>
                        <div class="mb-3">
                            <label for="studentClass" class="form-label">Student Class</label>
                            <input type="text" class="form-control" id="studentClass" required>
                        </div>
                        <div class="mb-3">
                            <label for="studentEmail" class="form-label">Student Email</label>
                            <input type="email" class="form-control" id="studentEmail" required>
                        </div>
                        <div class="mb-3">
                            <label for="studentNumber" class="form-label">Student Number</label>
                            <input type="tel" class="form-control" id="studentNumber" required>
                        </div>
                        <div class="mb-3">
                            <label for="studentGender" class="form-label">Student Gender</label>
                            <select class="form-select" id="studentGender" required>
                                <option value="male">Male</option>
                                <option value="female">Female</option>
                                <option value="other">Other</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="studentAddress" class="form-label">Student Address</label>
                            <textarea class="form-control" id="studentAddress" rows="3" required></textarea>
                        </div>
                        <div class="mb-3">
                            <label for="10thMarks" class="form-label">10th Marks</label>
                            <input type="text" class="form-control" id="10thMarks" required>
                        </div>
                        <div class="mb-3">
                            <label for="12thMarks" class="form-label">12th Marks</label>
                            <input type="text" class="form-control" id="12thMarks" required>
                        </div>
                        <div class="mb-3">
                            <label for="adharNumber" class="form-label">Adhar Number</label>
                            <input type="text" class="form-control" id="adharNumber" required>
                        </div>
                        <div class="mb-3">
                            <label for="panNumber" class="form-label">Pan Number</label>
                            <input type="text" class="form-control" id="panNumber" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Save</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<%@ include file="../footer.jsp"%>