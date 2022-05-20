

-- PROCEDIMIENTO

-- CONSULTAR TODAS
DELIMITER //
CREATE PROCEDURE find_all_categorias(
)
BEGIN
SELECT * FROM categoria;
END //

-- CONSULTAR UNA
DELIMITER //
CREATE PROCEDURE find_byId_categorias(
IN p_id INT, 
OUT p_error INT, 
OUT error_id INT
)
BEGIN
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
END //


-- CONSULTAR ACTIVAS
DELIMITER //
CREATE PROCEDURE find_activas(
)
BEGIN
SELECT * FROM categoria WHERE estado = 1;
END //


-- REGISTRAR CATEGORIA

DELIMITER //
CREATE PROCEDURE registrar_categoria(
IN p_nombre VARCHAR(20),
OUT p_error INT, 
OUT error_nombre INT
)
BEGIN
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

END //

-- ACTUALIZAR CATEGORIA
DELIMITER //
CREATE PROCEDURE actualizar_categoria(
IN p_id INT,
IN p_nombre VARCHAR(20),
OUT p_error INT, 
OUT error_nombre INT,
OUT error_id INT
)
BEGIN
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
END //

-- ELIMINAR O REACTIVAR CATEGORIA 

DELIMITER //
CREATE PROCEDURE eliminar_categoria(
IN p_id INT, 
OUT p_error INT,
OUT error_foranea INT,
OUT error_id INT
)
BEGIN 
DECLARE vId INT;
DECLARE vForanea INT;
DECLARE vEstado INT;

SELECT COUNT(*) INTO vId FROM categoria WHERE id_categoria = p_id;
SELECT COUNT(*) INTO vForanea FROM producto WHERE categoria_id = p_id;
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

END //


-- DROP´S DE LOS PROCEDIMIENTOS
DROP PROCEDURE find_all_categorias;
DROP PROCEDURE find_activas;
DROP PROCEDURE registrar_categoria;
DROP PROCEDURE actualizar_categoria;
DROP PROCEDURE eliminar_categoria;

-- INSERCION DE EJEMPLO
	INSERT INTO categoria(nombre_categoria, estado ) VALUES ("Materiales", 1 )
    INSERT INTO categoria(nombre_categoria, estado ) VALUES ("Videos", 0 )
-- UTILIZACION DE LOS PROCEDIMIENTOS

-- FIND ALL
CALL find_all_categorias()

-- FIND BY ID 
CALL find_byId_categorias(
1,
@errores,
@errorId
)

SELECT @errores;
SELECT @errorId;

-- FIND ACTIVAS
CALL find_activas;

-- REGISTRO DE CATEGORIA 
CALL registrar_categoria (
"Utiles",
@errores, 
@errorNombre
)

SELECT @errores
SELECT @errorNombre

-- ACTUALIZAR CATEGORIAS
CALL actualizar_categoria(
5,
"Parametros",
@errores, 
@errorNombre,
@errorId
)

SELECT @errores
SELECT @errorNombre
SELECT @errorId

-- ELIMINAR O REACTIVAR CATEGORIA
CALL eliminar_categoria(
1, 
@errores,
@errorForanea,
@errorId
)

SELECT @errores
SELECT @errorForanea
SELECT @errorId