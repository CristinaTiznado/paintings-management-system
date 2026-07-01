<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pinturas</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
    <nav class="navbar">
        <h2>Pinturas</h2>
        <div class="nav-links">
            <a href="/pinturas">Pinturas</a>
            <a href="/formulario/agregar">Agregar pintura</a>
            <a href="/logout">Logout</a>
        </div>
    </nav>

    <div class="main-content">
        <h2>Bienvenido de vuelta ${usuarioLogueado.nombre} ${usuarioLogueado.apellido}</h2>
        
        <div class="lista-pinturas">
            <c:forEach var="pintura" items="${pinturas}">
                <div class="card-pintura">
                    <a href="/detalle/${pintura.id}"><img src="${pintura.url}" alt="Imagen de ${pintura.titulo}"></a>
                    <div class="card-details">
                        <h3>${pintura.titulo}</h3>
                        <p><strong>Autor:</strong> ${pintura.creador.nombre} ${pintura.creador.apellido}</p>
                        <p><strong>Año:</strong> ${pintura.anio}</p>
                        <p><strong>Precio:</strong> $${pintura.precio}</p>
                        <a href="/formulario/editar/${pintura.id}" class="edit-icon">✎</a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>