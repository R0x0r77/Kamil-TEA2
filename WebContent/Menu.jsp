<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" 
    
    import="kosio.dto.MenuItem"
    import="java.util.List"
    import="java.util.ArrayList"
%>

<!DOCTYPE html>
<html>
<head>
<title>Menu</title>
<link rel="stylesheet" href="Styles/MenuStyle.css" type="text/css">
</head>
<body>
	
<%	
	String name;
	double price;
	int pageId;
	double total = 0;
	
	@SuppressWarnings("unchecked")
	List<MenuItem> dishes = (List<MenuItem>) request.getAttribute("items");
	
	@SuppressWarnings("unchecked")
	List<MenuItem> desserts = (List<MenuItem>) request.getAttribute("desserts");
	
	@SuppressWarnings("unchecked")
	List<MenuItem> drinks = (List<MenuItem>) request.getAttribute("drinks");
	
	
	//List<MenuItem> items = new ArrayList<MenuItem>();
	//items.addAll(dishes);
	//items.addAll(desserts);
	//items.addAll(drinks);
	%>


<h3>Main Dishes:</h3><hr> <br>

<form id="dishesMenu">
<% for (int i = 0; i < dishes.size(); i++) {
		
		name = dishes.get(i).getName();
		price = dishes.get(i).getPrice();
		pageId = dishes.get(i).getPageId();
		%>
		
		<p style="display:inline"><%=name %> (<%=price %>) </p>
		<input type="text" name="order_<%=i %>" size="2" value="0" class="orderQuantity" readonly>
		<input type="button" value="-" onclick="subtract('dishesMenu',<%=pageId %>, <%=i %>)" class="buttonMinus">
		<input type="button" value="+" onclick="increment('dishesMenu',<%=pageId %>, <%=i %>)" class="buttonPlus">
		<input type="hidden" name="name_<%=i %>" value="<%=name %>">
		<input type="hidden" name="price_<%=i %>" value="<%=price %>">
		<input type="hidden" name="pageId_<%=i %>" value="<%=pageId %>">
		
		<br><br>
<%}
		%>
		<p style="display:inline">TOTAL: </p>
		<input style="display:inline" type="text" name="totalCost" size="5" value="0" readonly>
		<hr><br>
</form>



<h3>Desserts:</h3><hr> <br>

<form id="dessertsMenu">
<% for (int i = 0; i < desserts.size(); i++) {
		
		name = desserts.get(i).getName();
		price = desserts.get(i).getPrice();
		pageId = desserts.get(i).getPageId();
		%>
		
		<p style="display:inline"><%=name %> (<%=price %>) </p>
		<input type="text" name="order_<%=i %>" size="2" value="0" class="orderQuantity" readonly>
		<input type="button" value="-" onclick="subtract('dessertsMenu',<%=pageId %>, <%=i %>)" class="buttonMinus">
		<input type="button" value="+" onclick="increment('dessertsMenu',<%=pageId %>, <%=i %>)" class="buttonPlus">
		<input type="hidden" name="name_<%=i %>" value="<%=name %>">
		<input type="hidden" name="price_<%=i %>" value="<%=price %>">
		<input type="hidden" name="pageId_<%=i %>" value="<%=pageId %>">
		
		<br><br>
<%}
		%>
		<p style="display:inline">TOTAL: </p>
		<input style="display:inline" type="text" name="totalCost" size="5" value="0" readonly>
		<hr><br>
</form>



<h3>Drinks:</h3><hr> <br>

