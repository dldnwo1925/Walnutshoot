<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	var x = prompt("층 수를 입력");
	for(var a = 0; a < x ; a++){
		for (var b = x ; b >a ; b--){
			document.write("*");
		}
		document.write("<br>");
		
	}
</script>
</head>
<body>

</body>
</html>