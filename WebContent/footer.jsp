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



<!-- Footer Start -->
<br> <hr><br>
<!-- Footer -->
<footer class="text-center text-lg-start bg-body-tertiary text-muted ">
  

  <!-- Section: Links  -->
  <section class=""><br>
    <div class="container text-center text-md-start mt-3">
      <!-- Grid row -->
      <div class="row mt-5">
        <!-- Grid column -->
        <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
          <!-- Content -->
          <h6 class="text-uppercase fw-bold mb-4">
            <i class="fas fa-gem me-3"></i>Address
          </h6>
          <p>
             Yashwantrao Chavan College of Science
Karad-Masur Road, Vidyanagar, Karad,
Dist-Satara, Maharshtra, India - 415124
          </p>
        </div>
        <!-- Grid column -->

       

        <!-- Grid column -->
        <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
          <!-- Links -->
          <h6 class="text-uppercase fw-bold mb-4">
            Useful links
          </h6>
          <p>
            <a href="https://www.unishivaji.ac.in/" class="text-reset">Shivaji University, Kolhapur</a>
          </p>
          <p>
            <a href="http://www.naac.gov.in/index.php/en/" class="text-reset">NAAC</a>
          </p>
          <p>
            <a href="https://www.aicte-india.org/" class="text-reset">AICTE</a>
          </p>
          <p>
            <a href="https://mahadbt.maharashtra.gov.in/" class="text-reset">Maha DBT</a>
          </p>
        </div>
        <!-- Grid column -->

        <!-- Grid column -->
        <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
          <!-- Links -->
          <h6 class="text-uppercase fw-bold mb-4">Contact</h6>
          <p><i class="fas fa-home me-3"></i> Yashwantrao Chavan College of Science, Karad - 2024</p>
          <p>
            <i class="fas fa-envelope me-3"></i>
             prinyccsk@gmail.com
          </p>
          <p><i class="fas fa-phone me-3"></i> +91 02164 271356 / 271357</p>
          <p><i class="fas fa-print me-3"></i> Principal Mobile No : 9850571346 , 9834691381</p>
        </div>
        <!-- Grid column -->
      </div>
      <!-- Grid row -->
    </div>
  </section>
  <!-- Section: Links  -->

  <!-- Copyright -->
  <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.05);">
    © 2024 Copyright:
    <a class="text-reset fw-bold" href="">Department of Computer Science, Karad</a>
  </div>
  <!-- Copyright -->
</footer>
<!-- Footer End -->
</body>
</html>