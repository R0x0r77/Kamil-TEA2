<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Login Page</title>
<link rel="stylesheet" href="Styles/LoginPageStyle.css" type="text/css">
</head>
<body>

<%
String accCreated = (String) request.getAttribute("accountCreated"); 
if (accCreated != null)
	out.println(accCreated);
%>
<br><br>

<form action="LoginServlet" method="post">
	<div class="container">
		<label for="userName"><b>Username:</b></label> <br>
		<input type="text" placeholder="Enter Username" name="userName"> <br>
		
		<label for="password"><b>Password:</b></label> <br>
		<input type="password" placeholder="Enter Password" name="password"> <br>
		
		<button type="submit" class="buttonLoginSubmit">Login</button> <br>
	</div>	
</form>

<br>

<form action="CreateAccount.jsp" method="post">
	<button type="submit" class="buttonCreateACC">Create new account</button>
</form>

</body>
</html>