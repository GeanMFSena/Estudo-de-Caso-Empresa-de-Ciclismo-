# 1. Visão Geral do Estudo de Caso
Título: Estudo de caso: Como um compartilhamento de bicicletas navega pelo sucesso rápido? 
Empresa: Cyclistic (fictícia) 
Introdução: Bem-vindo ao estudo de caso de análise de compartilhamento de bicicletas Cyclistic! 
Processo de Análise: Para responder às perguntas de negócios, você deve seguir as seis etapas do processo de análise de dados: Perguntar, Preparar, Processar, Analisar, Compartilhar e Agir. As tabelas do "Roteiro do Estudo de Caso" ajudarão a guiá-lo.

# 2. O Cenário e a Empresa (Cyclistic)
O Cenário
Sua Função: Você é um analista de dados júnior trabalhando na equipe de análise de marketing da Cyclistic, uma empresa de compartilhamento de bicicletas em Chicago.
O Desafio: A diretora de marketing (sua gerente) acredita que o sucesso futuro da empresa depende da maximização do número de associações anuais.

### O Objetivo: 
Sua equipe quer entender como os ciclistas casuais e os membros anuais usam as bicicletas Cyclistic de forma diferente. Com esses insights, a equipe irá projetar uma nova estratégia de marketing para converter ciclistas casuais em membros anuais.
Aprovação: Os executivos da Cyclistic devem aprovar suas recomendações, portanto, elas devem ser apoiadas por insights de dados convincentes e visualizações de dados profissionais.

### Sobre a Empresa
História e Frota: A Cyclistic lançou seu programa em 2016. Desde então, cresceu para uma frota de 5.824 bicicletas geo rastreadas e 692 estações em Chicago.
Funcionalidade: As bicicletas podem ser desbloqueadas de uma estação e devolvidas a qualquer outra estação no sistema a qualquer momento.
Inclusão: A Cyclistic se diferencia por também oferecer bicicletas reclinadas, triciclos manuais e bicicletas de carga, tornando o compartilhamento de bicicletas mais inclusivo.
Uso: A maioria dos ciclistas opta por bicicletas tradicionais; cerca de 8% usam as opções assistivas. Os usuários são mais propensos a andar por lazer, mas cerca de 30% usam as bicicletas para ir ao trabalho todos os dias.
Modelo de Negócios e Estratégia
Planos de Preços: A estratégia de marketing anterior dependia da flexibilidade de seus planos de preços: passes de viagem única, passes diários e associações anuais.

## Tipos de Clientes:
Ciclistas Casuais: Clientes que compram passes de viagem única ou de dia inteiro.
Membros: Clientes que compram associações anuais.
O Problema de Rentabilidade: Os analistas financeiros da Cyclistic concluíram que os membros anuais são muito mais lucrativos do que os ciclistas casuais.
Novo Foco Estratégico: A diretora de marketing, Moreno, acredita que maximizar o número de membros anuais será fundamental para o crescimento futuro. Em vez de focar em novos clientes, Moreno acredita que há uma oportunidade sólida de converter ciclistas casuais em membros. Ela observa que os ciclistas casuais já estão cientes do programa e escolheram a Cyclistic para suas necessidades de mobilidade.

Meta Clara: Moreno estabeleceu um objetivo claro: Projetar estratégias de marketing destinadas a converter ciclistas casuais em membros anuais.
Necessidade de Dados: Para fazer isso, a equipe precisa entender melhor como os membros anuais e os ciclistas casuais diferem e está interessada em analisar os dados históricos de viagens de bicicleta da Cyclistic para identificar tendências.

# 3. Personagens e Equipes
Cyclistic: O programa de compartilhamento de bicicletas com mais de 5.800 bicicletas e 600 estações de acoplamento.
Lily Moreno: A diretora de marketing e sua gerente. Ela é responsável pelo desenvolvimento de campanhas (e-mail, mídia social, etc.) para promover o programa.
Equipe de análise de marketing da Cyclistic: Uma equipe de analistas de dados responsável por coletar, analisar e relatar dados que ajudam a orientar a estratégia de marketing. Você entrou para esta equipe há seis meses.
Equipe executiva da Cyclistic: A equipe executiva notoriamente orientada a detalhes que decidirá se aprova o programa de marketing recomendado.

