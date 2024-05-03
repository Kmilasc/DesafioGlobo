import { LightningElement} from 'lwc';
import { sendEmail } from 'lightning/emailUtils';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class ConfiguracaoEnvioEmail extends LightningElement {
    enderecoEmail = '';
    enviarEmail = false;

    handleEmailChange(event) {
        this.enderecoEmail = event.target.value;
    }

    handleEnviarEmailChange(event) {
        this.enviarEmail = event.target.checked;
    }

    enviarEmail() {
        if (this.enviarEmail) {
            const emailParams = {
                toAddresses: [this.enderecoEmail],
                subject: 'Assunto do Email',
                htmlBody: 'Corpo do Email'
            };
            sendEmail(emailParams)
                .then(result => {
                    this.dispatchEvent(
                        new ShowToastEvent({
                            title: 'Sucesso',
                            message: 'Email enviado com sucesso.',
                            variant: 'success'
                        })
                    );
                })
                .catch(error => {
                    this.dispatchEvent(
                        new ShowToastEvent({
                            title: 'Erro',
                            message: 'Erro ao enviar o email.',
                            variant: 'error'
                        })
                    );
                });
        } else {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Aviso',
                    message: 'Envio de email desabilitado.',
                    variant: 'warning'
                })
            );
        }
    }
}
