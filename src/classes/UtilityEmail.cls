/**
 *  Utility Email class.
 *
 *  Copyright (c) 2015-2023 Wiregrass Code Technology
 */
global with sharing class UtilityEmail {

    private List<String> toAddresses;
    private String senderDisplayName;
    private String subject;
    private String htmlBody;
    private Boolean useSignature;
    private String replyTo;
    private String plainTextBody;
    private List<Messaging.EmailFileAttachment> fileAttachments;

    public UtilityEmail() {
        User currentUser = [SELECT Email FROM User WHERE Username = :UserInfo.getUserName() LIMIT 1];

        toAddresses = null;
        senderDisplayName = UserInfo.getFirstName() + ' ' + UserInfo.getLastName();
        subject = '';
        htmlBody = '';
        useSignature = false;
        replyTo = currentUser.Email;
        plainTextBody = '';
        fileAttachments = null;
    }

    public void setToAddresses(List<String> toAddresses) {
        this.toAddresses = toAddresses;
    }

    public void setSenderDisplayName(String senderDisplayName) {
        this.senderDisplayName = senderDisplayName;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public void setHTMLBody(String htmlBody) {
        this.htmlBody = htmlBody;
    }

    public void setUseSignature(Boolean useSignature) {
        this.useSignature = useSignature;
    }

    public void setReplyTo(String replyTo) {
        this.replyTo = replyTo;
    }

    public void setPlainTextBody(String plainTextBody) {
        this.plainTextBody = plainTextBody;
    }

    public void setFileAttachments(List<Messaging.Emailfileattachment> fileAttachments) {
        this.fileAttachments = fileAttachments;
    }

    public void sendEmail() {
        try {
            Messaging.SingleEmailMessage singleEmailMessage = CreateSingleMailMessage();
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { singleEmailMessage });
        }
        catch (Exception e) {
            System.debug(logginglevel.DEBUG, '# unable to send email using Messaging.sendEmail(): ' + e.getMessage());
            throw e;
        }
    }

    private Messaging.SingleEmailMessage CreateSingleMailMessage() {
        Messaging.SingleEmailMessage singleEmailMessage = new Messaging.SingleEmailMessage();
        singleEmailMessage.setToAddresses(this.toAddresses);
        singleEmailMessage.setSenderDisplayName(this.senderDisplayName);
        singleEmailMessage.setSubject(this.subject);
        singleEmailMessage.setHtmlBody(this.htmlBody);
        singleEmailMessage.setUseSignature(this.useSignature);
        singleEmailMessage.setReplyTo(this.replyTo);
        singleEmailMessage.setPlainTextBody(this.plainTextBody);
        singleEmailMessage.setFileAttachments(this.fileAttachments);
        return singleEmailMessage;
    }
}