# Estudo-de-Caso-Empresa-de-Ciclismo-
Este é o meu estudo de caso sobre uma empresa fictícia de compartilhamento de bicicletas, com sede na cidade de Chicago, abrangendo os primeiros semestres de 2019 e 2020. Neste projeto, apliquei os conceitos aprendidos no módulo inicial de Análise de Dados do Google, utilizando as principais etapas do processo analítico: Ask, Prepare, Process, Analyze, Share e Act.

O objetivo deste estudo é analisar as diferenças de comportamento entre ciclistas casuais e membros anuais da empresa Cyclistic, identificando padrões de uso que possam orientar a criação de estratégias eficazes para converter ciclistas casuais em membros anuais. Essa conversão é essencial para aumentar a lucratividade e fortalecer o crescimento sustentável da empresa.

Perguntas Orientadoras de Negócios: Três perguntas guiarão o futuro programa de marketing:
* Como os membros anuais e os ciclistas casuais usam as bicicletas Cyclistic de forma diferente? 
* Por que os ciclistas casuais comprariam associações anuais da Cyclistic? 
* Como a Cyclistic pode usar a mídia digital para influenciar os ciclistas casuais a se tornarem membros?

# Primeira Fase

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
FROM [Dados Empresa de Ciclistas(Recuperado Automaticamente)(2)]
GROUP BY user_type;

result:

Member	71 Dias 
Casual	123 Dias 

```







A seguir, temos um boxplot que nos ajuda a compreender melhor o comportamento dos dados. Podemos observar que há muitos outliers, ou seja, diversos valores que ultrapassam a média. A partir disso, é possível tirar algumas conclusões:

* A média de tempo pode estar distorcida (puxada para cima), já que a maioria dos valores ultrapassa a média geral, sendo 13,29 minutos para membros e 89,44 minutos para usuários casuais.
* Também conseguimos ter uma noção inicial da resposta à pergunta do estudo de caso, pois tanto a média de tempo quanto a quantidade de outliers dos usuários casuais são significativamente maiores do que as dos membros anuais.

  

<img width="751" height="595" alt="image" src="https://github.com/user-attachments/assets/8548533c-50a0-462c-81d6-0ffa29f8bacc" />




Em seguida, apresento a porcentagem diária de minutos e a soma total de minutos por dia, o que reforça as diferenças no comportamento entre os dois grupos analisados:




<img width="549" height="217" alt="image" src="https://github.com/user-attachments/assets/f576bc79-14f7-481f-b233-7961a05e185b" />





