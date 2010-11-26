
<%@ page import="com.vx.meetup.Meetup" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'meetup.label', default: 'Meetup')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="meetup.id.label" default="Id" /></td>

                            <td valign="top" class="value">${fieldValue(bean: meetupInstance, field: "id")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="meetup.meetingGroep.label" default="Meeting Groep" /></td>

                            <td valign="top" class="value"><g:link controller="meetingGroep" action="show" id="${meetupInstance?.meetingGroep?.id}">${meetupInstance?.meetingGroep?.encodeAsHTML()}</g:link></td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="meetup.titel.label" default="Titel" /></td>

                            <td valign="top" class="value">${fieldValue(bean: meetupInstance, field: "titel")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="meetup.omschrijving.label" default="Omschrijving" /></td>

                            <td valign="top" class="value">${fieldValue(bean: meetupInstance, field: "omschrijving")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="meetup.datum.label" default="Datum" /></td>

                            <td valign="top" class="value"><g:formatDate date="${meetupInstance?.datum}" /></td>

                        </tr>

                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${meetupInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
