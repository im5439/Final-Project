<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>1
<head>
<title>20200714</title>

<script type="text/javascript" src="/eatswill/resources/assets/js/jquery-3.1.1.js"></script>

<script type="text/javascript">

$(function() {
	$("#testinput").click(function(){
		alert($('[id="test"]').val());
		
		$("#test").val()
	});
});

</script>

</head>
<body>

	<textarea rows="50" cols="50" placeholder="사장님 댓글" id="test"></textarea>
	<input type="button" id="testinput" value="클릭"/>
    
</body>
</html>
