# Estudo-de-Caso-Empresa-de-Ciclismo-
Este é o meu estudo de caso sobre uma empresa fictícia de compartilhamento de bicicletas, com sede na cidade de Chicago, abrangendo os primeiros semestres de 2019 e 2020. Neste projeto, apliquei os conceitos aprendidos no módulo inicial de Análise de Dados do Google, utilizando as principais etapas do processo analítico: Ask, Prepare, Process, Analyze, Share e Act.

O objetivo deste estudo é analisar as diferenças de comportamento entre ciclistas casuais e membros anuais da empresa Cyclistic, identificando padrões de uso que possam orientar a criação de estratégias eficazes para converter ciclistas casuais em membros anuais. Essa conversão é essencial para aumentar a lucratividade e fortalecer o crescimento sustentável da empresa.

Perguntas Orientadoras de Negócios: Três perguntas guiarão o futuro programa de marketing:
* Como os membros anuais e os ciclistas casuais usam as bicicletas Cyclistic de forma diferente? 
* Por que os ciclistas casuais comprariam associações anuais da Cyclistic? 
* Como a Cyclistic pode usar a mídia digital para influenciar os ciclistas casuais a se tornarem membros?

# Primeira Fase : Tratamento dos dados e juncao das tabelas com excel 

Neste estudo de caso, sou responsável por responder à seguinte pergunta:
“Como os membros anuais e os ciclistas casuais usam as bicicletas da Cyclistic de forma diferente?”

Para realizar essa análise, é fundamental compreender o contexto da empresa, bem como identificar os dados necessários para responder à questão de negócio. Todas as informações sobre o cenário da empresa estão detalhadas no arquivo README “Estudo de Caso Contexto”.

Para iniciar o processo, busquei os dados oficiais disponibilizados nos servidores da Amazon, onde estão armazenados os conjuntos de dados da empresa Cyclistic. Foram utilizados os datasets referentes ao primeiro trimestre de 2019 e 2020, disponíveis no link:
🔗 https://divvy-tripdata.s3.amazonaws.com/index.html

Primeiro utilizei o excel para analise verificando os dados de cada coluna e analisar os dados começei retirando as colunas que eu nao utilizaria com o Power Query:

Colunas excluidas:


bikeid = coluna retirada pois nao iria utilizar 
birthyear = coluna retirada pois nao iria utilizar 
tripduration = foi trocada pela diff_trip_duration

Colunas tratadas:

* start_time = started_at
* end_time = ended_at 
* from_station_id = start_station_id
* from_station_name = start_station_name
* to_station_id = end_station_id
* to_station_name = end_station_name
* day_of_week = Coluna adicionada com a formula do Excel day.of.week
* diff_trip_duration = Coluna adicionada com SQL com a funçao DATEDIFF(MINUTE, started_at, ended_at) AS diff_minutes

Deixei apenas as colunas:

* user_type = coluna com os tipós de usuario ( membros e casual )
* trip_id = coluna com os ids de cada usuario
* start_station_name = nome da estaçao de saida
* start_station_id = id da estaçao de saida
* started_at = dia e horas que aconteceu a saida
* end_station_name = nome da estaçao de chegada
* end_station_id = id da estaçao de chegada
* ended_at = dia e horas que aconteceu a chegada
* gender = genero de cada usuario
* day_of_week = dia da semana que aconteceu a partida ( 1 domingo a 7 sabado ) 
* diff_trip_duration = diferença de tempo do começo da viagem pro final

Juntei as tabelas pois seria melhor para trabalhar com elas reuniadas em uma grande tabela fato 

  
Como os dados estavam ficando muito pesados para serem trabalhados no Excel, passei a utilizar o SQL para continuar a análise.

# Segunda Fase : Comecando a usar SQL e inciando a Analise Descritiva  

Criaçao da tabela " Dados_Empresa_de_Ciclistas "

```{sql}
CREATE TABLE Dados_Empresa_de_Ciclistas (

	user_type VARCHAR(100),
	trip_id VARCHAR(100) PRIMARY KEY NOT NULL ,
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


```



SQL para criar a coluna diff_trip_duration

```{sql}

SELECT 
*,
DATEDIFF(MINUTE, started_at, ended_at) AS diff_minutes
FROM Dados_Empresa_de_Ciclistas
ORDER BY diff_minutes DESC;

```

Pegando o Tempo Maximo que os tipos de usuario tiveram com as Bikes por Dia

```{sql}
SELECT 
user_type,
MAX(DATEDIFF(DAY, started_at, ended_at)) AS max_diff_minutes
FROM Dados_Empresa_de_Ciclistas
GROUP BY user_type;

result:

Member	71 Dias 
Casual	123 Dias 

```

Pegando numero inconcistentes de tempo de viagem que sao menores que 0 

