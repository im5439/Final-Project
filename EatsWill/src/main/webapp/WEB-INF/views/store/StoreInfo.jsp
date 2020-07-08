<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach var="dto" items="${lists}">
영업시간:${dto.timeName }
매장전화번호: ${dto.shopTel }
매장이름: ${dto.shopName }
사장이름: ${dto.ceoName }
</c:forEach>
<table>
<tr>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
</tr>


</table>
</body>
</html>