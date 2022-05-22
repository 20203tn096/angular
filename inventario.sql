-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-05-2022 a las 08:39:19
-- Versión del servidor: 10.1.26-MariaDB
-- Versión de PHP: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `inventario`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_categoria` (IN `p_id` INT, IN `p_nombre` VARCHAR(20), OUT `p_error` INT, OUT `error_nombre` INT, OUT `error_id` INT)  BEGIN
DECLARE vNombre INT;
DECLARE vId INT;

SELECT COUNT(*) INTO vId FROM categoria WHERE id_categoria = p_id;
SELECT COUNT(*) INTO vNombre FROM categoria WHERE nombre_categoria = p_nombre;

IF vId > 0 THEN 
	SET error_id = 0;
ELSE 
	SET error_id = 1;
END IF;

IF vNombre = 0 THEN 
	SET error_nombre = 0;
ELSE 
	SET error_nombre = 1;
END IF;

IF error_id = 0  AND error_nombre = 0 THEN 
	UPDATE categoria
    SET nombre_categoria = p_nombre
    WHERE id_categoria = p_id;
	SET p_error = 0;
ELSE 
	SET p_error = 1;
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_producto` (IN `p_id` INT, IN `p_nombre` VARCHAR(45), IN `p_marca` VARCHAR(45), IN `p_precio` INT, IN `p_cantidad` INT, IN `p_categoria` INT, OUT `p_error` INT, OUT `error_nombre` INT, OUT `error_categoria` INT, OUT `error_id` INT)  BEGIN
DECLARE vNombre INT;
DECLARE vId INT;
DECLARE vCategoria INT;

SELECT COUNT(*) INTO vCategoria FROM categoria WHERE id_categoria = p_categoria;
SELECT COUNT(*) INTO vNombre FROM producto WHERE nombre_producto = p_nombre AND id_producto != p_id ;
SELECT COUNT(*) INTO vId FROM producto WHERE id_producto = p_id;

IF vNombre > 0 THEN 
 SET error_nombre = 1;
ELSE
 SET error_nombre = 0;
END IF;
IF vCategoria = 0 THEN 
	SET error_categoria = 1;
ELSE
	SET error_categoria = 0;
END IF;
IF vId != 0 THEN
	SET error_id =0;
ELSE
	SET error_id =1;
END IF;

IF error_nombre = 0  AND error_categoria=0 AND  error_id = 0 THEN 
		UPDATE producto
		SET nombre_producto = p_nombre, marca = p_marca, precio = p_precio, cantidad = p_cantidad, categoria_id = p_categoria
		WHERE id_producto = p_id;
		SET p_error = 0;
ELSE
		SET p_error = 1;
END IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_categoria` (IN `p_id` INT, OUT `p_error` INT, OUT `error_foranea` INT, OUT `error_id` INT)  BEGIN 
DECLARE vId INT;
DECLARE vForanea INT;
DECLARE vEstado INT;

SELECT COUNT(*) INTO vId FROM categoria WHERE id_categoria = p_id;
SELECT COUNT(*) INTO vForanea FROM producto WHERE categoria_id = p_id AND estado = 1;
SELECT estado INTO vEstado FROM categoria WHERE id_categoria = p_id;

IF vId > 0 THEN 
	SET error_id = 0;
ELSE 
	SET error_id = 1;
END IF; 

IF vForanea = 0 THEN 
	SET error_foranea = 0;
ELSE 
	SET error_foranea = 1;
END IF; 

IF error_id = 0 THEN 
    IF vEstado = 1 THEN 
		IF error_foranea = 0 THEN 
			UPDATE categoria 
			SET estado = 0
			WHERE id_categoria = p_id;
			SET p_error = 0;
        ELSE 
			SET p_error = 1;
        END IF;
    ELSE
		UPDATE categoria 
        SET estado = 1
        WHERE id_categoria = p_id;
        SET p_error = 0;
    END IF;
	
ELSE 
	SET p_error = 1;
END IF; 

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_producto` (IN `p_id` INT, OUT `p_error` INT, OUT `error_id` INT, OUT `error_foranea` INT)  BEGIN
DECLARE vId INT;
DECLARE vEstado INT;
DECLARE vForanea INT;
SELECT COUNT(*) INTO vId FROM producto WHERE id_producto = p_id;

IF vId != 0 THEN 
	SET error_id= 0;
ELSE 
	SET error_id= 1;
END IF;

