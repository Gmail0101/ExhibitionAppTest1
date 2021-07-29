<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="./include/dbconn.jsp" %>
<%
	String mocustid = request.getParameter("custid");
String custname = request.getParameter("custname");
String email = request.getParameter("email");
String phone = request.getParameter("phone");

String sql ="update customers set custname=?,phone=?,email=? where custid=?";

	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,custname);
	pstmt.setString(2,phone);
	pstmt.setString(3,email);
	pstmt.setString(4,mocustid);
	
	int rs1 = pstmt.executeUpdate();
	
	if(rs1 >0){
		out.print("<script>alert('수정완료'); location.replace('Customers.jsp');</script>");
	}
%>