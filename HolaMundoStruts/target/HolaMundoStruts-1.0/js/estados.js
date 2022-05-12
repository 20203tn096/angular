const estados = [
    { "clave": "AS", "nombre": "AGUASCALIENTES" },
    { "clave": "BC",  "nombre": "BAJA CALIFORNIA" },
    { "clave": "BS", "nombre": "BAJA CALIFORNIA SUR" },
    { "clave": "CH", "nombre": "CHIHUAHUA" },
    { "clave": "CS", "nombre": "CHIAPAS" },
    { "clave": "CC", "nombre": "CAMPECHE" },
    { "clave": "CX", "nombre": "CIUDAD DE MEXICO" },
    { "clave": "CL", "nombre": "COAHUILA" },
    { "clave": "CM", "nombre": "COLIMA" },
    { "clave": "DG", "nombre": "DURANGO" },
    { "clave": "GR", "nombre": "GUERRERO" },
    { "clave": "GT", "nombre": "GUANAJUATO" },
    { "clave": "HG", "nombre": "HIDALGO" },
    { "clave": "JC", "nombre": "JALISCO" },
    { "clave": "MN", "nombre": "MICHOACAN" },
    { "clave": "MC", "nombre": "ESTADO DE MEXICO" },
    { "clave": "MS", "nombre": "MORELOS" },
    { "clave": "NT", "nombre": "NAYARIT" },
    { "clave": "NL",  "nombre": "NUEVO LEON" },
    { "clave": "OC", "nombre": "OAXACA" },
    { "clave": "PL", "nombre": "PUEBLA" },
    { "clave": "QR",  "nombre": "QUINTANA ROO" },
    { "clave": "QT", "nombre": "QUERETARO" },
    { "clave": "SL", "nombre": "SINALOA" },
    { "clave": "SP", "nombre": "SAN LUIS POTOSI" },
    { "clave": "SR", "nombre": "SONORA" },
    { "clave": "TC", "nombre": "TABASCO" },
    { "clave": "TL", "nombre": "TLAXCALA" },
    { "clave": "TS", "nombre": "TAMAULIPAS" },
    { "clave": "VZ", "nombre": "VERACRUZ" },
    { "clave": "YN", "nombre": "YUCATAN" },
    { "clave": "ZS", "nombre": "ZACATECAS" },
    {"clave": "NE", "nombre": "NACIDO EN EL EXTRANJERO"}
]


const select  = document.querySelector("#entidad");

select.innerHTML = ""

estados.map((estados) =>{
    select.innerHTML += `
    <option value="${estados.clave}" style="width: 200px;">${estados.nombre}</option>
    `
})