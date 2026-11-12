<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro | Galería de Pinturas</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
    <!-- Menú modular -->
    <jsp:include page="navbar-auth.jsp" />

    <!-- Wrapper que controla el centrado vertical y responsive -->
    <main class="auth-layout">
        <div class="form-container">
            <header style="margin-bottom: 24px;">
                <h1 style="margin-bottom: 8px;">Crear Cuenta</h1>
                <span class="text-muted">Únete para comprar y publicar tus pinturas</span>
            </header>

            <form:form action="/register" method="POST" modelAttribute="usuario">
                
                <form:label path="nombre">Nombre</form:label>
                <div class="input-error-wrapper">
                    <form:input type="text" path="nombre" placeholder="Ej: Constanza"/>
                    <form:errors path="nombre"/>
                </div>

                <form:label path="apellido">Apellido</form:label>
                <div class="input-error-wrapper">
                    <form:input type="text" path="apellido" placeholder="Tu apellido"/>
                    <form:errors path="apellido"/>
                </div>

                <form:label path="correo">Correo electrónico</form:label>
                <div class="input-error-wrapper">
                    <form:input type="email" path="correo" placeholder="ejemplo@correo.com"/>
                    <form:errors path="correo"/>
                </div>

                <form:label path="password">Contraseña</form:label>
                <div class="input-error-wrapper">
                    <form:input type="password" path="password" placeholder="••••••••"/>
                    <form:errors path="password"/>
                </div>

                <form:label path="confirmarPassword">Confirmar contraseña</form:label>
                <div class="input-error-wrapper">
                    <form:input type="password" path="confirmarPassword" placeholder="••••••••"/>
                    <form:errors path="confirmarPassword"/>
                </div>

                <button type="submit" class="btn-primary btn-block">Registrarse</button>

                <!-- Enlace cruzado de UX -->
                <div style="margin-top: 24px; text-align: center; font-size: 0.95rem;">
                    <span class="text-muted">¿Ya tienes una cuenta?</span> 
                    <a href="/" style="color: var(--accent-blue); text-decoration: none; font-weight: 600;">
                        Inicia sesión aquí
                    </a>
                </div>
            </form:form>
        </div>
    </main>
</body>
</html>