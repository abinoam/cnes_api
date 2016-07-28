API para empacotar os dados abertos do governo referente ao CNES (DATASUS). Prove dados de estabelecimentos de saúde

Uma consulta na API é feita pelo recurso através do recurso https://cnes.herokuapp.com/api/cnes/

O serviço pode retornar os dados associados a cada estabelecimento da seguinte forma

Retorna todas as possíveis atividades de ensino realizada por um estabelecimento de saúde
https://cnes.herokuapp.com/api/cnes/teaching_activities

Natureza do estabelecimento de saúde:

https://cnes.herokuapp.com/api/cnes/organization_kinds


Tipo da unidade médica: 

https://cnes.herokuapp.com/api/cnes/health_unities


Esfera Administrativa:

https://cnes.herokuapp.com/api/cnes/administratives

Atividades exercidas:

https://cnes.herokuapp.com/api/cnes/teaching_activities

Um pedido de estabelecimento de saúde pode ser realizado pelo recurso https://cnes.herokuapp.com/api/cnes/establishments/. Segue abaixo alguns exemplos de consulta de estabelecimentos de saúde

Pesquisa por estabelecimentos que possuem 'fed' em seu nome e que possua tipo de unidade médica seja um posto de saúde ou um hospital especializado

https://cnes.herokuapp.com/api/cnes/establishments/?name=Fed&health_unities[]=1&health_unities[]=7

Pesquisa por todos os estabelecimentos de saúde

https://cnes.herokuapp.com/api/cnes/establishments/

Pesquisa por todos os estabelecimentos de saúde em que sua unidade médica é um centro de unidade básica ou um posto de saúde e que seja federal ou estadual

https://cnes.herokuapp.com/api/cnes/establishments?health_unities[]=2&health_unities[]=3&administratives[]=1&administratives[]=2

Observe que o código usado nas consultas abaixo podem ser consultados através do recurso https://cnes.herokuapp.com/api/cnes/health_unities ou https://cnes.herokuapp.com/api/cnes/health_unities

