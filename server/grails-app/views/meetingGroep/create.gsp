<%@ page import="com.vx.meetup.MeetingGroep" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'meetingGroep.label', default: 'MeetingGroep')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div>
          <table border="0" width="100%">
            <tr>
              <td>

                <table border="0" width="100%">
                  <tr>
                    <td width="30%">
                      <h2>Bestaande groepen</h2>
                      <g:each in="${meetingGroepList}" var="groep">
                        <div class="meetupGroepItem" style="background-image:url(${createLink(controller: 'meetingGroep', action: 'logo', id: groep.id)})">
                          <div class="meetupGroepItemInfo">
                            <g:fieldValue bean="${groep}" field="titel"/><br />
                          </div>
                        </div>
                      </g:each>
                    </td>
                    <td>
                      <h1><g:message code="default.create.label" args="[entityName]" /></h1>
                      <g:if test="${flash.message}">
                      <div class="message">${flash.message}</div>
                      </g:if>
                      <g:hasErrors bean="${meetingGroepInstance}">
                      <div class="errors">
                          <g:renderErrors bean="${meetingGroepInstance}" as="list" />
                      </div>
                      </g:hasErrors>
                      <g:form action="save" method="post" enctype="multipart/form-data">
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
                                          <td valign="top" class="value">
                                              <input type="file" id="logoImage" name="logoImage" />
                                          </td>
                                      </tr>

                                  </tbody>
                              </table>
                          </div>
                          <div class="buttons">
                              <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                          </div>
                      </g:form>
                    </td>
                  </tr>
                </table>


              </td>

              <td align="right" width="20%">
                <g:include controller="home" action="upcoming"/>
              </td>
            </tr>
          </table>

        </div>
    </body>
</html>
