   

    
    
    const ValidarNombre = (campo) =>  {
        const REGEX_NOMBRE_VALIDO = new RegExp('^[a-zA-Z\\xC0-\\uFFFF][a-zA-Z\\xC0-\\uFFFF-]+( [a-zA-Z\\xC0-\\uFFFF-]+)*$')
        const REGEX_CADENA_VACIA = new RegExp('^[\\s.\\-_]*$')
        const MAXIMO_CARACTERES_NOMBRE = 45


        if (REGEX_CADENA_VACIA.test(campo) || campo ==  undefined) return "Campo obligatorio"
        if (!REGEX_NOMBRE_VALIDO.test(campo)) return "Ingresa un nombre válido"
        if (campo.length > MAXIMO_CARACTERES_NOMBRE) return `Máximo ${MAXIMO_CARACTERES_NOMBRE} caracteres`
        return null
    }
    const ValidarMarca = (campo) =>  {
        const REGEX_NOMBRE_VALIDO = new RegExp('^[a-zA-Z\\xC0-\\uFFFF][a-zA-Z\\xC0-\\uFFFF-]+( [a-zA-Z\\xC0-\\uFFFF-]+)*$')
        const REGEX_CADENA_VACIA = new RegExp('^[\\s.\\-_]*$')
        const MAXIMO_CARACTERES_MARCA = 45

        if (REGEX_CADENA_VACIA.test(campo) || campo ==  undefined ) return "Campo obligatorio"
        if (!REGEX_NOMBRE_VALIDO.test(campo)) return "Ingresa un marca"
        if (campo.length > MAXIMO_CARACTERES_MARCA) return `Máximo ${MAXIMO_CARACTERES_NOMBRE} caracteres`
        return null
    }
    const ValidarPrecio = (precio) => {
        const REGEX_CADENA_VACIA = new RegExp('^[\\s.\\-_]*$')
        const REGEX_NUMERO_PRECIO = new RegExp("^[0-9,$]*$")
        const REGEX_NUMERO_DECIMAL = new RegExp("/^\d*\.?\d*$/")


        if (REGEX_CADENA_VACIA.test(precio) || precio ==  undefined) return "Campo obligatorio"
        if (!REGEX_NUMERO_PRECIO.test(precio)) return "Ingresa un número válido"
        if (REGEX_NUMERO_DECIMAL.test(precio)) return "Ingresa un número entero"
        return null
    }

    const ValidarCantidad = (cantidad) => {
        const REGEX_CADENA_VACIA = new RegExp('^[\\s.\\-_]*$')
        const REGEX_NUMERO_CANTIDAD = new RegExp("^[0-9,$]*$")
        const REGEX_NUMERO_DECIMAL = new RegExp("/^\d*\.?\d*$/")


        if (REGEX_CADENA_VACIA.test(cantidad) || cantidad ==  undefined ) return "Campo obligatorio"
        if (!REGEX_NUMERO_CANTIDAD.test(cantidad)) return "Ingresa un número válido"
        if (REGEX_NUMERO_DECIMAL.test(cantidad)) return "Ingresa un número entero"
        return null
    }

    const ValidarCategoria = (categoria) =>  {
        const REGEX_CADENA_VACIA = new RegExp('^[\\s.\\-_]*$')
        const REGEX_NUMERO_DECIMAL = new RegExp("/^\d*\.?\d*$/")


        if (REGEX_CADENA_VACIA.test(categoria) || categoria ==  undefined) return "Campo obligatorio"
        if (REGEX_NUMERO_DECIMAL.test(categoria.id)) return "Ingresa un categoría válida"
        return null
    }

    const ValidarSame = (valorNuevo, valorAnterior) =>{
        if(valorNuevo === valorAnterior) return true
        return false
    }

    const ObtenerFecha = (tiempoJava)  =>{
        const tiempo = new Date(tiempoJava)
        return '' + tiempo.getDate() + ' de ' + ({
            0: 'enero',
            1: 'febrero',
            2: 'marzo',
            3: 'abril',
            4: 'mayo',
            5: 'junio',
            6: 'julio',
            7: 'agosto',
            8: 'septiembre',
            9: 'octubre',
            10: 'noviembre',
            11: 'diciembre'
        })[tiempo.getMonth()] + ' de ' + tiempo.getFullYear()
    }
   
