USE EXERCICIOS_GOOGLE

SELECT 
*,
DATEDIFF(MINUTE, started_at, ended_at) AS diff_minutes
FROM [Dados Empresa de Ciclistas(Recuperado Automaticamente)(2)]
ORDER BY diff_minutes DESC;

SELECT 
user_type,
MAX(DATEDIFF(DAY, started_at, ended_at)) AS max_diff_minutes
FROM [Dados Empresa de Ciclistas(Recuperado Automaticamente)(2)]
GROUP BY user_type;
/* Pegando o Tempo Maximo que os tipos de usuario tiveram com as Bikes por Dia*/

SELECT 
	*,
	DATEDIFF(MINUTE, started_at, ended_at) AS num_menor_0
FROM [Dados Empresa de Ciclistas(Recuperado Automaticamente)(2)]
WHERE DATEDIFF(MINUTE, started_at, ended_at) < 0;
-- Pegando numero inconcistentes de tempo de viagem que sao menores que 0 

SELECT 
	user_type,
	ROUND(AVG((DATEDIFF(MINUTE, started_at, ended_at))),1) AS median_user_type_diff_minutes
FROM [Dados Empresa de Ciclistas(Recuperado Automaticamente)(2)]
GROUP BY user_type ORDER BY median_user_type_diff_minutes DESC;
--	Media de Tempo com as Bikes por tipo de Usuario em Minutos

SELECT 
	ROUND(AVG((DATEDIFF(MINUTE, started_at, ended_at))),3) AS total_median_diff_minutes
FROM [Dados Empresa de Ciclistas(Recuperado Automaticamente)(2)];
--	Media de Tempo com as Bikes por tipo de Usuario em Minutos

SELECT 
	user_type,
	PERCENTILE_CONT(0.5) 
		WITHIN GROUP (ORDER BY (DATEDIFF(MINUTE, started_at, ended_at))) 
		OVER (PARTITION BY user_type) AS median
FROM [Dados Empresa de Ciclistas(Recuperado Automaticamente)(2)]
-- Calculando a mediana de minutos por tipo de usuario 


SELECT 
	PERCENTILE_CONT(0.5) 
		WITHIN GROUP (ORDER BY (DATEDIFF(MINUTE, started_at, ended_at))) 
		OVER () AS median
FROM [Dados Empresa de Ciclistas(Recuperado Automaticamente)(2)]
-- Calculando a mediana de minutos geral 

SELECT 
trip_id,
COUNT(trip_id) AS count_trip_unique_trip_id
FROM [Dados Empresa de Ciclistas(Recuperado Automaticamente)(2)]
GROUP BY trip_id ORDER BY count_trip_unique_trip_id DESC;
-- Pessoas que mais alugam as bikes 

