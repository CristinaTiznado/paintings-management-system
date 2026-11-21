<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .navbar-container {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 16px 24px;
        background-color: var(--bg-card);
        border-bottom: 1px solid var(--border);
        position: relative;
        position: sticky;
        top: 0;
        z-index: 100;
    }

    .nav-links {
        display: flex;
        gap: 20px;
        align-items: center;
    }

    .mobile-menu-btn {
        display: none;
        background: none;
        border: none;
        color: var(--text-main);
        cursor: pointer;
        padding: 8px;
    }

    /* Diseño responsivo para pantallas pequeñas */
    @media (max-width: 768px) {
        .mobile-menu-btn {
            display: block;
        }

        .nav-links {
            display: none;
            flex-direction: column;
            position: absolute;
            top: 100%;
            left: 0;
            width: 100%;
            background-color: var(--bg-card);
            border-bottom: 1px solid var(--border);
            padding: 16px 24px;
            box-shadow: 0 10px 15px -3px rgba(0,0,0,0.1);
            z-index: 50;
            align-items: flex-start;
        }

        /* Clase con JavaScript para abrir el menú */
        .nav-links.active {
            display: flex;
        }
        
        .nav-links a {
            width: 100%;
            padding: 12px 0;
            border-bottom: 1px solid var(--border);
        }
        
        .nav-links a:last-child {
            border-bottom: none;
        }
    }
</style>

<nav class="navbar-container">
    <!-- Logo -->
    <a href="/pinturas" style="display: flex; align-items: center; gap: 12px; text-decoration: none; color: var(--text-main);">
        <div style="display: flex; align-items: center; justify-content: center; width: 36px; height: 36px; background: var(--primary); color: white; border-radius: 10px;">
            <i data-lucide="palette" style="width: 20px; height: 20px;"></i>
        </div>
        <h2 style="margin: 0; font-size: 1.5rem;">ArtShelf</h2>
    </a>

    <!-- Botón Hamburguesa -->
    <button class="mobile-menu-btn" id="menuToggle" aria-label="Abrir menú">
        <i data-lucide="menu"></i>
    </button>

    <!-- Enlaces -->
    <div class="nav-links" id="navMenu">
        <a href="/mis-compras" style="display: flex; align-items: center; gap: 8px; text-decoration: none; color: inherit;">
            <i data-lucide="shopping-bag" style="width: 18px;"></i> Mis compras
        </a>
        <a href="/pinturas" style="display: flex; align-items: center; gap: 8px; text-decoration: none; color: inherit;">
            <i data-lucide="layout-grid" style="width: 18px;"></i> Catálogo
        </a>
        <a href="/formulario/agregar" style="display: flex; align-items: center; gap: 8px; text-decoration: none; color: inherit;">
            <i data-lucide="plus-circle" style="width: 18px;"></i> Agregar
        </a>
        <a href="/logout" style="display: flex; align-items: center; gap: 8px; text-decoration: none; color: var(--danger);">
            <i data-lucide="log-out" style="width: 18px;"></i> Salir
        </a>
    </div>
</nav>

<!-- Script para la interactividad del menú móvil -->
<script>
    document.addEventListener("DOMContentLoaded", function() {
        const menuToggle = document.getElementById("menuToggle");
        const navMenu = document.getElementById("navMenu");
        const menuIcon = menuToggle.querySelector("i");

        menuToggle.addEventListener("click", function() {
            // Alterna la clase 'active' para mostrar/ocultar el menú
            navMenu.classList.toggle("active");
            
            // Cambia el icono entre hamburguesa ('menu') y la 'X' ('x')
            if (navMenu.classList.contains("active")) {
                menuIcon.setAttribute("data-lucide", "x");
            } else {
                menuIcon.setAttribute("data-lucide", "menu");
            }
            
            // Re-renderiza los iconos de Lucide para que aplique el cambio
            lucide.createIcons();
        });
    });
</script>