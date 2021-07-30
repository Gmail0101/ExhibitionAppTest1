<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/Header.jsp" %>
<%

	String custinfo = request.getParameter("custinfo");
	String dates = request.getParameter("dates");
	int tprice = Integer.parseInt(request.getParameter("tprice"));
	int tcnt = Integer.parseInt(request.getParameter("tcnt"));
	String payment = request.getParameter("payment");
	

	String sql = "insert into tickets values(null,?,?,now(),?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,custinfo);
	pstmt.setString(2,dates);
	pstmt.setInt(3,tprice);
	pstmt.setInt(4,tcnt);
	pstmt.setString(5,payment);
	
	
	int rsinsert = pstmt.executeUpdate();
	
	if(rsinsert > 0){
		response.sendRedirect("Ticket.jsp");
	}
	
	
%>