# Proyecto Base de Datos – Agricultura

## Introducción
Este proyecto consiste en el diseño y creación de una base de datos para la gestión agrícola, orientada a registrar y administrar información relacionada con cultivos, lotes, insumos, aplicaciones, condiciones climáticas, siembras, rendimientos y trabajadores. Esta estructura permite gestionar información de forma centralizada y facilita el análisis para la toma de decisiones, optimizando recursos, mejorando la planificación y evaluando los resultados productivos.

## Objetivo
El objetivo principal es implementar un sistema de base de datos que permita almacenar y relacionar información fundamental para la gestión agrícola, cubriendo aspectos de logística (control de insumos y aplicaciones), seguimiento de la producción (siembras, rendimientos), y variables ambientales (clima), integrando datos que pueden ser utilizados para análisis contables, operativos y analíticos en el sector agrícola.

## Situación Problemática
En la gestión agrícola tradicional, la información suele estar dispersa en diferentes formatos y sistemas, lo que dificulta el acceso rápido y confiable a datos actualizados sobre cultivos, insumos, condiciones climáticas y rendimientos. Esta falta de integración provoca ineficiencias en la toma de decisiones, pérdidas de recursos y dificultades para planificar y optimizar la producción. La implementación de una base de datos estructurada permite solucionar estas brechas, centralizando la información y facilitando su consulta y análisis, mejorando así la gestión agrícola y su productividad.

## Modelo de Negocio
La solución planteada está dirigida a una empresa agrícola que se dedica al cultivo y producción de diversos tipos de productos agrícolas. Esta organización requiere gestionar de manera eficiente sus recursos, incluyendo lotes de tierra, cultivos, siembras, insumos, trabajadores y rendimientos.
El modelo de negocio se centra en la planificación, seguimiento y optimización de la producción agrícola mediante el uso de una base de datos que integra:
-Información detallada de lotes y cultivos.
-Control de insumos aplicados en cada siembra.
-Registro del personal involucrado en las tareas agrícolas.
-Seguimiento de las condiciones climáticas que afectan la producción.
-Registro de rendimientos obtenidos para analizar la eficiencia productiva.
-Esta base de datos permitirá a la empresa mejorar su gestión logística, financiera y analítica, facilitando la toma de decisiones basada en datos reales y actualizados.

## Diagrama Entidad–Relación
A continuación se presenta el diagrama E–R del modelo de base de datos, que representa las entidades, sus atributos y relaciones.

![Diagrama E–R](diagrama_entidad_relacion.png)

## Listado de tablas

### Tabla "lotes"
- **Clave primaria:** `id_lote` (identificador único de cada lote).  
- **Campos principales:** `numero_lote` (código del lote), `ubicacion`, `hectareas`, `tipo_suelo`.  
- La clave primaria `id_lote` garantiza la unicidad de cada lote dentro de la base.  
- Esta tabla almacena información sobre cada parcela de terreno utilizada para cultivo.

### Tabla "cultivos"
- **Clave primaria:** `id_cultivo` (identificador único del cultivo).  
- **Campos principales:** `nombre_cultivo`.  
- La clave primaria permite identificar cada tipo de cultivo registrado.  
- Contiene el listado de los cultivos que se siembran en los lotes.

### Tabla "siembras"
- **Clave primaria:** `id_siembra` (identificador único de la siembra).  
- **Claves foráneas:** `id_lote` (referencia a la tabla lotes), `id_cultivo` (referencia a la tabla cultivos).  
- **Campos principales:** `ubicacion` (localidad o zona), `fecha_siembra`.  
- La clave primaria `id_siembra` distingue cada evento de siembra.  
- Relaciona un lote con un cultivo en un momento determinado.

### Tabla "trabajadores"
- **Clave primaria:** `id_trabajador` (identificador único del trabajador).  
- **Campos principales:** `nombre`, `apellido`, `dni`, `telefono`, `rol`, `fecha_ingreso`.  
- Almacena información del personal involucrado en las tareas agrícolas.

### Tabla "insumos"
- **Clave primaria:** `id_insumo` (identificador único del insumo).  
- **Campos principales:** `nombre`, `tipo`, `cantidad_unidad`, `fecha_adquisicion`.  
- Registra los insumos disponibles para las siembras, como fertilizantes, semillas, etc.

### Tabla "aplicaciones_insumos"
- **Clave primaria:** `id_aplicacion` (identificador único de la aplicación).  
- **Claves foráneas:** `id_siembra` (referencia a siembras), `id_insumo` (referencia a insumos).  
- **Campos principales:** `fecha_aplicacion`, `cantidad_usada`.  
- Registra el uso de insumos específicos en cada siembra, con cantidades y fechas.

### Tabla "clima"
- **Clave primaria:** `id_clima` (identificador único del registro climático).  
- **Clave foránea:** `id_lote` (referencia a lotes).  
- **Campos principales:** `campana`, `temperatura_promedio`, `precipitacion_mm`, `humedad_relativa`, `radiacion_solar`.  
- Guarda datos climáticos por campaña para cada lote.

### Tabla "rendimientos"
- **Clave primaria:** `id_rendimiento` (identificador único del registro de rendimiento).  
- **Clave foránea:** `id_siembra` (referencia a siembras).  
- **Campos principales:** `fecha_cosecha`, `toneladas_obtenidas`, `observaciones`.  
- Almacena el resultado de cada siembra en toneladas cosechadas y notas adicionales.

## Script SQL

El script de creación de la base de datos y tablas se encuentra en el archivo [`script_primera_entrega.sql`](script_primera_entrega.sql)
Este script contiene las instrucciones SQL para crear todas las tablas, claves primarias, foráneas, y relaciones definidas en el proyecto.









