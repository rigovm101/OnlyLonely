#  OnlyLonely
# Proyecto Final Diseño de Compiladores
## Rigoberto Valadez Mena

### Guía de Inicio
Para poder utilizar este compilador es necesario utilizar una Mac con macOS Big Sur 11.0 o superior, así como Xcode 12.0 o superior.
Para empezar abre el archivo *OnlyLonely.xcodeproj*

### Lenguaje OnlyLonely
El lenguaje de programación **TheOnlyLonely** es un lenguaje secuencial con soporte de funciones. La estructura básica de un programa es:

`programa theOnlyLonely;`
`principal(){`
`escribe("Hola Mundo");`
`}`


### Estructura de un Programa

1. Nombre del programa
2. Declaración de Variables Globales (*Opcional*)
3. Declaración de Funciones (*Opcional*)
4. Función Principal

### Declaración de Variables Globales
`variables `
`a[2][2], b, c : entero;`
`x, y, z[4] : flotante;` 

### Declaración de Funciones
1. Tipo de Retorno
2. Funcion
3. Parametros
4. Variables locales
5. Estatutos

`void miFuncion(a : entero)`
`variables x : entero;`
`{`
`escribe(a);`
`}`

### Estatutos
**Asignación:** Asigna un valor a una variable.
`id = 10;`
`id[0] = 0;`
`id[0][0] = 0;`

**Llamada a Función Void:** Ejecuta una función
`miFuncion();`
`miFuncion(a, b);`

**Retorno de una Función:** Regresa un valor en funciones con tipo de retorno
`regresa(a);`

**Lectura:** Lee de la consola un valor
`lee(miVariable);`

**Escritura:** Escribe en consola un letrero o el valor de una variable
`escribe("Hola");`
`escribe(miVar, "Adios");`

**Estatuto de Desición:** Estatuto condicional
`si (a < b) entonces `
`{ escribe(a); }`

Puede tener un "sino"

`si (a < b) entonces `
`{ escribe(b); }`
`sino { escribe(a); }`

**Estatuto Mientras:** Estatuto de repetición
`mientras (a < b) hacer {`
`a = a + 1`
`}`

**Estatuto Desde:** Estatuto de repetición
`desde i = 0 hasta 5 hacer {`
`escribe("hola");`
`}`

### Como Compilar y Correr en Xcode
1. Abrir el proyecto *OnlyLonely.xcodeproj*
2. Abrir el archivo *main.swift* dentro de la carpeta *OnlyLonely*
3. Escribir el programa dentro de la constante `input`
4. Presionar el botón de *Play* en la barra superior