IF error_id = 0 THEN
	SET p_error =0;
	SELECT estado INTO vEstado FROM producto WHERE id_producto = p_id;
		IF vEstado = 1 THEN 
			UPDATE producto
			SET estado = 0
            WHERE id_producto = p_id;
		ELSE
       SELECT COUNT(*) INTO vForanea FROM producto AS p INNER JOIN categoria AS c ON p.categoria_id = c.id_categoria WHERE P.id_producto=p_id AND c.estado = 1;
        	IF vForanea = 1 THEN 
           		 UPDATE producto
				SET estado = 1
            	WHERE id_producto = p_id;
                SET error_foranea = 0;
                SET p_error =0;
            ELSE
                SET p_error =1;
            	SET error_foranea = 1;
            END IF;
			
		END IF;
ELSE
	SET p_error =1;
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `find_activas` ()  BEGIN
SELECT * FROM categoria WHERE estado = 1 ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `find_all` ()  BEGIN
SELECT p.id_producto, p.nombre_producto, p.marca, p.precio, p.cantidad, p.fecha, p.estado, c.id_categoria, c.nombre_categoria FROM producto AS p INNER JOIN categoria AS c ON p.categoria_id = c.id_categoria order by estado desc;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `find_all_categorias` ()  BEGIN
SELECT * FROM categoria order by estado desc;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `find_byId` (IN `p_id` INT)  BEGIN
SELECT  p.id_producto, p.nombre_producto, p.marca, p.precio, p.cantidad, p.fecha, p.estado, c.id_categoria, c.nombre_categoria FROM producto AS p INNER JOIN categoria AS c ON p.categoria_id = c.id_categoria WHERE id_producto = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `find_byId_categorias` (IN `p_id` INT, OUT `p_error` INT, OUT `error_id` INT)  BEGIN
DECLARE vId INT;
SELECT count(*) INTO vId FROM categoria WHERE id_categoria = p_id;

IF vId > 0 THEN 
	SET error_id = 0;
ELSE 
	SET error_id = 1;
END IF;

IF error_id = 0 THEN 
	SELECT * FROM categoria WHERE id_categoria = p_id;
    SET p_error = 0;
ELSE 
	SET p_error = 1;
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_categoria` (IN `p_nombre` VARCHAR(20), OUT `p_error` INT, OUT `error_nombre` INT)  BEGIN
DECLARE vNombre INT;

SELECT COUNT(*) INTO vNombre FROM categoria WHERE nombre_categoria = p_nombre;

IF vNombre = 0  THEN 
	SET error_nombre = 0;
ELSE
	SET error_nombre = 1;
END IF;

IF error_nombre = 0  THEN 
	SET p_error = 0;
	INSERT INTO categoria(nombre_categoria, estado) VALUES(p_nombre, 1);
ELSE 
	SET p_error = 1;
END IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_producto` (IN `p_nombre` VARCHAR(45), IN `p_marca` VARCHAR(45), IN `p_precio` INT, IN `p_cantidad` INT, IN `p_categoria` INT, OUT `p_error` INT, OUT `error_nombre` INT, OUT `error_categoria` INT)  BEGIN
DECLARE vNombre INT;
DECLARE vCategoria INT;

SELECT COUNT(*) INTO vNombre FROM producto WHERE nombre_producto = p_nombre;
SELECT COUNT(*) INTO vCategoria FROM categoria WHERE id_categoria = p_categoria;


IF vNombre > 0 THEN 
 SET error_nombre = 1;
ELSE
 SET error_nombre = 0;
END IF;

IF vCategoria = 0 THEN 
	SET error_categoria = 1;
ELSE
	SET error_categoria = 0;
END IF;

IF error_nombre = 0 AND error_categoria=0 THEN 
	INSERT INTO producto(nombre_producto, marca, precio, cantidad, fecha, estado, categoria_id)
	VALUES (p_nombre, p_marca, p_precio, p_cantidad, curdate(), 1, p_categoria);
	SET p_error = 0;
ELSE
	SET p_error = 1;
END IF;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nombre_categoria` varchar(20) NOT NULL,
  `estado` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nombre_categoria`, `estado`) VALUES
(3, 'Lacteos', 1),
(4, 'Enlatados', 1),
(9, 'Electronicos', 1),
(10, 'Material', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `nombre_producto` varchar(45) NOT NULL,
  `marca` varchar(45) NOT NULL,
  `precio` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `estado` tinyint(4) NOT NULL,
  `categoria_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `nombre_producto`, `marca`, `precio`, `cantidad`, `fecha`, `estado`, `categoria_id`) VALUES
(1, 'Leche', 'Alpura', 20, 20, '2022-05-21', 1, 3),
(2, 'Computadoras', 'HP', 5420, 10, '2022-05-22', 1, 9);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`),
  ADD UNIQUE KEY `nombre_categoria_UNIQUE` (`nombre_categoria`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD UNIQUE KEY `nombre_producto_UNIQUE` (`nombre_producto`),
  ADD KEY `fk_producto_Categoria_idx` (`categoria_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_producto_Categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id_categoria`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
