<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "./include/Header.jsp"%>
<%@ include file = "./include/incLogin.jsp"%>
<br/><br/>
<h3>전시관 정보 수정</h3>
<%
	String code = request.getParameter("CodeChk");
	
	String codes = "";
	String placename = "";
	String rlocation = "";
	String contactno = "";
	String times = "";
	String holiday = "";
	
	String sql =" select * from explace where codes =?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,code);
	rs = pstmt.executeQuery();
	if(rs.next()){
		do{
			 codes = rs.getString("codes");
			 placename = rs.getString("placename");
			 rlocation = rs.getString("location");
			 contactno = rs.getString("contactno");
			 times = rs.getString("times");
			 holiday = rs.getString("holiday");
		%>
			<section class="row">
			<div class="col-md-12">
			<form action="ExplaceModiProc.jsp">
				<table class="table table-response table-striped">
					<tr>
						<th>전시관 코드</th>
						<td><input type="text" class="form-control" value="<%=codes %>" disabled/></td>
						<td><input type="hidden" class="form-control" value="<%=codes %>" name="codes" /></td>
					</tr>
					<tr>
						<th>전시관이름</th>
						<td><input type="text" class="form-control" value="<%=placename %>"  name="placename" /></td> 
					</tr>
					<tr>
						<th>위치</th>
						<td><input type="text" class="form-control" name="rlocation"value="<%=rlocation %>"/></td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>
						<input type="text" class="form-control" name="contactno"value="<%=contactno %>" /></td>
					</tr>
					<tr>
						<th>운영시간</th>
						<td><input type="text" name="times" value="<%=times %>" class="form-control" />
						</td>
					</tr>
					<tr>
						<th>휴관일</th>
						<td><input type="text" maxlength="13" name="holiday" value="<%=holiday %>" class="form-control" />
						</td>
					</tr>
					<tr>
						<th colspan="2">
							<input type="submit" value="수 정" class="btn btn-info btn-block" />
						</th>
					</tr>
				</table>
				</form>
			</div>
			</section>
		<%}while(rs.next());
		
	}else{out.println("조회실패");}
%>

<%@ include file = "./include/Footer.jsp"%>