

<%@ page import="com.vx.meetup.MeetingGroep" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'meetingGroep.label', default: 'MeetingGroep')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${meetingGroepInstance}">
            <div class="errors">
                <g:renderErrors bean="${meetingGroepInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" enctype="multipart/form-data">
                <g:hiddenField name="id" value="${meetingGroepInstance?.id}" />
                <g:hiddenField name="version" value="${meetingGroepInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="titel"><g:message code="meetingGroep.titel.label" default="Titel" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: meetingGroepInstance, field: 'titel', 'errors')}">
                                    <g:textField name="titel" value="${meetingGroepInstance?.titel}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="omschrijving"><g:message code="meetingGroep.omschrijving.label" default="Omschrijving" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: meetingGroepInstance, field: 'omschrijving', 'errors')}">
                                    <g:textField name="omschrijving" value="${meetingGroepInstance?.omschrijving}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="logoImage">Logo</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: meetingGroepInstance, field: 'logo', 'errors')}">
                                    <img src="${createLink(action: 'logo', id: meetingGroepInstance.id) }"
			                          alt="${meetingGroepInstance.titel}" title="${meetingGroepInstance.titel }"/>
                                    <br />
                                    <input type="file" id="logoImage" name="logoImage" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="meetups"><g:message code="meetingGroep.meetups.label" default="Meetups" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: meetingGroepInstance, field: 'meetups', 'errors')}">

<ul>
<g:each in="${meetingGroepInstance?.meetups?}" var="m">
    <li><g:link controller="meetup" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="meetup" action="create" params="['meetingGroep.id': meetingGroepInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'meetup.label', default: 'Meetup')])}</g:link>

                                </td>
                            </tr>

                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