```{sql}

SELECT 
	*,
	DATEDIFF(MINUTE, started_at, ended_at) AS num_menor_0
FROM Dados_Empresa_de_Ciclistas
WHERE DATEDIFF(MINUTE, started_at, ended_at) < 0;

result:

Casual	Y298	HQ QR	675	2020-03-18 11:43:09.0000000	HQ QR	675	2020-03-18 11:42:58.0000000	Male	4	-1
Casual	I500	HQ QR	675	2020-03-19 09:43:05.0000000	HQ QR	675	2020-03-19 09:42:51.0000000	Male	5	-1
Casual	S509	HQ QR	675	2020-03-27 14:59:51.0000000	HQ QR	675	2020-03-27 14:58:18.0000000	Female	6	-1
Casual	G475	HQ QR	675	2020-03-18 12:24:02.0000000	HQ QR	675	2020-03-18 12:23:51.0000000	Male	4	-1

-- temos mais alguns resultados 

```

Media de Tempo com as Bikes por tipo de Usuario em Minutos

```{sql}

SELECT 
	user_type,
	AVG((DATEDIFF(MINUTE, started_at, ended_at))) AS diff_minutes
FROM Dados_Empresa_de_Ciclistas
GROUP BY user_type ORDER BY diff_minutes DESC;


result:

Casual	84 min
Member	13 min

```

Media de Tempo Geral 

```{sql}
SELECT 
	ROUND(AVG((DATEDIFF(MINUTE, started_at, ended_at))),3) AS total_median_diff_minutes
FROM Dados_Empresa_de_Ciclistas;

result:

19

```

Calculando a mediana de minutos por tipo de usuario 

```{sql}

SELECT 
	user_type,
	PERCENTILE_CONT(0.5) 
		WITHIN GROUP (ORDER BY (DATEDIFF(MINUTE, started_at, ended_at))) 
		OVER (PARTITION BY user_type) AS median
FROM Dados_Empresa_de_Ciclistas

result:

Casual	22
Member	8

```

Calculando a mediana de minutos geral

```{sql}

SELECT 
	PERCENTILE_CONT(0.5) 
		WITHIN GROUP (ORDER BY (DATEDIFF(MINUTE, started_at, ended_at))) 
		OVER () AS median
FROM Dados_Empresa_de_Ciclistas

```

Pessoas que mais alugam as bikes 

```{sql}
SELECT 
trip_id,
COUNT(trip_id) AS count_trip_unique_trip_id
FROM Dados_Empresa_de_Ciclistas
GROUP BY trip_id ORDER BY count_trip_unique_trip_id DESC;

result:

S794	57
V855	57
E151	57
U636	56
J313	56
J188	56
N940	56
N516	56
B256	55
Y457	55
H219	55
O135	55

...

```

Em seguida, apresento a porcentagem diária de minutos e a soma total de minutos por dia dividido por tipo de usuario para verificarmos em quais dias os usuarios mais usam as bikes :

Membros :


<img width="553" height="217" alt="image" src="https://github.com/user-attachments/assets/4eaf3c85-d7e8-498e-993d-5cc6b124cd66" />



Casual : 



<img width="553" height="217" alt="image" src="https://github.com/user-attachments/assets/e642a2eb-d99e-4a74-9a65-71ca214ad9b0" />



Podemos tirar algumas conclusoes disso:

* Os ciclistas casuais utilizam as bicicletas por menos tempo em comparação aos membros anuais, porém o tempo total de uso dos casuais representa cerca de 64% do tempo dos membros.
* Entre os membros, a média de tempo de uso se mantém estável ao longo da semana, com ligeiro destaque para os dias úteis, indicando um padrão de uso mais regular.
* Já os usuários casuais apresentam uma diferença perceptível no comportamento: no início da semana o número de usos é mais baixo, mas a partir de quinta-feira os valores começam a crescer, atingindo os maiores índices durante o final de semana.

Podemos ver essa relacao com o grafico abaixo: 

<img width="682" height="247" alt="image" src="https://github.com/user-attachments/assets/ce671705-110a-45ae-a142-bb1cb5ea4621" />

Podemos ver com mais clareza que os finais de semana são os dias preferidos pelos usuários casuais.
Isso mostra uma grande oportunidade: se conseguirmos converter esses usuários ocasionais em membros regulares, principalmente os que pedalam aos fins de semana, os lucros da empresa podem crescer bastante.


Aqui temos uma comparação do tempo médio de uso entre homens, mulheres e não informados:

<img width="525" height="246" alt="image" src="https://github.com/user-attachments/assets/754c85a1-5f67-4978-8d5c-86210af6a2ae" />


