

<%@ page import="com.vx.meetup.Meetup" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'meetup.label', default: 'Meetup')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <g:javascript library="prototype" />
    </head>
    <body>
        <div>
          <table border="0" width="100%">
            <tr>
              <td>
                <table border="0" width="100%">
                  <tr>
                    <td width="30%">

                      <table border="0" width="100%">
                        <g:if test="${selectedMeetingGroep}">
                        <tr>
                          <td>
                            <div id="meetingGroepInfo">
                              <div class="meetupItem" style="background-image:url(${createLink(controller: 'meetingGroep', action: 'logo', id: selectedMeetingGroep.id)})">
                                  <div class="meetupItemInfo">
                                    <g:fieldValue bean="${selectedMeetingGroep}" field="titel"/>
                                  </div>
                              </div>
                            </div>
                          </td>
                        </tr>
                        </g:if>
                        <tr>
                          <td>
                            <h3>Welke dagen zijn al bezet?</h3>


                          </td>
                        </tr>
                      </table>

                    </td>

                    <td>

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
                                              <label for="meetingGroep.id"><g:message code="meetup.meetingGroep.label" default="Meeting Groep" /></label>
                                          </td>
                                          <td valign="top" class="value ${hasErrors(bean: meetupInstance, field: 'meetingGroep', 'errors')}">
                                              <g:select name="meetingGroep.id"
                                                  from="${com.vx.meetup.MeetingGroep.list()}"
                                                  optionKey="id" value="${meetupInstance?.meetingGroep?.id}"
                                                  onchange="${remoteFunction(
                                                    controller: 'meetingGroep', action: 'meetingGroepInfo',
                                                    params: '\'id=\' + escape(this.value)',
                                                    update: 'meetingGroepInfo'
                                                  )}"
                                              />

                                          </td>
                                      </tr>

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
                                              <g:datePicker name="datum" precision="minute" value="${meetupInstance?.datum}"  />
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
