public class AccountEmailHandler {
    public static void sendEmails(List<Account> newAccounts) {
        List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();

        for(Account acc : newAccounts){
            String emailAddress = acc.Email; 
            if(String.isNotBlank(emailAddress)){
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                mail.setToAddresses(new String[]{emailAddress});
                mail.setSubject('Nova conta criada/editada');
                mail.setPlainTextBody('Uma nova conta foi criada/editada. Detalhes: ' + acc);
                emails.add(mail);
            }
        }

        if(!emails.isEmpty()){
            Messaging.sendEmail(emails);
        }
    }
}
