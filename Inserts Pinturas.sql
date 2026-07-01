USE pinturas_db;

-- Usuarios
INSERT INTO usuarios (nombre, apellido, correo, password) 
VALUES ('Usuario', 'Prueba', 'usuario_prueba@gmail.com', '12345678');

INSERT INTO usuarios (nombre, apellido, correo, password) 
VALUES ('Usuario2', 'Prueba2', 'usuario2_prueba2@gmail.com', '12345678');

-- Pinturas
INSERT INTO pinturas (titulo, anio, descripcion, url, cantidad, precio, id_usuario) 
VALUES (
    'Noche Estrellada', 
    1889, 
    'Una vista nocturna desde la ventana del asilo con un cielo arremolinado.', 
    'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9f/%22La_noche_estrellada%22_de_Van_gogh.jpg/250px-%22La_noche_estrellada%22_de_Van_gogh.jpg', 
    5, 
    15000.00, 
    2
);

INSERT INTO pinturas (titulo, anio, descripcion, url, cantidad, precio, id_usuario) 
VALUES (
    'La Persistencia de la Memoria', 
    1931, 
    'Relojes blandos derritiéndose en un paisaje onírico.', 
    'https://live.staticflickr.com/8632/16169404016_b4c115d937_h.jpg', 
    2, 
    25000.50, 
    1
);

INSERT INTO pinturas (titulo, anio, descripcion, url, cantidad, precio, id_usuario) 
VALUES (
    'La Joven de la Perla', 
    1665, 
    'Un retrato íntimo y enigmático de una joven con un turbante y una gran perla.', 
    'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d7/Meisje_met_de_parel.jpg/250px-Meisje_met_de_parel.jpg', 
    3, 
    12500.00, 
    2
);

INSERT INTO pinturas (titulo, anio, descripcion, url, cantidad, precio, id_usuario) 
VALUES (
    'El Grito', 
    1893, 
    'Una figura agonizante contra un cielo rojo sangre.', 
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRq4_UlNEv1sAZFAGOh6hX-co1Y9A5UxqlWQ9wJaEA7ow&s', 
    1, 
    30000.00, 
    1
);