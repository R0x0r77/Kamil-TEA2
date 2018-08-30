<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="kosio.dto.User"%>
<!DOCTYPE html>
<html>
<head>
<title>home page</title>
<link rel="stylesheet" href="Styles/HomeStyle.css" type="text/css">
</head>
<body>

<%! String menu; %>

<% User sessionUser = (User) session.getAttribute("user"); %>


Hello <%= sessionUser.getFirstName() %> <%= sessionUser.getLastName() %>.
<br><br><hr><br>

<div class="container">
	<form action="Cuisine" method="post" class="polish">
		<input type="hidden" id="menu" name="menuPage" value="1">
		<button type="submit">Polish Cuisine</button>
	</form>
	
	<form action="Cuisine" method="post" class="italian">
		<input type="hidden" id="menu" name="menuPage" value="2">
		<button type="submit">Italian Cuisine</button>
	</form>
	
	<form action="Cuisine" method="post" class="mexican">
		<input type="hidden" id="menu" name="menuPage" value="3">
		<button type="submit">Mexican Cuisine</button>
	</form>
</div>

</body>
</html>