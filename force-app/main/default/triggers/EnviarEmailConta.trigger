trigger EnviarEmailConta on Account (after insert, after update) {
    EnviarEmailService.enviarEmail(Trigger.new);
}
