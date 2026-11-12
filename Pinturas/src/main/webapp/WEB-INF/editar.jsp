<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Pintura | Galería</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
    <!-- Menú modular -->
    <jsp:include page="navbar.jsp" />

    <!-- Usamos el mismo wrapper que centra el login/registro -->
    <main class="auth-layout">
        <div class="form-container">
            <header style="margin-bottom: 24px;">
                <h1 style="margin-bottom: 8px;">Editar obra</h1>
                <span class="text-muted">Modificando: <strong style="color: var(--text-main);">${pintura.titulo}</strong></span>
            </header>

            <form:form action="/editar" method="POST" modelAttribute="pintura">
                <!-- Campos ocultos necesarios para mantener la relación en la BBDD -->
                <form:hidden path="id" />
                <input type="hidden" name="creador" value="${pintura.creador.id}">
                
                <form:label path="titulo">Título de la obra</form:label>
                <div class="input-error-wrapper">
                    <form:input type="text" path="titulo"/>
                    <form:errors path="titulo"/>
                </div>

                <!-- Agrupamos Año y Cantidad en una sola fila -->
                <div style="display: flex; gap: 16px;">
                    <div style="flex: 1;">
                        <form:label path="anio">Año</form:label>
                        <div class="input-error-wrapper">
                            <form:input type="number" path="anio"/>
                            <form:errors path="anio"/>
                        </div>
                    </div>
                    
                    <div style="flex: 1;">
                        <form:label path="cantidad">Cantidad en stock</form:label>
                        <div class="input-error-wrapper">
                            <form:input type="number" path="cantidad"/>
                            <form:errors path="cantidad"/>
                        </div>
                    </div>
                </div>

                <form:label path="precio">Precio ($)</form:label>
                <div class="input-error-wrapper">
                    <form:input type="number" step="0.01" path="precio"/>
                    <form:errors path="precio"/>
                </div>

                <form:label path="url">URL de la imagen</form:label>
                <div class="input-error-wrapper">
                    <form:input type="text" path="url"/>
                    <form:errors path="url"/>
                </div>

                <form:label path="descripcion">Descripción</form:label>
                <div class="input-error-wrapper">
                    <form:textarea path="descripcion" rows="4"/>
                    <form:errors path="descripcion"/>
                </div>

                <!-- Botones principales: Guardar y Cancelar -->
                <div style="display: flex; gap: 12px; margin-top: 32px;">
                    <button type="submit" class="btn-primary" style="flex: 1; display: flex; align-items: center; justify-content: center; gap: 8px;">
                        <i data-lucide="save" style="width: 18px; height: 18px;"></i> Guardar cambios
                    </button>
                    
                    <a href="/pinturas" style="flex: 1; display: flex; align-items: center; justify-content: center; gap: 8px; background-color: transparent; color: var(--text-muted); border: 1px solid var(--border); border-radius: var(--radius-md); text-decoration: none; font-weight: 600; font-size: 0.95rem; transition: all 0.2s ease;">
                        Cancelar
                    </a>
                </div>
            </form:form>
            
            <!-- Separador sutil -->
            <hr style="border: 0; border-top: 1px solid var(--border); margin: 32px 0 24px 0;">

            <!-- Zona de peligro: Eliminar obra -->
            <form action="/eliminar/${pintura.id}" method="POST" style="margin: 0;" onsubmit="return confirm('¿Estás seguro de que deseas eliminar esta obra? Esta acción es permanente y no se puede deshacer.');">
                <input type="hidden" name="_method" value="DELETE"/>
                
                <!-- Estilo sutil pero con advertencia en rojo -->
                <button type="submit" class="btn-danger btn-block" style="margin-top: 0; background-color: rgba(239, 68, 68, 0.05); color: var(--danger); border: 1px solid rgba(239, 68, 68, 0.2); display: flex; align-items: center; justify-content: center; gap: 8px; transition: all 0.2s ease;">
                    <i data-lucide="trash-2" style="width: 18px; height: 18px;"></i> Eliminar obra permanentemente
                </button>
            </form>

        </div>
    </main>

    <!-- Inicialización de íconos -->
    <script src="https://unpkg.com/lucide@latest"></script>
    <script>lucide.createIcons();</script>
</body>
</html>