<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agregar Pintura | Galería</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
    <!-- Menú modular con el estado activo para la pestaña "Agregar" -->
    <jsp:include page="navbar.jsp">
        <jsp:param name="menu" value="agregar" />
    </jsp:include>

    <main class="auth-layout">
        <div class="form-container">
            <header style="margin-bottom: 24px; display: flex; align-items: flex-start; justify-content: space-between;">
                <div>
                    <h1 style="margin-bottom: 8px; margin-top: 0;">Agregar pintura</h1>
                    <span class="text-muted">Publica una nueva obra en el catálogo</span>
                </div>
                <i data-lucide="image-plus" style="color: var(--accent-blue); width: 32px; height: 32px; margin-top: 4px;"></i>
            </header>

            <form:form action="/agregar" method="POST" modelAttribute="pintura">
                
                <form:label path="titulo">Título de la obra</form:label>
                <div class="input-error-wrapper">
                    <form:input type="text" path="titulo" placeholder="Ej: La Noche Estrellada"/>
                    <form:errors path="titulo"/>
                </div>

                <!-- Agrupamos Año y Cantidad en una sola fila (Flexbox) -->
                <div style="display: flex; gap: 16px;">
                    <div style="flex: 1;">
                        <form:label path="anio">Año</form:label>
                        <div class="input-error-wrapper">
                            <form:input type="number" path="anio" min="1000" max="2027" placeholder="Ej: 1889"/>
                            <form:errors path="anio"/>
                        </div>
                    </div>
                    
                    <div style="flex: 1;">
                        <form:label path="cantidad">Cantidad inicial</form:label>
                        <div class="input-error-wrapper">
                            <!-- Como modificamos el modelo para aceptar 0, el placeholder sugiere 1 -->
                            <form:input type="number" path="cantidad" min="1" placeholder="1"/>
                            <form:errors path="cantidad"/>
                        </div>
                    </div>
                </div>

                <form:label path="precio">Precio ($)</form:label>
                <div class="input-error-wrapper">
                    <form:input type="number" step="0.01" min="0" path="precio" placeholder="0.00"/>
                    <form:errors path="precio"/>
                </div>

                <form:label path="url">URL de la imagen</form:label>
                <div class="input-error-wrapper">
                    <form:input type="text" path="url" placeholder="https://ejemplo.com/imagen.jpg"/>
                    <form:errors path="url"/>
                </div>

                <form:label path="descripcion">Descripción</form:label>
                <div class="input-error-wrapper">
                    <form:textarea path="descripcion" rows="4" placeholder="Historia, técnica o detalles de la pintura..."/>
                    <form:errors path="descripcion"/>
                </div>

                <!-- Botones agrupados: Publicar y Cancelar -->
                <div style="display: flex; gap: 12px; margin-top: 32px;">
                    <button type="submit" class="btn-primary" style="flex: 1; display: flex; align-items: center; justify-content: center; gap: 8px;">
                        <i data-lucide="upload-cloud" style="width: 18px; height: 18px;"></i> Publicar obra
                    </button>
                    
                    <a href="/pinturas" style="flex: 1; display: flex; align-items: center; justify-content: center; gap: 8px; background-color: transparent; color: var(--text-muted); border: 1px solid var(--border); border-radius: var(--radius-md); text-decoration: none; font-weight: 600; font-size: 0.95rem; transition: all 0.2s ease;">
                        Cancelar
                    </a>
                </div>
            </form:form>
        </div>
    </main>

    <!-- Inicialización de íconos -->
    <script src="https://unpkg.com/lucide@latest"></script>
    <script>lucide.createIcons();</script>
</body>
</html>