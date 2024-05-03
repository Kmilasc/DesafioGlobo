public class NotificationService {
    public static void sendEmailNotification(String message) {
        ConfiguracaoEmailNotificacao__mdt configuracao = ConfiguracaoEmailNotificacao__mdt.getInstance('Padrao');
        String enderecoEmail = configuracao != null ? configuracao.EnderecoEmail__c : null;

        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        email.setToAddresses(new List<String>{enderecoEmail});
        email.setSubject('Notificação de Conta');
        email.setPlainTextBody(message);
        Messaging.sendEmail(new List<Messaging.SingleEmailMessage>{email});
    }
}
