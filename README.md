🌍 Leer en [Español](README-es.md)*

# 🎨 Paintings Management System

> Project developed as a certification exam for the Full Stack Java Bootcamp taught by Skillnest and sponsored by Banco de Chile.

This project is a Full Stack web application developed in Java with **Spring Boot** using the **MVC** (Model-View-Controller) architecture pattern. The platform allows the management of an art catalog (paintings), where users can register, publish their own artworks, explore the complete gallery, and acquire (buy) available paintings, automatically managing inventory and purchase history.

## 🚀 Main Features

- **Authentication and Security:** Secure registration and login system, with password encryption using BCrypt and access control based on user sessions.
- **Modern UI/UX & Responsive Design:** Fully custom Dark Mode interface built with CSS variables. Features responsive layouts utilizing CSS Grid for the catalog and Flexbox for centered authentication cards.
- **Modular Frontend Architecture:** DRY-compliant JSP structure using layout fragments (navbars and headers) and dynamic active states based on URL parameters.
- **Advanced Gallery Management:** Authenticated users can publish, edit, and delete their artworks. Destructive actions (like deleting a painting) are protected by native JS confirmation prompts to prevent accidental data loss.
- **Acquisition System & Edge-Case Handling:** Transactional logic for buying paintings. The system dynamically updates the UI to reflect stock changes, disabling purchase buttons for out-of-stock items or preventing duplicate purchases from the same user.
- **Robust Data Validation:** Strict backend validation (Jakarta Validation) for data integrity (positive prices, valid URLs), coupled with custom database queries to prevent duplicate artwork titles from being registered. Includes designed "Empty States" for empty catalogs or user histories.

## 🛠️ Tech Stack

- **Backend:** Java 17, Spring Boot (Web, MVC, Validation).
- **Data Persistence:** Spring Data JPA (Hibernate), MySQL Connector.
- **Frontend:** JSP (JavaServer Pages), JSTL, HTML5, CSS3 (Custom Dark Theme).
- **Assets:** Lucide Icons (Vector iconography).
- **Security:** jBcrypt (Password hashing).
- **Dependency Manager:** Maven.

## 📋 Requirements

To run this project in your local environment, make sure you have the following installed:

- **Java Development Kit (JDK)** version 17 or higher.
- **Maven** (to compile and manage dependencies).
- **MySQL Server**.
- An IDE (like Eclipse, IntelliJ IDEA, or VS Code).

## ⚙️ Database Configuration

The system uses MySQL to store information about users, paintings, and their relationships. 

1. Open your MySQL database manager.
2. Create a new database for the project (for example, `pinturas_db`):
   
   ```sql
   CREATE DATABASE pinturas_db;
   ```
3. Verify that in your `src/main/resources/application.properties` file, the credentials match your local environment:
   
   ```properties
   spring.datasource.url=jdbc:mysql://localhost:3306/pinturas_db
   spring.datasource.username=root
   spring.datasource.password=YOUR_PASSWORD
   spring.jpa.hibernate.ddl-auto=update
   ```
   *(Note: `ddl-auto=update` will automatically create the `usuarios`, `pinturas`, and the intermediate `compras` tables upon startup).*

## 🏃‍♂️ Steps to run it

1. Clone the repository:
   
   ```bash
   git clone https://github.com/CristinaTiznado/paintings-management-system.git
   ```
2. Access the project directory:
   
   ```bash
   cd Pinturas
   ```
3. Start the application:
   
   ```bash
   mvn spring-boot:run
   ```
4. Open your browser and go to: **`http://localhost:8080`**

## 💡 App Usage

1. **Register/Login:** Create a new account or log in to access the gallery via the centered authentication portal.
2. **Explore:** On the main view (`/pinturas`), you will see all artworks published by the community presented in a responsive grid.
3. **Publish Artwork:** Go to "Agregar" to register a new painting. The system will validate that the title is unique before publishing.
4. **Buy:** Click on any painting in the catalog to see its details. If there is inventory available and you haven't bought it yet, you can click "Agregar a mis compras".
5. **My Purchases:** Check the history of the paintings you have acquired in your dedicated gallery section.
6. **Manage:** If you are the original author of a painting, you will see a highlighted edit button that allows you to update its information or permanently delete it.