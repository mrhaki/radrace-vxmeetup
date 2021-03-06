
<%@ page import="com.vx.meetup.MeetingGroep" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'meetingGroep.label', default: 'MeetingGroep')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'meetingGroep.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="titel" title="${message(code: 'meetingGroep.titel.label', default: 'Titel')}" />
                        
                            <g:sortableColumn property="omschrijving" title="${message(code: 'meetingGroep.omschrijving.label', default: 'Omschrijving')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${meetingGroepInstanceList}" status="i" var="meetingGroepInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${meetingGroepInstance.id}">${fieldValue(bean: meetingGroepInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: meetingGroepInstance, field: "titel")}</td>
                        
                            <td>${fieldValue(bean: meetingGroepInstance, field: "omschrijving")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${meetingGroepInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