Os dados mostram que a maioria dos usuários ainda são homens, tanto em 2019 quanto em 2020, mas houve crescimento em todos os grupos no período analisado.

2019 

<img width="520" height="246" alt="{90C97770-45D8-4DEE-9144-A7B12B7B3CEE}" src="https://github.com/user-attachments/assets/8d2e7520-db4f-4c8a-b294-4813593ff48f" />


2020

<img width="524" height="245" alt="{4020AEBE-4A1B-4CA0-86BE-B1E1D343C043}" src="https://github.com/user-attachments/assets/47e9c43d-38e1-43b6-8820-ca605903c4dd" />


Mesmo com o aumento no uso entre as mulheres, ainda há uma diferença considerável em relação aos homens o que mostra um potencial de crescimento se a empresa investir em campanhas voltadas ao público feminino.


Nos dois anos analisados, o domingo se destaca como o dia mais movimentado, seguido por outros dias de fim de semana.


<img width="672" height="262" alt="{1137EE83-7377-44D3-A733-1D03C37F3DF8}" src="https://github.com/user-attachments/assets/70477013-e651-40f7-9abb-05279ded2d0a" />


Aqui temos o crescimento no número de usuários em ambos os períodos, separados por tipo de usuário:


<img width="523" height="251" alt="{4D807A72-F10A-4ECC-88ED-DD7110B87624}" src="https://github.com/user-attachments/assets/b97b5918-9219-479c-87ff-f389974d8579" />


Os usuários casuais tiveram um crescimento impressionante de cerca de 323,64% em 2020 em relação a 2019 Isso mostra que esse grupo está cada vez mais ativo e engajado, o que representa uma ótima chance de conversão para planos de assinatura.


Comparacao entre os Trimestres do ano de 2019 e 2020 

<img width="642" height="251" alt="{E7548CA6-533D-4F13-A89A-F9B4AFCAE7DB}" src="https://github.com/user-attachments/assets/b3f1b926-d3e8-4aba-a452-42c97dff6cfb" />


Podemos observar que 2020 apresentou uma melhora notável em relação a 2019, com destaque para o mês de março em ambos os anos que se mostrou o período com maior número de usuários e maior tempo médio de uso das bicicletas


O destaque vai novamente para os usuários casuais, que apresentaram crescimento consistente em todos os meses de 2020 em comparação com o mesmo período de 2019.

<img width="1205" height="255" alt="image" src="https://github.com/user-attachments/assets/66257a04-fd13-41d2-ae4b-8b491699407a" />


Esse aumento reforça a tendência de que cada vez mais pessoas estão conhecendo e utilizando o serviço de forma eventual, o que abre espaço para estratégias de fidelização e planos personalizados.



# Resumo da Analise 


### Diferença clara de comportamento entre membros e casuais:

Os membros utilizam as bicicletas com maior frequência e de forma mais regular durante a semana. Ja os usuários casuais concentram o uso aos finais de semana, especialmente a partir de quinta-feira.

### Tempo de uso médio:

Os Ciclistas casuais pedalam por mais tempo por viagem (média de 84 min) em comparação aos membros (13 min). No entanto, o tempo total de uso dos casuais ainda representa cerca de 64% do tempo total dos membros.

### Diferença por gênero:

Homens continuam sendo a maioria dos usuários, mas houve crescimento relevante entre mulheres em 2020. Esse dado indica potencial para campanhas focadas no público feminino.

### Tendência de crescimento:

Em 2020, o tempo de uso dos usuários casuais cresceram cerca de 323,64% em relação a 2019 um aumento expressivo que mostra maior engajamento e descoberta do serviço.

### Padrões sazonais e temporais:

O domingo é o dia com maior número de viagens, seguido pelo sábado. O mês de março se destaca em ambos os anos como o período com mais uso, sugerindo influência sazonal (clima ou eventos locais).


# Acao

### Conversão de usuários casuais:

Criar planos de assinatura de fim de semana com descontos ou vantagens, mirando os usuários casuais que pedalam aos nos dias proximos aos finais de semana pois nesses dias esse tipo de usuario tem um costume maior de usar as bikes. 

Tambem podemos implementar campanhas de teste gratuito para incentivar a migração para planos mensais ou anuais.

### Campanhas por público:

Podemos desenvolver ações de marketing voltadas ao público feminino, como eventos, descontos especiais ou programas de incentivo para a sua maior aceitacao e conversao.

Tambem podemos promover parcerias com academias, parques, cafés locais, estacoes de onibus e metro, aeroportos entre outras coisas para atrair novos membros.

### Melhoria operacional:

Temos que auemntar o número de bicicletas disponíveis em estações com maior uso nos fins de semana para atrair mais publico nesses dias.

Avaliar a distribuição das bikes em horários de pico para reduzir falta ou excesso em determinados locais.





