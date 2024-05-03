@RestResource(urlMapping='/insertOrder/*')
global with sharing class InsertOrderEndpoint {

    @HttpPost
    global static InsertOrderResponse insertOrder(InsertOrderRequest request) {
        // Verificar permissões CRUD antes de realizar operações SOQL/DML
        if (!Schema.sObjectType.Pedido_C__c.isCreateable()) {
            throw new CustomException('O usuário atual não tem permissão para criar Pedidos.');
        }

        // Cria e coloca o pedido
        Pedido_C__c newPedido = new Pedido_C__c(
            Cliente__c = request.clienteId,
            Data__c = Date.today(),
            Status__c = 'Rascunho'
        );
        insert newPedido;

        // Preenche os detalhes do pedido personalizado
        CustomOrder customOrder = new CustomOrder();
        customOrder.Pedido_C__c = newPedido.Id;
        customOrder.Cliente__c = newPedido.Cliente__c;
        customOrder.Valor_total__c = 0; // Adiciona lógica para calcular o total

        // Retorne os detalhes do pedido personalizado na resposta
        InsertOrderResponse response = new InsertOrderResponse();
        response.customOrder = customOrder;
        return response;
    }

    // Contrato de entrada
    global class InsertOrderRequest {
        public String clienteId;
        public String productId;
        public Decimal quantity;
    }

    // Contrato de saída
    global class InsertOrderResponse {
        public CustomOrder customOrder;
    }
}
