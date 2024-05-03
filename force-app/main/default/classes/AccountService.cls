@RestResource(urlMapping='/upsertAccount/*')
global with sharing class AccountService {

    /**
     * Endpoint REST para upsert de uma conta.
     * @param accountId ID da conta 
     * @param name Nome da conta.
     * @param industry Indústria da conta.
     * @return Mensagem indicando o resultado da operação.
     */
    @HttpPut
    global static String upsertAccount(String accountId, String name, String industry) {
        try {
            // Verifica se o usuário tem permissão de escrita na conta
            if (!Schema.sObjectType.Account.isCreateable() && !Schema.sObjectType.Account.isUpdateable()) {
                return 'O usuário não tem permissão para criar ou atualizar uma conta.';
            }

            Account acc = new Account();
            if (accountId != null) {
                // Verifica se o usuário tem permissão de leitura na conta
                if (!Schema.sObjectType.Account.isAccessible()) {
                    return 'O usuário não tem permissão para acessar a conta.';
                }
                acc.Id = accountId;
            }
            acc.Name = name;
            acc.Industry = industry;
            
            upsert acc;
            
            return 'Conta ' + acc.Name + ' ' + (accountId != null ? 'atualizada' : 'inserida') + ' com sucesso!';
        } catch (Exception e) {
            return 'Erro ao realizar upsert da Conta: ' + e.getMessage();
        }
    }
}
