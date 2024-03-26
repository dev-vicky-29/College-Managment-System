<%@page import="com.util.db.DataAccess"%>
<%@page import="net.sf.jasperreports.engine.JasperReport"%>
<%@page import="net.sf.jasperreports.engine.JasperCompileManager"%>
<%@page import="java.util.HashMap"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%
DataAccess db=new DataAccess();
//Connect to Database
db.connectToServer();
//run report and convert to pdf and returns its byte array
JasperReport rpt=JasperCompileManager.compileReport(request.getRealPath("/Admin/reports/")+request.getParameter("page")+".jrxml");
byte[] bytes = JasperRunManager.runReportToPdf(rpt,null,db.cn);
db.closeConnection();
response.setContentType("application/pdf"); //MIME Type
response.setContentLength(bytes.length);
ServletOutputStream outStream = response.getOutputStream();
outStream.write(bytes, 0, bytes.length); //byte array,startindex,length
outStream.flush();//send response to browser
outStream.close(); //close stream

%>