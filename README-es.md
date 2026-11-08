# 🎨 Sistema de Gestión de Pinturas

> Proyecto desarrollado como examen de certificación para el Bootcamp Full Stack Java impartido por Skillnest y patrocinado por Banco de Chile.

Este proyecto es una aplicación web Full Stack desarrollada en Java con **Spring Boot** utilizando el patrón de arquitectura **MVC** (Modelo-Vista-Controlador). La plataforma permite la gestión de un catálogo de arte (pinturas), donde los usuarios pueden registrarse, publicar sus propias obras, explorar la galería completa y adquirir (comprar) pinturas disponibles, manejando automáticamente el inventario y el historial de compras.

## 🚀 Funcionalidades Principales

* **Autenticación y Seguridad:** Sistema de registro e inicio de sesión seguro, con encriptación de contraseñas mediante BCrypt y control de accesos basado en sesiones de usuario.
* **Gestión de Galería (CRUD):** Los usuarios autenticados pueden publicar nuevas pinturas, editar la información de sus obras publicadas y eliminarlas del sistema.
* **Sistema de Adquisición:** Lógica transaccional que permite a los usuarios "comprar" pinturas. Al realizar una compra, el sistema descuenta automáticamente el stock de la obra y la añade al historial de "Mis Compras" del usuario.
* **Validación de Datos (Backend):** Implementación estricta de validaciones (Jakarta Validation) para asegurar que los datos ingresados sean correctos (URLs de imágenes con formato válido, precios y cantidades positivas, longitudes mínimas de texto, y confirmación de contraseñas).
* **Vistas Dinámicas:** Interfaces generadas del lado del servidor utilizando JSP y JSTL, adaptándose al estado del usuario (ej. deshabilitando el botón de compra si el usuario ya adquirió la obra o si está agotada).

## 🛠️ Stack Tecnológico

* **Backend:** Java 17, Spring Boot (Web, MVC, Validation).
* **Persistencia de Datos:** Spring Data JPA (Hibernate), MySQL Connector.
* **Frontend:** JSP (JavaServer Pages), JSTL, HTML5, CSS3.
* **Seguridad:** jBcrypt (Hashing de contraseñas).
* **Gestor de Dependencias:** Maven.

## 📋 Requisitos

Para ejecutar este proyecto en tu entorno local, asegúrate de tener instalado:

* **Java Development Kit (JDK)** versión 17 o superior.
* **Maven** (para compilar y gestionar dependencias).
* **MySQL Server**.
* Un IDE (como Eclipse, IntelliJ IDEA, o VS Code).

## ⚙️ Configuración de Base de Datos

El sistema utiliza MySQL para almacenar la información de usuarios, pinturas y sus relaciones. 

1. Abre tu gestor de base de datos MySQL.
2. Crea una nueva base de datos para el proyecto (por ejemplo, `pinturas_db`):
   
   ```sql
   CREATE DATABASE pinturas_db;
   ```
4. Verifica que en tu archivo `src/main/resources/application.properties` las credenciales coincidan con las de tu entorno local:
   
   ```properties
   spring.datasource.url=jdbc:mysql://localhost:3306/pinturas_db
   spring.datasource.username=root
   spring.datasource.password=TU_CONTRASEÑA
   spring.jpa.hibernate.ddl-auto=update
   ```
   *(Nota: `ddl-auto=update` se encargará de crear las tablas `usuarios`, `pinturas` y la tabla intermedia `compras` automáticamente al iniciar).*

## 🏃‍♂️ Pasos para correrlo

1. Clona el repositorio:
   
   ```bash
   git clone https://github.com/TuUsuario/Pinturas.git
   ```
3. Accede al directorio del proyecto:
   
   ```bash
   cd Pinturas
   ```
5. Instala las dependencias:
   
   ```bash
   mvn clean install
   ```
7. Levanta la aplicación:
   
   ```bash
   mvn spring-boot:run
   ```
9. Abre tu navegador y dirígete a: **`http://localhost:8080`**

## 💡 Uso de la App

1. **Registro/Login:** Crea una cuenta nueva o inicia sesión para acceder a la galería.
2. **Explorar:** En la vista principal (`/pinturas`), verás todas las obras publicadas por la comunidad.
3. **Publicar Obra:** Ve a "Agregar" para registrar una nueva pintura indicando su título, año, descripción, enlace a una imagen, cantidad en stock y precio.
4. **Comprar:** Haz clic en cualquier pintura del catálogo para ver sus detalles. Si hay inventario, puedes darle a "Comprar".
5. **Mis Compras:** Revisa el historial de las pinturas que has adquirido en la sección dedicada.
6. **Administrar:** Si eres el autor original de una pintura, verás un ícono de edición que te permitirá actualizar su información o borrarla.
