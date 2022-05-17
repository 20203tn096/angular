
const REGEX_NOMBRE_VALIDO = new RegExp('^[a-zA-Z\\xC0-\\uFFFF][a-zA-Z\\xC0-\\uFFFF-]+( [a-zA-Z\\xC0-\\uFFFF-]+)*$')
const REGEX_CADENA_VACIA = new RegExp('^[\\s.\\-_]*$')
const REGEX_NUMERO_EDAD = new RegExp("/^[0-9]+$/;")


const ValidacionesUsuario = {
    ValidarNombre: (campo) => {
        if (!REGEX_CADENA_VACIA.test(campo)) return "Campo obligatorio"
        if (!REGEX_NOMBRE_VALIDO.test(campo)) return "Ingresa un nombre válido"
        return null
    },
    ValidarCampo : (campo) =>{
        if (!REGEX_CADENA_VACIA.test(campo)) return "Campo obligatorio"
        return null 
    },
    ValidarEdad : (edad) =>{
        if (!REGEX_CADENA_VACIA.test(campo)) return "Campo obligatorio"
        if(!REGEX_NUMERO_EDAD.test(edad)) return "Ingresa un número válido"
        return null
    }
}

