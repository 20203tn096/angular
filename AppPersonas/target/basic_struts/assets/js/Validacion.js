   

    
    
    const ValidarNombre = (campo) =>  {
        const REGEX_NOMBRE_VALIDO = new RegExp('^[a-zA-Z\\xC0-\\uFFFF][a-zA-Z\\xC0-\\uFFFF-]+( [a-zA-Z\\xC0-\\uFFFF-]+)*$')
        const REGEX_CADENA_VACIA = new RegExp('^[\\s.\\-_]*$')
        console.log("Campo", campo);
        console.log(REGEX_CADENA_VACIA.test(campo));
        if (REGEX_CADENA_VACIA.test(campo)) return "Campo obligatorio"
        if (!REGEX_NOMBRE_VALIDO.test(campo)) return "Ingresa un nombre válido"
        if (campo.length > 45) return "Máximo 45 caracteres"
        return null
    }
    const ValidarApellido = (campo) =>  {
        const REGEX_NOMBRE_VALIDO = new RegExp('^[a-zA-Z\\xC0-\\uFFFF][a-zA-Z\\xC0-\\uFFFF-]+( [a-zA-Z\\xC0-\\uFFFF-]+)*$')
        const REGEX_CADENA_VACIA = new RegExp('^[\\s.\\-_]*$')
        console.log("Campo", campo);
        console.log(REGEX_CADENA_VACIA.test(campo));
        if (REGEX_CADENA_VACIA.test(campo)) return "Campo obligatorio"
        if (!REGEX_NOMBRE_VALIDO.test(campo)) return "Ingresa un apellido válido"
        if (campo.length > 45) return "Máximo 45 caracteres"
        return null
    }
    const ValidarCampo = (campo) => {
        const REGEX_CADENA_VACIA = new RegExp('^[\\s.\\-_]*$')

        if (REGEX_CADENA_VACIA.test(campo)) return "Campo obligatorio"
        if (campo.length > 45) return "Máximo 45 caracteres"
        return null
    }

    const ValidarEdad = (edad) => {
        const REGEX_CADENA_VACIA = new RegExp('^[\\s.\\-_]*$')
        const REGEX_NUMERO_EDAD = new RegExp("^[0-9,$]*$")

        if (REGEX_CADENA_VACIA.test(edad)) return "Campo obligatorio"
        if (!REGEX_NUMERO_EDAD.test(edad)) return "Ingresa un número válido"
        return null
    }

    const isSame = (valorNuevo, valorAnterior) =>{
        if(valorNuevo === valorAnterior) return true
        return false
    }
   
