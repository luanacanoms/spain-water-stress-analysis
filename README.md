Estrés Hídrico en el Sureste de España — Alicante, Almería y Murcia

Análisis del estrés hídrico en una de las regiones más afectadas de Europa por la escasez de agua, cruzando datos de disponibilidad hídrica, agricultura de regadío y turismo. Parte de un portafolio de análisis de datos centrado en problemáticas reales de España (vivienda, clima y ahora recursos hídricos).

Contexto del proyecto

Este proyecto forma parte de un portafolio más amplio sobre problemáticas reales de España:
1. Mercado de vivienda (Barcelona y Madrid) — SQL, Tableau, Excel y Machine Learning
2. Calor extremo y mortalidad (Córdoba y Sevilla) — Python, SQL y Power BI
3. Estrés hídrico (Alicante, Almería y Murcia) — ¿cómo se relacionan la disponibilidad de agua, la agricultura intensiva y la presión turística en una de las regiones más secas de Europa?

Fuente de datos

Datos reales y oficiales combinando tres fuentes:
- Agua embalsada: Datadista / Confederación Hidrográfica del Segura (CHSegura)
- Agricultura (superficie de regadío): Instituto Nacional de Estadística (INE) — Censo Agrario (1999, 2009, 2020)
- Turismo (viajeros y pernoctaciones): Instituto Nacional de Estadística (INE) — Encuesta de Ocupación Hotelera (2021-2025)

Preparación de los datos

- Extracción: descarga y limpieza en Python (Pandas) de tres fuentes independientes con estructuras y formatos distintos
- Estandarización: corrección de nombres de provincias/comunidades inconsistentes entre fuentes, tratamiento de formato decimal
- Estructuración en SQL Server: creación de tablas independientes por fuente y consultas de cruce por año y provincia

Limitación metodológica (nota de transparencia)

Las tres fuentes cubren periodos temporales distintos: el histórico de agua es el más amplio pero sin desglose por provincia; la agricultura solo cuenta con 3 años disponibles (1999, 2009, 2020); el turismo solo tiene datos recientes (2021-2025). Ante la falta de solapamiento temporal completo, se priorizó el análisis independiente de cada fuente frente a correlaciones forzadas sin respaldo real en los datos.

Hallazgos principales

- Pico histórico de agua embalsada: 2013, con la reserva superando los 2.000 hm³
- Peores años de estrés hídrico: 2008, 2016 y 2018, con niveles por debajo de los 1.000 hm³
- Demanda agrícola por comunidad: Andalucía concentra el 63,66% del volumen total (161 millones de m³), seguida de la Comunitat Valenciana con el 27,37% (69 millones) y la Región de Murcia con el 8,97% (23 millones)
- Crecimiento explosivo del turismo: el flujo turístico anual pasó de aproximadamente 35 millones en 2021 a 85 millones en 2025 — un incremento superior al 140% en apenas 4 años, justo cuando la disponibilidad de agua se mantiene bajo presión histórica

Visualizaciones

- Dashboard interactivo en Power BI con evolución del agua embalsada, superficie de regadío por provincia y flujo turístico

Tecnologías utilizadas

- Python: Pandas (extracción y limpieza)
- SQL Server: estructuración y análisis exploratorio
- Power BI: dashboard interactivo

Autora
Luana de Morais Cano — Estudiante de Ingeniería Informática en Tecnologías de la Información, Universidad Miguel Hernández de Elche (UMH)
