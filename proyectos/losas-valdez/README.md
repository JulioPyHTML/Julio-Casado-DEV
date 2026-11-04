# Losas Valdez — Control de cotizaciones en Excel

**Estado:** prototipo inicial. Requiere integrarse en un libro de Excel y probarse con datos reales antes de usarse en producción.

## Objetivo

Documentar una solución de escritorio en Excel para registrar medidas de losas, calcular áreas, estimar costos y obtener un precio final que incluya ITBIS.

## Alcance previsto

- Captura de medidas y área.
- Cálculo de costo según precio por metro cuadrado.
- Cálculo separado de subtotal, ITBIS y total.
- Tabla de registros para consultar cotizaciones.
- Macros para agregar registros y limpiar el formulario.
- Resumen de cotizaciones y opción de tabla dinámica.

## Archivos

- vba/modCalculoLosa.bas: módulo VBA inicial con funciones separadas para subtotal, ITBIS y total.

## Importación del módulo

1. Abre el libro en Excel de escritorio y guárdalo como XLSM.
2. Pulsa Alt + F11 para abrir el editor de Visual Basic.
3. Selecciona File → Import File... y elige modCalculoLosa.bas.
4. En la hoja de configuración, define la tasa de ITBIS que utilizará el negocio.
5. Conecta las funciones a las celdas del formulario y valida los resultados con cotizaciones de prueba.

## Fórmulas del prototipo

- **Subtotal:** área × costo por m².
- **ITBIS:** subtotal × tasa configurada.
- **Total:** subtotal + ITBIS.

La tasa no está fijada en el código: debe configurarse y verificarse según la operación y la normativa aplicable al negocio.

## Próximas mejoras

- Crear el formulario visual y las tablas.
- Añadir las macros de alta y limpieza de registros.
- Validar campos vacíos, valores negativos y redondeos.
- Probar resultados y documentar capturas del libro terminado.

**Nota:** este repositorio contiene una base de trabajo; no incluye todavía un archivo XLSM terminado.