<form id="drinksMenu">
<% for (int i = 0; i < drinks.size(); i++) {
		
		name = drinks.get(i).getName();
		price = drinks.get(i).getPrice();
		pageId = drinks.get(i).getPageId();
		%>
		
		<p style="display:inline"><%=name %> (<%=price %>) </p>
		<input type="text" name="order_<%=i %>" size="2" value="0" class="orderQuantity" readonly>
		<input type="button" value="-" onclick="subtract('drinksMenu',<%=pageId %>, <%=i %>)" class="buttonMinus">
		<input type="button" value="+" onclick="increment('drinksMenu',<%=pageId %>, <%=i %>)" class="buttonPlus">
		<input type="hidden" name="name_<%=i %>" value="<%=name %>">
		<input type="hidden" name="price_<%=i %>" value="<%=price %>">
		<input type="hidden" name="pageId_<%=i %>" value="<%=pageId %>">
		
		<br><br>
<%}
		%>
		<p style="display:inline">TOTAL: </p>
		<input style="display:inline" type="text" name="totalCost" size="5" value="0" readonly>
		<hr><br>
</form>
 
<br>
OVERALL:
<br><br>

<form action="CartServlet" method="post" id="submitOrders">
	<input name="TOTAL" style="display:inline" type="text" value="0.00" readonly>
	<button type="button" onclick="submitForms()">ORDER</button>
</form>


<script>
var i;
var order = [[], [], [], [], [], [], [], []];	// order - quantity of item ordered by user
var name = [[], [], [], [], [], [], [], []];
var price = [[], [], [], [], [], [], [], []];
var pageID = 0;
var dishesSize = <%=dishes.size()%>;
var dessertsSize = <%=desserts.size()%>;
var drinksSize = <%=drinks.size()%>;
pageID = document.getElementById("dishesMenu").elements("pageId_0").value;
for (i = 0; i < dishesSize; i++) {
	
	//name[pageId[i]][i] = document.getElementById("dishesMenu").elements("name_" + i).value;
	price[pageID][i] = document.getElementById("dishesMenu").elements("price_" + i).value;
	order[pageID][i] = 0;
}
pageID = document.getElementById("dessertsMenu").elements("pageId_0").value;
for (i = 0; i < dessertsSize; i++) {
	
	//name[pageId[i]][i] = document.getElementById("dessertsMenu").elements("name_" + i).value;
	price[pageID][i] = document.getElementById("dessertsMenu").elements("price_" + i).value;
	order[pageID][i] = 0;
}
pageID = document.getElementById("drinksMenu").elements("pageId_0").value;
for (i = 0; i < drinksSize; i++) {
	
	//name[pageId[i]][i] = document.getElementById("drinksMenu").elements("name_" + i).value;
	price[pageID][i] = document.getElementById("drinksMenu").elements("price_" + i).value;
	order[pageID][i] = 0;
}
function increment(page, pageID, index) {
	
	document.getElementById(page).elements("order_" + index).value = ++order[pageID][index];
	evaluateTotalCost(page, pageID);
}
function subtract(page, pageID, index) {
	
	if (order[pageID][index] > 0) {
		document.getElementById(page).elements("order_" + index).value = --order[pageID][index];
		evaluateTotalCost(page, pageID);
	}
}
function evaluateTotalCost(page, pageID) {
	
	var total = 0;
	var menuSize = 0
	var i;
	
	switch (pageID) {
	
		case 4: menuSize = dessertsSize; break;
		case 5: menuSize = drinksSize; break;
		default: menuSize = dishesSize;
	}
	
	for (i = 0; i < menuSize; i++)
		
		total += order[pageID][i] * price[pageID][i];
	
	
	document.getElementById(page).elements("totalCost").value = total.toFixed(2);
	evaluateTOTAL()
}
function evaluateTOTAL() {
	
	var sum1 = document.getElementById("dishesMenu").elements("totalCost").value;
	var sum2 = document.getElementById("dessertsMenu").elements("totalCost").value;
	var sum3 = document.getElementById("drinksMenu").elements("totalCost").value;
	
	document.getElementById("submitOrders").elements("TOTAL").value = (+sum1 + +sum2 + +sum3).toFixed(2);
}
function submitForms() {
	
	document.getElementById("dishesMenu").submit();
	document.getElementById("dessertsMenu").submit();
	document.getElementById("drinksMenu").submit();
	document.getElementById("submitOrders").submit();
}
</script>


</body>
</html>