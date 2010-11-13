

<%@ page import="com.vx.meetup.Meetup" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'meetup.label', default: 'Meetup')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${meetupInstance}">
            <div class="errors">
                <g:renderErrors bean="${meetupInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="titel"><g:message code="meetup.titel.label" default="Titel" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: meetupInstance, field: 'titel', 'errors')}">
                                    <g:textField name="titel" value="${meetupInstance?.titel}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="omschrijving"><g:message code="meetup.omschrijving.label" default="Omschrijving" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: meetupInstance, field: 'omschrijving', 'errors')}">
                                    <g:textField name="omschrijving" value="${meetupInstance?.omschrijving}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="datum"><g:message code="meetup.datum.label" default="Datum" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: meetupInstance, field: 'datum', 'errors')}">
                                    <g:datePicker name="datum" precision="day" value="${meetupInstance?.datum}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
