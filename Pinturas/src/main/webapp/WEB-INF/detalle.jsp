<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${pintura.titulo} | Detalle de Obra</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
    <!-- Menú modular -->
    <jsp:include page="navbar.jsp" />

    <main class="main-content">
        <!-- Navegación de regreso -->
        <a href="/pinturas" style="display: inline-flex; align-items: center; gap: 8px; color: var(--text-muted); text-decoration: none; margin-bottom: 24px; font-weight: 500; font-size: 0.95rem; transition: color 0.2s ease;">
            <i data-lucide="arrow-left" style="width: 18px; height: 18px;"></i> Volver al catálogo
        </a>
        
        <article class="detalle-layout">
            <div class="detalle-imagen">
                <img src="${pintura.url}" alt="${pintura.titulo}" loading="lazy">
            </div>
            
            <!-- Contenedor derecho usando flex para empujar el botón al final -->
            <div class="detalle-info-right" style="display: flex; flex-direction: column;">
                <!-- Encabezado con botón de edición condicional -->
                <div style="display: flex; justify-content: space-between; align-items: flex-start; gap: 16px; margin-bottom: 8px;">
                    <h1 style="margin: 0; color: var(--text-main);">${pintura.titulo}</h1>
                    
                    <c:if test="${pintura.creador.id == usuario.id}">
                        <a href="/formulario/editar/${pintura.id}" style="display: inline-flex; align-items: center; gap: 6px; padding: 6px 12px; background-color: rgba(59, 130, 246, 0.1); border: 1px solid rgba(59, 130, 246, 0.2); border-radius: var(--radius-md); color: var(--accent-blue); text-decoration: none; font-size: 0.85rem; font-weight: 600; white-space: nowrap; transition: background-color 0.2s ease;">
                            <i data-lucide="edit-2" style="width: 14px; height: 14px;"></i> Editar obra
                        </a>
                    </c:if>
                </div>
                
                <p class="text-muted" style="display: flex; align-items: center; gap: 6px; font-size: 1rem; margin-bottom: 24px; border-bottom: 1px solid var(--border); padding-bottom: 16px;">
                    <i data-lucide="user" style="width: 18px; height: 18px;"></i> 
                    Obra de: <strong>${pintura.creador.nombre} ${pintura.creador.apellido}</strong>
                </p>
                
                <div style="margin-bottom: 32px;">
                    <strong class="text-muted" style="display: block; margin-bottom: 8px; font-size: 0.85rem; text-transform: uppercase; letter-spacing: 0.5px;">Acerca de esta obra</strong>
                    <p style="color: var(--text-main); line-height: 1.6; margin: 0;">${pintura.descripcion}</p>
                </div>

                <div style="display: flex; gap: 40px; margin-bottom: 32px; background-color: var(--bg-input); padding: 16px; border-radius: var(--radius-md); border: 1px solid var(--border);">
                    <div>
                        <strong class="text-muted" style="display: block; margin-bottom: 4px; font-size: 0.85rem; text-transform: uppercase;">Precio</strong>
                        <span style="font-size: 1.5rem; font-weight: 700; color: var(--accent-blue);">$${pintura.precio}</span>
                    </div>
                    <div>
                        <strong class="text-muted" style="display: block; margin-bottom: 4px; font-size: 0.85rem; text-transform: uppercase;">Disponibilidad</strong>
                        <span style="font-size: 1.5rem; font-weight: 700; color: var(--text-main);">${pintura.cantidad} <span style="font-size: 1rem; font-weight: 500; color: var(--text-muted);">unidades</span></span>
                    </div>
                </div>
                
                <!-- El margin-top: auto empuja este bloque al final del contenedor derecho -->
                <div style="margin-top: auto; padding-top: 20px;">
                    <!-- Lógica para verificar si el usuario en sesión ya compró esta obra -->
                <c:set var="yaComprada" value="false" />
                <c:forEach var="comprador" items="${pintura.compradores}">
                    <c:if test="${comprador.id == usuario.id}">
                        <c:set var="yaComprada" value="true" />
                    </c:if>
                </c:forEach>

                <!-- El margin-top: auto empuja este bloque al final del contenedor -->
                <div style="margin-top: auto; padding-top: 20px;">
                    <c:choose>
                        <c:when test="${yaComprada}">
                            <!-- Botón deshabilitado si ya la compró -->
                            <div class="btn-comprar" style="display: flex; align-items: center; justify-content: center; gap: 8px; width: 100%; margin-top: 0; box-sizing: border-box; background-color: var(--bg-main); color: var(--text-muted); border: 1px solid var(--border); cursor: not-allowed;">
                                <i data-lucide="check-circle" style="width: 20px; height: 20px;"></i> Ya adquiriste esta obra
                            </div>
                        </c:when>
                        <c:when test="${pintura.cantidad > 0}">
                            <!-- Botón normal de compra si hay stock y no la ha comprado -->
                            <a href="/comprar/${pintura.id}" class="btn-comprar" style="display: flex; align-items: center; justify-content: center; gap: 8px; width: 100%; margin-top: 0; box-sizing: border-box;">
                                <i data-lucide="shopping-cart" style="width: 20px; height: 20px;"></i> Agregar a mis compras
                            </a>
                        </c:when>
                        <c:otherwise>
                            <!-- Estado sin stock -->
                            <div class="text-agotado" style="display: flex; align-items: center; justify-content: center; gap: 8px; width: 100%; box-sizing: border-box; margin-top: 0;">
                                <i data-lucide="x-circle" style="width: 20px; height: 20px;"></i> Sin stock
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
                </div>
            </div>
        </article>

        <!-- Sección de compradores -->
        <section class="lista-compradores-box">
            <h3 style="display: flex; align-items: center; gap: 8px; margin-bottom: 20px;">
                <i data-lucide="users" style="color: var(--text-muted);"></i> Historial de adquisiciones
            </h3>
            
            <c:choose>
                <c:when test="${not empty pintura.compradores}">
                    <ul>
                        <c:forEach var="comprador" items="${pintura.compradores}">
                            <li style="display: flex; align-items: center; gap: 12px;">
                                <i data-lucide="check-circle-2" style="color: var(--accent-blue); width: 18px; height: 18px;"></i>
                                <span>${comprador.nombre} ${comprador.apellido}</span>
                            </li>
                        </c:forEach>
                    </ul>
                </c:when>
                <c:otherwise>
                    <div style="padding: 24px; text-align: center; color: var(--text-muted); background-color: var(--bg-input); border: 1px dashed var(--border); border-radius: var(--radius-md);">
                        <i data-lucide="shopping-bag" style="width: 32px; height: 32px; opacity: 0.5; margin-bottom: 12px;"></i>
                        <p style="margin: 0;">Nadie ha comprado esta pintura aún. ¡Sé el primero!</p>
                    </div>
                </c:otherwise>
            </c:choose>
        </section>
    </main>

    <!-- Scripts para inicializar Lucide -->
    <script src="https://unpkg.com/lucide@latest"></script>
    <script>
        lucide.createIcons();
    </script>
</body>
</html>