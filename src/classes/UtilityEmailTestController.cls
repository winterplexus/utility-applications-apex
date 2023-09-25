/**
 *  Utility email test controller
 *
 *  Copyright (c) 2015-2024 Code Construct Systems
 */
public with sharing class UtilityEmailTestController {

    public String emailAddress { get; set; }
    public String emailSubject { get; set; }
    public String emailHTMLBody { get; set; }
    public String emailPlainTextBody  { get; set; }

    public PageReference reset() {
        emailAddress = '';
        emailSubject = '';
        emailHTMLBody = '';
        emailPlainTextBody = '';
        return null;
    }

    public PageReference send() {
        List<String> toAddresses;

        if (emailAddress != null) {
            toAddresses = emailAddress.split(';');
        }

        try {
            UtilityEmail email = new UtilityEmail();
            email.setToAddresses(toAddresses);
            email.setSubject(emailSubject);
            email.setHTMLBody(emailHTMLBody);
            email.setPlainTextBody(emailPlainTextBody);
            email.sendEmail();
        }
        catch (Exception e) {
            ApexPages.Message message = new ApexPages.Message(ApexPages.Severity.ERROR, e.getMessage());
            ApexPages.addMessage(message);
        }
        return null;
    }
}