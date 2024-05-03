# Desafio Globo Salesforce

## Introdução

Este documento descreve a solução desenvolvida para o Desafio Globo Salesforce, que envolve a criação de uma org de desenvolvimento nova no Salesforce e a implementação de diversas funcionalidades e automações. A solução foi desenvolvida utilizando a plataforma Salesforce e seus recursos de customização, como objetos customizados, campos customizados, endpoints REST, automações com e sem código, entre outros.

## Passo 1: Criar uma nova org de desenvolvimento

Foi criada uma nova org de desenvolvimento em https://developer.salesforce.com/signup.

## Passo 2: Criar um objeto customizado chamado País

Foi criado um objeto customizado chamado País.

O objeto País possui os campos customizados Sigla (obrigatório e único), Moeda e Idioma.

## Passo 3: Adicionar campos customizados na Conta (Account)

Foram adicionados três campos customizados na Conta (Account):
- Um campo para guardar o valor total de vendas para aquela conta.
- Para manter o valor atualizado, foi criado um objeto personalizado Pedido__c com um relacionamento mestre e detalhes com Conta.
- Foi criado um campo moeda Valor_Pedido dentro de Pedido__c.
- Foi configurado um campo resumo de totalização em Conta, selecionando o objeto Pedido__c, selecionando SUM para soma e adicionando o campo Valor_Pedido__c na lista de campos a serem somados.

## Passo 4: Adicionar campos adicionais na Conta (Account)

- Foi adicionado um campo de relacionamento obrigatório para o País na Conta (Account).
- Foi adicionado um campo que exibe um resumo das informações do país no formato "N:valor do Nome - S: valor da Sigla - I:valor do Idioma - M: valor da Moeda". Caso alguma das informações não esteja disponível, "N/A" é exibido.

## Passo 5: Implementar um endpoint customizado de "Upsert" de uma Conta

Foi criado um serviço REST no Salesforce utilizando a anotação @RestResource em uma classe Apex.

Foi definido um método dentro dessa classe que é acessado via HTTP POST e que recebe os dados da conta a ser inserida ou atualizada.

O contrato de entrada espera que os dados sejam enviados para o endpoint no formato JSON, contendo os campos da conta, incluindo um identificador único como o ID da conta.

O contrato de saída retorna uma resposta no formato JSON indicando se a operação foi bem-sucedida e, em caso afirmativo, os detalhes da conta afetada.

## Passo 6: Implementar um endpoint customizado de "Insert" de uma Ordem (Order)

Foi criado um serviço REST no Salesforce utilizando a anotação @RestResource em uma classe Apex.

Foi definido um método dentro dessa classe que é acessado via HTTP POST e que recebe os dados da ordem a ser inserida.

O contrato de entrada espera que os dados sejam enviados para o endpoint no formato JSON, contendo os campos da ordem.

O contrato de saída retorna uma resposta no formato JSON indicando se a operação foi bem-sucedida e, em caso afirmativo, os detalhes da ordem afetada.

## Passo 7: Implementação de uma automação com código para enviar um email

Infelizmente, não consegui concluir esta etapa da tarefa.

## Passo 8: Implementação de automação sem código para incrementar o campo "Valor_total_de_vendas__c" da conta relacionada

Foi criado um Campo de Resumo (Roll-Up Summary Field) chamado "Valor_total_de_vendas__c" na definição do objeto Conta (Account) em Setup, com a função de resumo SUM que soma o valor total de todas as Orders relacionadas à Conta.

O relacionamento entre Conta e Order foi configurado para permitir o roll-up.

O campo "Valor_total_de_vendas__c" será atualizado automaticamente sempre que uma nova Order for criada ou o valor de uma Order existente for alterado.

## Passo 9: Implementação de um processo para deletar Orders antigas usando um agendador do Salesforce

Foi criada uma nova classe Apex chamada "DeletarOrdersAntigas" com o código necessário para deletar automaticamente as Orders que foram modificadas há mais de 3 meses.

A classe Apex foi criada na seção "Develop" (Desenvolvimento) e selecionando "Apex Classes" (Classes do Apex).

O agendador do Salesforce foi configurado para executar a classe "DeletarOrdersAntigas" uma vez por dia. Isso foi feito acessando a seção "Develop" (Desenvolvimento) e selecionando "Schedule Apex" (Agendar Apex), onde a classe e o horário de execução diária foram definidos.

## Dificuldades

Criei o arquivo package.xml, mas não consegui carregar o package.xml em minha org, mas irei passar o arquivo.

## Usuário para o avaliador Globo:

Nome do usuário: avaliador@gmail.com
Senha: Desafioglobo1.

## Conclusão

A solução desenvolvida atende parte dos requisitos do Desafio Globo Salesforce, fornecendo uma org de desenvolvimento nova com funcionalidades customizadas e automações para melhorar a eficiência e a integridade dos dados.
