-- ¿Cuáles fueron los 3 años con menor cantidad de agua en el embalse (separados por región)?
WITH RankingSeca AS (
    SELECT 
        *,
        ROW_NUMBER() OVER(PARTITION BY Comunidad ORDER BY Volume_Agua_hm3 ASC) as Posicao
    FROM [tabela_master_seca_completa_FINAL]
)
SELECT * 
FROM RankingSeca
WHERE Posicao <= 3;

-- ¿Cuál fue la cantidad de agua utilizada en la agricultura en esas regiones durante esos años más críticos?

SELECT 
    Comunidad, 
    Ano, 
    Volume_Agua_hm3 
FROM 
    [tabela_master_seca_agricultura(1)]
WHERE 
    Comunidad IN ('Andalucía', 'Comunitat Valenciana', 'Región de Murcia')
    AND Ano IN (2015, 2016, 2018)
ORDER BY 
    Comunidad, Ano ASC

-- ¿Cuáles fueron los tres años con la escasez hídrica más grave y cuál fue la cifra exacta de turismo en esos mismos años?

WITH PioresAnosTurismo AS (
    SELECT 
        Indicador,
        Ano,
        Valor AS Indice_Turismo,
        Volume_Agua_hm3 AS Nivel_Agua_Reservatorio,
        ROW_NUMBER() OVER(PARTITION BY Indicador ORDER BY Volume_Agua_hm3 ASC) as Posicao
    FROM tabela_master_seca_turismo
)
SELECT 
    Indicador,
    Ano,
    Indice_Turismo,
    Nivel_Agua_Reservatorio
FROM PioresAnosTurismo
WHERE Posicao <= 3
ORDER BY Indicador, Posicao;

--¿Se vieron afectados los embalses de agua cuando la región se llenó por completo de turistas (Top 3)? 

WITH PicosDeTurismo AS (
    SELECT 
        Indicador,
        Ano,
        Valor AS Volume_Turistas,
        Volume_Agua_hm3 AS Nivel_Represa,
        ROW_NUMBER() OVER(PARTITION BY Indicador ORDER BY Valor DESC) as Posicao_Pico_Turismo
    FROM tabela_master_seca_turismo
)
SELECT 
    Indicador,
    Ano,
    Volume_Turistas,
    Nivel_Represa
FROM PicosDeTurismo
WHERE Posicao_Pico_Turismo <= 3
ORDER BY Indicador, Posicao_Pico_Turismo;

-- Tendencia a largo plazo

SELECT Comunidad, Ano, AVG(Volume_Agua_hm3) AS VolumeMedio
FROM tabela_master_seca_completa_FINAL
GROUP BY Comunidad, Ano
ORDER BY Comunidad, Ano    

-- Qué parte del agua disponible se destina a la agricultura frente al turismo

SELECT a.Comunidad, a.Ano, 
    a.Volume_Agua_Agricola,
    f.Volume_Agua_hm3 AS VolumeTotalDisponible,
    (a.Volume_Agua_Agricola * 100.0 / NULLIF(f.Volume_Agua_hm3, 0)) AS PorcentajeUsoAgricola
FROM [tabela_master_seca_agricultura(1)] a
JOIN tabela_master_seca_completa_FINAL f ON a.Ano = f.Ano
ORDER BY a.Ano

SELECT a.Indicador, a.Ano, 
    a.Valor,
    f.Volume_Agua_hm3 AS VolumeTotalDisponible,
    (a.Valor * 100.0 / NULLIF(f.Volume_Agua_hm3, 0)) AS PorcentajeUsoTurismo
FROM [tabela_master_seca_turismo] a
JOIN tabela_master_seca_completa_FINAL f ON a.Ano = f.Ano
ORDER BY a.Ano

SELECT DISTINCT Ano FROM tabela_master_seca_turismo ORDER BY Ano
SELECT DISTINCT Ano FROM tabela_master_seca_completa_FINAL ORDER BY Ano

-- Evolución del turismo a lo largo de los años (tendencia)

SELECT Ano, Indicador, SUM(Valor) AS TotalTuristas
FROM tabela_master_seca_turismo
GROUP BY Ano, Indicador
ORDER BY Ano

SELECT Ano, Indicador, Valor
FROM tabela_master_seca_turismo
WHERE Indicador IN (
    'Alicante. Viajeros. Total.',
    'Almería. Viajeros. Total.',
    'Murcia (Región de). Viajeros. Total.'
)
ORDER BY Ano, Indicador