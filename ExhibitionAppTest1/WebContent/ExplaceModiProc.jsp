<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="./include/dbconn.jsp" %>
<%

	String codes = request.getParameter("codes");
	String placename = request.getParameter("placename");
	String rlocation = request.getParameter("rlocation");
	String contactno = request.getParameter("contactno");
	String times = request.getParameter("times");
	String holiday = request.getParameter("holiday");

	String sql ="update explace set placename=?,location=?,contactno=?,times=?,holiday=? where codes=?";

	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,placename);
	pstmt.setString(2,rlocation);
	pstmt.setString(3,contactno);
	pstmt.setString(4,times);
	pstmt.setString(5,holiday);
	pstmt.setString(6,codes);
	
	int rs1 = pstmt.executeUpdate();
	
	if(rs1 >0){
		out.print("<script>alert('수정완료'); location.replace('Explace.jsp');</script>");
	}
%>