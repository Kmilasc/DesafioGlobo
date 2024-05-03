public with sharing class EnviarEmailService {
    public static void enviarEmail(List<Account> contas) {
        ConfiguracaoEnvioEmail__c configuracao = ConfiguracaoEnvioEmail__c.getInstance('ConfiguracaoEmailPadrao');
        if (configuracao != null && configuracao.EnviarEmail__c) {
            List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
            for (Account acc : contas) {
                Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
                email.setToAddresses(new String[] { configuracao.EnderecoEmail__c });
                email.setSubject('Nova conta criada/editada');
                email.setPlainTextBody('Uma nova conta foi criada/editada.');
                emails.add(email);
            }
            Messaging.sendEmail(emails);
        }
    }
}
