<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar Sesión | Galería de Pinturas</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
    <!-- Menú modular sin enlaces de navegación extra -->
    <jsp:include page="navbar-auth.jsp" />

    <!-- Wrapper que controla el centrado vertical y responsive -->
    <main class="auth-layout">
        <div class="form-container">
            <header style="margin-bottom: 24px;">
                <h1 style="margin-bottom: 8px;">Iniciar Sesión</h1>
                <span class="text-muted">Ingresa tus credenciales para continuar</span>
            </header>

            <form:form action="/login" method="POST" modelAttribute="usuarioLogin">
                
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

                <button type="submit" class="btn-primary btn-block">Ingresar</button>

                <!-- Enlace cruzado de UX -->
                <div style="margin-top: 24px; text-align: center; font-size: 0.95rem;">
                    <span class="text-muted">¿No tienes una cuenta?</span> 
                    <a href="/register" style="color: var(--accent-blue); text-decoration: none; font-weight: 600;">
                        Regístrate aquí
                    </a>
                </div>
            </form:form>
        </div>
    </main>
</body>
</html>