# 4. Fase 1: Perguntar (Ask)
Perguntas Orientadoras de Negócios: Três perguntas guiarão o futuro programa de marketing:
* Como os membros anuais e os ciclistas casuais usam as bicicletas Cyclistic de forma diferente? 
* Por que os ciclistas casuais comprariam associações anuais da Cyclistic? 
* Como a Cyclistic pode usar a mídia digital para influenciar os ciclistas casuais a se tornarem membros? 

Sua Tarefa Específica: Moreno atribuiu a você a primeira pergunta para responder: Como os membros anuais e os ciclistas casuais usam as bicicletas Cyclistic de forma diferente? 

Entregáveis Exigidos: Você produzirá um relatório com os seguintes resultados:
* Uma declaração clara da tarefa de negócios.
* Uma descrição de todas as fontes de dados usadas.
* Documentação de qualquer limpeza ou manipulação de dados.
* Um resumo de sua análise.
* Visualizações de apoio e principais descobertas.
* Suas três principais recomendações com base em sua análise.
  
Roteiro (Perguntar):
Perguntas orientadoras: 
* Qual é o problema que você está tentando resolver?
* Como seus insights podem impulsionar as decisões de negócios? 
Tarefas principais: Identificar a tarefa de negócios. Considerar as principais partes interessadas.
Resultado: Uma declaração clara da tarefa de negócios.

# 5. Fase 2: Preparar (Prepare)
Fonte de Dados: Use os dados históricos de viagem da Cyclistic para analisar e identificar tendências. 
(Nota: Os conjuntos de dados têm um nome diferente, "Divvy", porque a Cyclistic é fictícia, mas os dados são apropriados ).
Download dos Dados:

Se você NÃO for usar R, baixe os dados de viagem dos 12 meses anteriores.
Se você planeja usar o RStudio da Posit, use os conjuntos de dados Divvy 2019 Q1 e Divvy 2020 Q1. 
(Escolher outros dados pode levar a erros, pois os dados excedem a memória disponível no plano gratuito ).
Propriedade dos Dados: Os dados foram disponibilizados pela Motivate International Inc. sob esta licença.

### Limitações (Privacidade): 
Questões de privacidade de dados proíbem o uso de informações de identificação pessoal dos ciclistas. Isso significa que você não poderá conectar compras de passes a números de cartão de crédito para determinar se os ciclistas casuais moram na área de serviço da Cyclistic ou se compraram múltiplos passes únicos.

### Roteiro (Preparar):
Perguntas orientadoras: 
* Onde seus dados estão localizados? 
* Como os dados estão organizados? 
* Existem problemas de viés ou credibilidade? 
* Seus dados são ROCCC (Confiáveis, Originais, Abrangentes, Atuais, Citados)? 
* Como você está abordando licenciamento, privacidade, segurança e acessibilidade? 
* Como você verificou a integridade dos dados? 
Tarefas principais: Baixar dados e armazená-los adequadamente. Identificar como estão organizados. Classificar e filtrar os dados. Determinar a credibilidade dos dados.
Resultado: Uma descrição de todas as fontes de dados usadas.

# 6. Fase 3: Processar (Process)

### Roteiro (Processar):
Perguntas orientadoras: 
* Quais ferramentas você está escolhendo e por quê? 
* Você garantiu a integridade dos dados?
* Quais etapas você tomou para garantir que seus dados estejam limpos?
* Como você pode verificar se seus dados estão limpos e prontos para analisar?
* Você documentou seu processo de limpeza? 
Tarefas principais: Verificar os dados em busca de erros. Escolher suas ferramentas. Transformar os dados para trabalhar com eles efetivamente. Documentar o processo de limpeza.
Resultado: Documentação de qualquer limpeza ou manipulação de dados.

Etapas Específicas de Processamento (Para Planilhas):
* Baixe os dados e descompacte os arquivos.
* Crie pastas para armazenar os arquivos .csv originais e os arquivos .xls ou Sheets.
* Abra cada arquivo .csv no Excel ou Google Sheets e salve-o no formato nativo (Excel Workbook ou Google Sheet) na subpasta apropriada.
* Crie uma coluna chamada ride_length (duração da viagem). Calcule a duração subtraindo a coluna started_at da coluna ended_at (por exemplo, =D2-C2). Formate como HH:MM:SS (ex: 37:30:55).
* Crie uma coluna chamada day_of_week (dia da semana). Calcule o dia da semana em que cada viagem começou usando o comando WEEKDAY (por exemplo, WEEKDAY(C2, 1)). (Nota: 1= Domingo e 7= Sábado) .

