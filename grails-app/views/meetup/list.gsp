
<%@ page import="com.vx.meetup.Meetup" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'meetup.label', default: 'Meetup')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'meetup.id.label', default: 'Id')}" />
                        
                            <th><g:message code="meetup.meetingGroep.label" default="Meeting Groep" /></th>
                        
                            <g:sortableColumn property="titel" title="${message(code: 'meetup.titel.label', default: 'Titel')}" />
                        
                            <g:sortableColumn property="omschrijving" title="${message(code: 'meetup.omschrijving.label', default: 'Omschrijving')}" />
                        
                            <g:sortableColumn property="datum" title="${message(code: 'meetup.datum.label', default: 'Datum')}" />
                        
                            <g:sortableColumn property="tijd" title="${message(code: 'meetup.tijd.label', default: 'Tijd')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${meetupInstanceList}" status="i" var="meetupInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${meetupInstance.id}">${fieldValue(bean: meetupInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: meetupInstance, field: "meetingGroep")}</td>
                        
                            <td>${fieldValue(bean: meetupInstance, field: "titel")}</td>
                        
                            <td>${fieldValue(bean: meetupInstance, field: "omschrijving")}</td>
                        
                            <td><g:formatDate date="${meetupInstance.datum}" /></td>
                        
                            <td>${fieldValue(bean: meetupInstance, field: "tijd")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${meetupInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
