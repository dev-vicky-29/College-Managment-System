<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="/College_Managment_System/js/jquery-3.6.0.js"></script>
<script src="/College_Managment_System/js/additional-methods.js"></script>
<script src="/College_Managment_System/js/jquery.validate.js"></script>
<%
	if(!errorMsg.equals(""))
	{
%>
<script>
Swal.fire({
	icon: "error",
	title: "Department of Computer Science, Karad",
	text: "<%=errorMsg%>"
});
</script>
<%
	}
	else if(!successMsg.equals(""))
	{
%>
<script>
Swal.fire({
	icon: "success",
	title: "Department of Computer Science, Karad",
	text: "<%=successMsg%>"
});
</script>
<%
	}
%>
</body>
</html>