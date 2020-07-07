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
<c:forEach var="dto" items="${lists }">
<a href="<%=cp %>/menuArticle.action?menuCode=${dto.menuCode}">
메뉴명:${dto.menuName }
</a>
사진: ${dto.menuImg }
메뉴가격: ${dto.menuPrice }
<br/>
</c:forEach>

</body>
</html>