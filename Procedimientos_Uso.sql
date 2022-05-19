USE inventario;

CREATE TABLE IF NOT EXISTS `inventario`.`Categoria` (
  `id_categoria` INT NOT NULL auto_increment,
  `nombre_categoria` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_categoria`),
  UNIQUE INDEX `nombre_categoria_UNIQUE` (`nombre_categoria` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inventario`.`Producto` (
  `id_producto` INT NOT NULL auto_increment,
  `nombre_producto` VARCHAR(45) NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `precio` INT NOT NULL,
  `cantidad` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `estado` TINYINT NOT NULL,
  `categoria_id` INT NOT NULL,
  PRIMARY KEY (`id_producto`),
  UNIQUE INDEX `nombre_producto_UNIQUE` (`nombre_producto` ASC) VISIBLE,
  INDEX `fk_producto_Categoria_idx` (`categoria_id` ASC) VISIBLE,
  CONSTRAINT `fk_producto_Categoria`
    FOREIGN KEY (`categoria_id`)
    REFERENCES `inventario`.`Categoria` (`id_categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


DROP TABLE producto;
DROP TABLE categoria;

-- Creacion de Procedimientos Almacenados

-- Procedimientos de Producto

-- Consultar Todos
DELIMITER //
CREATE PROCEDURE find_all(
)
BEGIN
SELECT * FROM producto AS p INNER JOIN categoria AS c ON p.categoria_id = c.id_categoria order by estado desc;
END //

-- Consulta Especifica
DELIMITER //
CREATE PROCEDURE find_byId(
IN p_id INT
)
BEGIN
SELECT * FROM producto AS p INNER JOIN categoria AS c ON p.categoria_id = c.id_categoria WHERE id_producto = p_id;
END //

-- Registrar producto

DELIMITER //
CREATE PROCEDURE registrar_producto(
IN p_nombre VARCHAR(45),
IN p_marca VARCHAR(45),
IN p_precio INT, 
IN p_cantidad INT,
IN p_categoria INT,
OUT p_error INT, 
OUT error_nombre INT,
OUT error_categoria INT
)
BEGIN
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

END //

-- Actualizar Producto

DELIMITER //
CREATE PROCEDURE actualizar_producto(
IN p_id INT, 
IN p_nombre VARCHAR(45),
IN p_marca VARCHAR(45),
IN p_precio INT, 
IN p_cantidad INT,
IN p_categoria INT, 
OUT p_error INT,
OUT error_nombre INT,
OUT error_categoria INT,
OUT error_id INT
)
BEGIN
DECLARE vNombre INT;
DECLARE vId INT;
DECLARE vCategoria INT;

SELECT COUNT(*) INTO vCategoria FROM categoria WHERE id_categoria = p_categoria;
SELECT COUNT(*) INTO vNombre FROM producto WHERE nombre_producto = p_nombre;
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

END //


-- Eliminar o Reactivar Producto

DELIMITER //
CREATE PROCEDURE eliminar_producto(
IN p_id INT, 
OUT error_id INT
)
BEGIN
DECLARE vId INT;
DECLARE vEstado INT;
SELECT COUNT(*) INTO vId FROM producto WHERE id_producto = p_id;

IF vId != 0 THEN
	SET error_id =0;
	SELECT estado INTO vEstado FROM producto WHERE id_producto = p_id;
		IF vEstado = 1 THEN 
			UPDATE producto
			SET estado = 0
            WHERE id_producto = p_id;
		ELSE
			UPDATE producto
			SET estado = 1
            WHERE id_producto = p_id;
		END IF;
ELSE
	SET error_id =1;
END IF;
END //

-- DROP´s DE PROCEDIMIENTOS DE PRODUCTO

DROP PROCEDURE find_all;
DROP PROCEDURE find_byId;
DROP PROCEDURE registrar_producto;
DROP PROCEDURE actualizar_producto;
DROP PROCEDURE eliminar_producto;

-- UTILIZACION DE PROCEDIMIENTO

-- REGISTRAR
CALL registrar_producto(
"Pluma",
"BIC",
8, 
15,
3,
@errores, 
@nombre,
@categoria
)
SELECT @errores
SELECT @nombre
SELECT @categoria

-- FIND ALL
CALL find_all
INSERT INTO categoria(nombre_categoria) VALUES("Liquidos")
INSERT INTO categoria(nombre_categoria) VALUES("Marcas")

-- FIND BY ID 

CALL find_byId(2)

-- ACTUALIZAR

CALL actualizar_producto(
1, 
"Goma",
"Maped",
40, 
50,
3, 
@errores,
@errorNombre,
@errorCategoria,
@errorId
)

SELECT @errores
SELECT @errorNombre
SELECT @errorCategoria
SELECT @errorId

-- ELIMINAR
CALL eliminar_producto(
2, 
@errorId
)

SELECT @errorId

