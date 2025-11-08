CREATE TABLE Dados_Empresa_de_Ciclistas (

	user_type VARCHAR(100),
	trip_id VARCHAR(100) PRIMARY KEY NOT NULL,
	start_station_name VARCHAR(100),
	start_station_id INT,
	started_at DATETIME,
	end_station_name VARCHAR(100),
	end_station_id INT,
	ended_at DATETIME,
	gender VARCHAR(50),
	day_of_week INT,
	diff_trip_duration INT

)



INSERT INTO Dados_Empresa_de_Ciclistas (
	user_type,
	trip_id,
	start_station_name,
	start_station_id ,
	started_at ,
	end_station_name ,
	end_station_id ,
	ended_at ,
	gender ,
	day_of_week ,
	diff_trip_duration

)


SELECT 
	user_type,
	trip_id,
	start_station_name,
	start_station_id ,
	started_at ,
	end_station_name ,
	end_station_id ,
	ended_at ,
	gender ,
	day_of_week ,
	DATEDIFF(MINUTE, started_at, ended_at)
FROM [Dados Empresa de Ciclistas(Recuperado Automaticamente)(2)]
WHERE DATEDIFF(MINUTE, started_at, ended_at) > 0 


SELECT * 

FROM Dados_Empresa_de_Ciclistas


