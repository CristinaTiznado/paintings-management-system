<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mis Compras | Galería de Pinturas</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
    <!-- Menú principal modular con parámetro de estado activo -->
    <jsp:include page="navbar.jsp">
        <jsp:param name="menu" value="compras" />
    </jsp:include>

    <main class="main-content">
        
        <!-- Encabezado de sección -->
        <header style="margin-bottom: 32px; padding-bottom: 16px; border-bottom: 1px solid var(--border);">
            <h1 style="margin-bottom: 8px;">Mis Compras</h1>
            <span class="text-muted">Galería personal de obras adquiridas</span>
        </header>
        
        <div class="lista-pinturas">
            <c:forEach var="pintura" items="${compras}">
                <article class="card-pintura">
                    <a href="/detalle/${pintura.id}">
                        <img src="${pintura.url}" alt="${pintura.titulo}" loading="lazy">
                    </a>
                    
                    <div class="card-details">
                        <h3><a href="/detalle/${pintura.id}" style="color: inherit;">${pintura.titulo}</a></h3>
                        
                        <p><i data-lucide="user" style="width: 16px; height: 16px; vertical-align: -3px;"></i> ${pintura.creador.nombre} ${pintura.creador.apellido}</p>
                        <p><i data-lucide="calendar" style="width: 16px; height: 16px; vertical-align: -3px;"></i> ${pintura.anio}</p>
                        
                        <p style="font-size: 1.15rem; font-weight: 600; color: var(--accent-blue); margin-top: 12px;">
                            $${pintura.precio}
                        </p>
                        
                        <c:if test="${usuarioLogueado.id == pintura.creador.id}">
                            <a href="/formulario/editar/${pintura.id}" class="edit-icon" title="Editar obra">
                                <i data-lucide="edit-2" style="width: 16px; height: 16px;"></i>
                            </a>
                        </c:if>
                    </div>
                </article>
            </c:forEach>
            
            <!-- Empty State: Diseño cuando el usuario no ha comprado nada -->
            <c:if test="${empty compras}">
                <div style="grid-column: 1 / -1; text-align: center; padding: 60px 20px; background-color: var(--bg-card); border: 1px dashed var(--border); border-radius: var(--radius-lg);">
                    <i data-lucide="shopping-bag" style="width: 48px; height: 48px; color: var(--text-muted); margin-bottom: 16px;"></i>
                    <h3 style="margin-bottom: 8px;">Tu galería está vacía</h3>
                    <p class="text-muted" style="margin-bottom: 24px;">Aún no has adquirido ninguna obra de arte.</p>
                    <a href="/pinturas" class="btn-primary">Explorar catálogo</a>
                </div>
            </c:if>
        </div>
    </main>

    <!-- Inicialización de íconos -->
    <script src="https://unpkg.com/lucide@latest"></script>
    <script>
        lucide.createIcons();
    </script>
</body>
</html>