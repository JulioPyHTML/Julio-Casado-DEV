# Kit de soporte técnico — Windows y redes

**Estado:** kit inicial. La estructura y el script de diagnóstico son una base para ampliar y validar; no se distribuyen controladores ni instaladores de terceros.

## Objetivo

Reunir documentación y utilidades para tareas habituales de soporte a computadoras Windows y diagnóstico básico de conectividad en redes locales.

## Estructura prevista

- scripts/: scripts propios de diagnóstico.
- drivers/: controladores obtenidos desde fuentes oficiales del fabricante (no incluidos).
- manuales-dvr/: manuales de los equipos utilizados.
- utilidades/: herramientas autorizadas de soporte.
- documentacion/: procedimientos y notas técnicas.

## Script disponible

scripts/diagnostico-red.ps1 recopila información local de adaptadores, configuración IP, puertas de enlace y resolución DNS. No modifica la configuración del equipo ni realiza exploraciones de redes.

### Ejecución

1. Abre PowerShell en Windows 10 u 11.
2. Navega a la carpeta del script.
3. Ejecuta el archivo diagnostico-red.ps1 desde PowerShell.

El informe se guarda junto al script. Si la política de ejecución de PowerShell impide iniciarlo, utiliza el procedimiento aprobado por el administrador del equipo; no cambies políticas corporativas sin autorización.

## Privacidad y seguridad

El informe puede contener direcciones IP privadas, nombres de adaptadores, DNS y otros datos de la red local. Revísalo y elimina información sensible antes de compartirlo.

Descarga drivers y utilidades exclusivamente desde los sitios oficiales de los fabricantes o repositorios autorizados. No ejecutes herramientas de diagnóstico en redes ajenas sin permiso.

## Próximas mejoras

- Añadir procedimientos de instalación de drivers por fabricante y modelo.
- Documentar configuración de IP dinámica y estática.
- Incorporar guías de conectividad DVR/cámaras.
- Probar el script en distintas versiones de Windows y añadir ejemplos de informes anonimizados.
