<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalle Pintura</title>
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
        <h1>${pintura.titulo}</h1>
        
        <div class="detalle-container">
            <div class="detalle-imagen">
                <img src="${pintura.url}" alt="Imagen de ${pintura.titulo}">
            </div>
            
            <div class="detalle-info">
                <p><strong>Autor:</strong> <br>${pintura.creador.nombre} ${pintura.creador.apellido}</p>
                <p><strong>Descripción:</strong> <br>${pintura.descripcion}</p>
                <p><strong>Precio:</strong> <br>$${pintura.precio}</p>
                <p><strong>Cantidad en inventario:</strong> <br>${pintura.cantidad}</p>
            </div>
        </div>
    </div>
</body>
</html>