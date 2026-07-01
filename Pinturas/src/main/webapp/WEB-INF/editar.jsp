<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Pintura</title>
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

    <div class="form-container">
        <h1>Editar pintura</h1>
        <form:form action="/editar" method="POST" modelAttribute="pintura">
            <input type="hidden" name="_method" value="PUT"/>

            <input type="hidden" name="id" value="${pintura.id}">
            <input type="hidden" name="creador" value="${pintura.creador.id}">
            
            <form:label path="titulo">Título</form:label>
            <div class="input-error-wrapper">
                <form:input type="text" path="titulo"/>
                <form:errors path="titulo"/>
            </div>

            <form:label path="anio">Año</form:label>
            <div class="input-error-wrapper">
                <form:input type="number" path="anio"/>
                <form:errors path="anio"/>
            </div>

            <form:label path="descripcion">Descripción</form:label>
            <div class="input-error-wrapper">
                <form:textarea path="descripcion" rows="4"/>
                <form:errors path="descripcion"/>
            </div>

            <form:label path="url">URL a imagen</form:label>
            <div class="input-error-wrapper">
                <form:input type="text" path="url"/>
                <form:errors path="url"/>
            </div>

            <form:label path="cantidad">Cantidad</form:label>
            <div class="input-error-wrapper">
                <form:input type="number" path="cantidad"/>
                <form:errors path="cantidad"/>
            </div>

            <form:label path="precio">Precio</form:label>
            <div class="input-error-wrapper">
                <form:input type="number" step="0.01" path="precio"/>
                <form:errors path="precio"/>
            </div>

            <div class="btn-group">
                <button type="submit" class="btn-primary">Editar</button>
            </div>
        </form:form>
        
        
        <form action="/eliminar/${pintura.id}" method="POST">
            <input type="hidden" name="_method" value="DELETE"/>
            <button type="submit" class="btn-danger">Eliminar</button>
        </form>

    </div>
</body>
</html>