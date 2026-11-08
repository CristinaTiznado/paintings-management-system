🌍 Leer en [Español](README-es.md)*

# 🎨 Paintings Management System

> Project developed as a certification exam for the Full Stack Java Bootcamp taught by Skillnest and sponsored by Banco de Chile.

This project is a Full Stack web application developed in Java with **Spring Boot** using the **MVC** (Model-View-Controller) architecture pattern. The platform allows the management of an art catalog (paintings), where users can register, publish their own artworks, explore the complete gallery, and acquire (buy) available paintings, automatically managing inventory and purchase history.

## 🚀 Main Features

- **Authentication and Security:** Secure registration and login system, with password encryption using BCrypt and access control based on user sessions.
- **Gallery Management (CRUD):** Authenticated users can publish new paintings, edit the information of their published artworks, and delete them from the system.
- **Acquisition System:** Transactional logic that allows users to "buy" paintings. When a purchase is made, the system automatically deducts the artwork's stock and adds it to the user's "My Purchases" history.
- **Data Validation (Backend):** Strict implementation of validations (Jakarta Validation) to ensure entered data is correct (valid image URL formats, positive prices and quantities, minimum text lengths, and password confirmation).
- **Dynamic Views:** Server-side generated interfaces using JSP and JSTL, adapting to the user's state (e.g., disabling the buy button if the user has already acquired the artwork or if it is out of stock).

## 🛠️ Tech Stack

- **Backend:** Java 17, Spring Boot (Web, MVC, Validation).
- **Data Persistence:** Spring Data JPA (Hibernate), MySQL Connector.
- **Frontend:** JSP (JavaServer Pages), JSTL, HTML5, CSS3.
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
   git clone https://github.com/CristinaTiznado/Pinturas.git
   ```
2. Access the project directory:
   
   ```bash
   cd Pinturas
   ```
3. Install dependencies:
   
   ```bash
   mvn clean install
   ```
4. Start the application:
   
   ```bash
   mvn spring-boot:run
   ```
5. Open your browser and go to: **`http://localhost:8080`**

## 💡 App Usage

1. **Register/Login:** Create a new account or log in to access the gallery.
2. **Explore:** On the main view (`/pinturas`), you will see all the artworks published by the community.
3. **Publish Artwork:** Go to "Add" to register a new painting by entering its title, year, description, image link, quantity in stock, and price.
4. **Buy:** Click on any painting in the catalog to see its details. If there is inventory available, you can click "Buy".
5. **My Purchases:** Check the history of the paintings you have acquired in the dedicated section.
6. **Manage:** If you are the original author of a painting, you will see an edit icon that allows you to update its information or delete it.
