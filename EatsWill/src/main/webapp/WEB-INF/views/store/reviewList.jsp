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

<table cellspacing="1" cellpadding="1" align="center" border="1" height="50" width="500">
<tr align="center">
	<td width="100">아아디</td>
	<td width="100">메뉴명</td>
	<td width="100">사진</td>
	<td width="200">내용</td>
	<td width="100">별점</td>
	<td width="100">일시</td>
</tr>
<c:forEach var="dto" items="${lists }">
<tr align="center">
	<td>${dto.userId }</td>
	<td>${dto.menuName }</td>
	<td><img alt="" src="resources/img/${dto.reImg}" width="30px" height="30px" /></td>
	<td>${dto.reContent }</td>
	<td>${dto.reScore }</td>
	<td>${dto.reCreated }</td>
</tr>
</c:forEach>
</table>


</body>
</html>