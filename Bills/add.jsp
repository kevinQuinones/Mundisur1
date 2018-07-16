<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="model.entity.*"%>
<%@page import="java.util.List"%>
<%
	List<Product> rs = (List<Product>) request.getAttribute("products");
%>
<!DOCTYPE html>
<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>A�adir facturas</title>
<link rel="stylesheet" type="text/css" href="../../addEstilo.css">
<script>
	function comprobar() {

		var ruc = document.formu.ruc.value;

		if (ruc.length != 11) {
			alert("No es un RUC valido!!");
			return false;
		} else {
			document.forms['formu']['Enviar'].disabled = true;
		}
		return true;
	}
</script>

</head>
<body>
	<header>
		<div class="contenedor">
			<div id="marca">
				<h1>Facturas</h1>
			</div>
			<nav>
				<ul>
					<li class="actual"><a href="../index.html"> Inicio </a></li>
					<li><a href="/bills/add">A�adir </a></li>
					<li><a href="/bills"> Mostrar </a></li>
					<li><a href="/users"> Usuarios</a></li>
					<li><a href="/access">Accesos </a></li>
					<li><a href="/products">Productos </a></li>
					<li><a href="/resources">Recursos </a></li>
					<li><a href="/employees"> Empleados</a></li>	
					<li><a href="/products/saled"> Productos mas vendidos</a></li>	
					<li><a href="/users/login"> LogIn </a></li>
					<li><a href="/users/logout"> LogOut </a></li>
				</ul>
			</nav>
	</header>
	<a id="add" href="/bills" title="A�adir Factura"
		style="color: #DF01A5;">Mostrar</a>
	<div id="table">
		<h1 style="text-align:center;color:#8A0829">A�adir Factura</h1>
		<h2 style="color: #8A0829;">>Ingrese:</h2>
		<form action="/bills/add" method="post" name="formu"
			id="formu" onsubmit="return comprobar()">

			<label>Seleccionar Producto: </label> <select name="product">
				<%
					for (Product r : rs) {
				%>
				<option value="<%=r.getId()%>"><%=r.getNombre() + "/" + r.getBrand()%></option>
				<%
					}
				%>
			</select> <br> <br> 
			<input type="number" name="quant"
				placeholder="Cantidad" required> <br> <br> <br>
				
			<input type="text" name="name" placeholder="Nombre de la entidad"
				required> <br> <br> <br> <input type="text"
				name="address" placeholder="Direcci�n de la entidad" required>
			<br> <br> <br> <input type="number" name="ruc" maxlength="11" placeholder="RUC" required> <br>
			<br> <br> <input type="submit" value="Enviar" name="Enviar">
		</form>
	</div>
</body>
</html>