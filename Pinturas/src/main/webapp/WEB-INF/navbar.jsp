<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<nav class="navbar">
    <h2><i data-lucide="palette"></i> <a href="/pinturas" style="text-decoration: none; color: white">Pinturas</a></h2>
    <div class="nav-links">
        <!-- Evaluamos el parámetro 'menu' -->
        <a href="/mis-compras" class="${param.menu == 'compras' ? 'active' : ''}">
            <i data-lucide="shopping-bag"></i> Mis compras
        </a>
        
        <a href="/pinturas" class="${param.menu == 'catalogo' ? 'active' : ''}">
            <i data-lucide="layout-grid"></i> Catálogo
        </a>
        
        <a href="/formulario/agregar" class="${param.menu == 'agregar' ? 'active' : ''}">
            <i data-lucide="plus-circle"></i> Agregar
        </a>
        
        <a href="/logout" style="color: var(--danger);">
            <i data-lucide="log-out"></i> Salir
        </a>
    </div>
</nav>