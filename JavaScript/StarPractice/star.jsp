<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>별찍기</title>
<script>
	var s=prompt("층 수를 입력");
	for( a = 0 ; a<s ; a++){
		for(var b = 0; b<a+1;b++){
			document.write("*");
		}	
		document.write("<br>")
	}
</script>
</head>

<body>
	
</body>
</html>