# 7. Fase 4: Analisar (Analyze)
### Roteiro (Analisar):
Perguntas orientadoras: 
* Como você deve organizar seus dados para realizar a análise?
* Seus dados foram formatados corretamente?
* Que surpresas você descobriu nos dados?
* Que tendências ou relações você encontrou?
Tarefas principais: Agregar seus dados para que sejam úteis e acessíveis. Organizar e formatar seus dados. Realizar cálculos. Identificar tendências e relações.
Resultado: Um resumo de sua análise.

Etapas Específicas (Usando Planilhas):
* Torne as colunas consistentes e combine-as em uma única planilha, onde relevante.
* Limpe e transforme seus dados.
* Conduza análise descritiva.
* Execute cálculos como:
* Calcular a média de ride_length.
* Calcular o máximo de ride_length.
* Calcular a moda de day_of_week.
* Crie uma tabela dinâmica. Opções:
* Calcular a média de ride_length para membros e ciclistas casuais.
* Calcular a média de ride_length para usuários por dia da semana.
* Calcular o número de viagens para usuários por dia da semana (adicionando Contagem de trip_id).
* Mescle as planilhas individuais em uma visão de ano inteiro.
* Exporte um arquivo de resumo para análise posterior.

Etapas Específicas (Usando SQL):
* Importe seus dados.
* Explore os dados (número total de linhas, valores distintos, máximo, mínimo, média).
* Use JOIN para combinar dados relevantes em uma tabela.
* Crie estatísticas de resumo e salve informações sobre tendências interessantes.
* Etapas Específicas (Usando R):
* Importe seus dados do Divvy 2019 Q1 e Divvy 2020 Q1.
* Torne as colunas consistentes e mescle-as em um único dataframe.
* Limpe e adicione dados para preparar a análise.
* Conduza análise descritiva.
* Exporte um arquivo de resumo.

# 8. Fase 5: Compartilhar (Share)
Objetivo: Criar visualizações sofisticadas e polidas para comunicar efetivamente suas descobertas à equipe executiva.
### Roteiro (Compartilhar):
Perguntas orientadoras: 
* Você conseguiu responder à pergunta sobre como os membros e ciclistas casuais usam as bicicletas de forma diferente?
* Que história seus dados contam?
* Quem é seu público?
* A visualização de dados pode ajudar a compartilhar suas descobertas?
* Sua apresentação é acessível? 
Tarefas principais: Determinar a melhor maneira de compartilhar suas descobertas. Criar visualizações de dados eficazes. Apresentar suas descobertas. Garantir que seu trabalho seja acessível.
Resultado: Visualizações de apoio e principais descobertas.

Etapas Específicas de Visualização:
* Rascunhe algumas ideias em papel primeiro.
* Use sua ferramenta de escolha (PowerPoint, Google Slides, planilha, Tableau ou R).
* Crie sua visualização usando contraste (tamanho, cor, forma) para atrair a atenção para os insights mais importantes.
* Garanta um significado claro através do uso adequado de títulos, legendas e rótulos.
* Refine sua visualização com atenção aos detalhes.

# 9. Fase 6: Agir (Act)
Objetivo: Preparar os entregáveis que Morena pediu, incluindo as três principais recomendações com base em sua análise.
### Roteiro (Agir):
Perguntas orientadoras: 
* Qual é a sua conclusão final?
* Como sua equipe e negócios podem aplicar seus insights?
* Quais são os próximos passos?
* Existe dados adicionais que você poderia usar? 
Tarefas principais: Criar seu portfólio. Adicionar seu estudo de caso. Praticar a apresentação do seu estudo de caso.
Resultado: Suas três principais recomendações com base em sua análise.

Etapas Específicas (Portfólio):
* Crie um portfólio online se ainda não tiver um.
* Considere como você deseja apresentar seu estudo de caso.
* Faça o upload ou link das descobertas do seu estudo de caso para o seu portfólio.
* Escreva um breve parágrafo descrevendo o estudo de caso, seu processo e suas descobertas para introduzi-lo.

# 10. Conclusão do Estudo de Caso
Encerramento: Parabéns por terminar o estudo de caso Cyclistic! 
Próximos Passos: Você pode usar as etapas deste roteiro (Perguntar, Preparar, Processar, Analisar, Compartilhar e Agir) para criar um novo projeto próprio.
Mensagem Final: Boa sorte em sua busca por emprego!

