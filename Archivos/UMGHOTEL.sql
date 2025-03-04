/* BASE DE DATOS UMG HOTEL */
-- DROP DATABASE IF EXISTS UMGHotel;
CREATE DATABASE UMGHotel;
Use UMGHotel;



/* CREACION DE TABLAS "TC" */

--TABLA HOTEL

CREATE TABLE tc_hotel (
    idHotel INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(50) NOT NULL,
    Direcci�n VARCHAR(100) NOT NULL,
    Tel�fono INT NOT NULL
);
-- TABLA CATEGORIAS DE HABITACION
CREATE TABLE tc_categoriaHabitacion (
    idCategoria INT PRIMARY KEY IDENTITY(1,1),
    Descripci�n VARCHAR(255) NOT NULL,
    Camas INT NOT NULL
);
-- TABLA HABITACIONES
CREATE TABLE tc_habitaciones (
    idHabitacion INT PRIMARY KEY IDENTITY(1,1),
    idHotel INT,
    idCategoria INT,
    NumHabitacion VARCHAR(10) NOT NULL,
    PrecioXnoche DECIMAL(10, 2) NOT NULL,
    Disponible BIT NOT NULL,
    FOREIGN KEY (idHotel) REFERENCES tc_hotel(idHotel),
    FOREIGN KEY (idCategoria) REFERENCES tc_categoriaHabitacion(idCategoria)
);

/* CREACION DE TABLAS "TT" */

-- TABLA USUARIOS
CREATE TABLE tt_usuarios (
    Usuario VARCHAR(50) PRIMARY KEY,
    Contrase�a VARCHAR(255) NOT NULL,
    Rol VARCHAR(50) NOT NULL,
    PreguntaSeguridad VARCHAR(255) NOT NULL,
    RespuestaSeguridad VARCHAR(255) NOT NULL
);

-- TABLA EMPLEADOS
CREATE TABLE tt_empleados (
    codEmpleado INT PRIMARY KEY IDENTITY(1,1),
    idHotel INT,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    tel�fono VARCHAR(20) NOT NULL,
    �rea VARCHAR(50) NOT NULL,
    FOREIGN KEY (idHotel) REFERENCES tc_hotel(idHotel)
);
-- TABLA HUESPEDES
CREATE TABLE tt_huespedes (
    dpi VARCHAR(20) PRIMARY KEY,
    idUsuario VARCHAR(50),
    Nombres VARCHAR(100) NOT NULL,
    Apellidos VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Tel�fono VARCHAR(20) NOT NULL,
    FOREIGN KEY (idUsuario) REFERENCES tt_usuarios(Usuario)
);
-- TABLA RESERVACIONES 
CREATE TABLE tt_reservacion (
    idReservacion INT PRIMARY KEY IDENTITY(1,1),
    idHotel INT,
    idHabitacion INT,
    dpi VARCHAR(20),
    FechaReserva DATE NOT NULL,
    FechaCheckin DATE NOT NULL,
    FechaCheckout DATE NOT NULL,
    CantNoches INT NOT NULL,
    TotalReservacion DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (idHotel) REFERENCES tc_hotel(idHotel),
    FOREIGN KEY (idHabitacion) REFERENCES tc_habitaciones(idHabitacion),
    FOREIGN KEY (dpi) REFERENCES tt_huespedes(dpi)
);
-- TABLA SERVICIOS EXTRAS
CREATE TABLE tt_serviciosExtras (
    idServicio INT PRIMARY KEY IDENTITY(1,1),
    Descripci�n VARCHAR(255) NOT NULL,
    Cantidad INT NOT NULL,
    Precio DECIMAL(10, 2) NOT NULL,
    TotalServicio DECIMAL(10, 2) NOT NULL
);
-- TABLA FACTURAS
CREATE TABLE tt_factura (
    idFactura INT PRIMARY KEY IDENTITY(1,1),
    idReservacion INT,
    idServicio INT,
    TotalPagar DECIMAL(10, 2) NOT NULL,
    NIT VARCHAR(20) NOT NULL,
    FechaEmision DATE NOT NULL,
    MetodoDePago VARCHAR(50) NOT NULL,
    FOREIGN KEY (idReservacion) REFERENCES tt_reservacion(idReservacion),
    FOREIGN KEY (idServicio) REFERENCES tt_serviciosExtras(idServicio)
);
