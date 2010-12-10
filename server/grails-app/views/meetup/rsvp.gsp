<%@ page import="com.vx.meetup.Meetup" %>
<%@ page import="com.vx.meetup.RsvpState" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'meetup.label', default: 'Meetup')}"/>
  <title><g:message code="default.show.label" args="[entityName]"/></title>
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
                <tr>
                  <td>
                    <div id="meetupInfo">
                      <div class="meetupItem" style="background-image:url(${createLink(controller: 'meetingGroep', action: 'logo', id: meetupInstance.meetingGroep.id)})">
                          <div class="meetupItemInfo">
                            <g:link controller="meetup" action="rsvp" id="${meetupInstance.id}"><g:fieldValue bean="${meetupInstance}" field="titel"/></g:link> <br />
                            <g:fieldValue bean="${meetupInstance}" field="omschrijving"/><br />
                            <g:formatDate date="${meetupInstance.datum}" format="EEEE dd MMMM HH:mm"/>
                          </div>
                       </div>
                    </div>
                  </td>
                </tr>
                <tr>
                  <td>
                    <h3>Welke dagen zijn al bezet?</h3>


                  </td>
                </tr>
              </table>

            </td>
            <td>

              <div class="body">
                <h1><g:message code="default.show.label" args="[entityName]"/></h1>
                <g:if test="${flash.message}">
                  <div class="message">${flash.message}</div>
                </g:if>
                <div class="dialog">
                  <table>
                    <tbody>

                    <tr class="prop">
                      <td valign="top" class="name"><g:message code="meetup.id.label" default="Id"/></td>

                      <td valign="top" class="value">${fieldValue(bean: meetupInstance, field: "id")}</td>

                    </tr>

                    <tr class="prop">
                      <td valign="top" class="name"><g:message code="meetup.titel.label" default="Titel"/></td>

                      <td valign="top" class="value">${fieldValue(bean: meetupInstance, field: "titel")}</td>

                    </tr>

                    <tr class="prop">
                      <td valign="top" class="name"><g:message code="meetup.omschrijving.label" default="Omschrijving"/></td>

                      <td valign="top" class="value">${fieldValue(bean: meetupInstance, field: "omschrijving")}</td>

                    </tr>

                    <tr class="prop">
                      <td valign="top" class="name"><g:message code="meetup.datum.label" default="Datum"/></td>

                      <td valign="top" class="value"><g:formatDate date="${meetupInstance?.datum}"/></td>

                    </tr>

                    </tbody>
                  </table>
                </div>

                <br/>


                <div class="dialog">
                  <table><tbody><tr><td>
                    <g:form method="post">
                      <g:hiddenField name="id" value="${meetupInstance?.id}"/>
                      <g:hiddenField name="version" value="${meetupInstance?.version}"/>

                      <g:if test="${rsvpInstance?.rsvpState}">
                        <p style="background-color: yellow">U heeft aangegeven dat u ${rsvpInstance.rsvpState.welNietTekst} naar de meetup komt.</p>
                        <br/>
                      </g:if>
                      <g:else>
                        <p>U heeft niet aangegeven of u naar de meetup komt.</p>
                      </g:else>

                      <g:if test="${meetupInstance.datum > new Date()}">

                        <p>Kom jij ook?</p>

                        <div class="buttons">
                          <span class="button"><g:actionSubmit action="rsvpYes" value="Ja"/></span>
                          <span class="button"><g:actionSubmit action="rsvpNo" value="Nee"/></span>
                          <span class="button"><g:actionSubmit action="rsvpMaybe" value="Misschien"/></span>
                        </div>
                      </g:if>
                    </g:form>

                  </td></tr></tbody></table>
                </div>

              </div>
            </td>
          </tr>
        </table>

      </td>
      <td align="right" width="20%">
        <h2>Wie komt?</h2>

        <h3>Wij komen</h3>

        <g:findAll in="${people}" expr="it.rsvpState == RsvpState.YES">
          ${it.user.username} ${it.rsvpState.welNietTekst}<br/>
        </g:findAll>

        <h3>Wij komen misschien</h3>

        <g:findAll in="${people}" expr="it.rsvpState == RsvpState.MAYBE">
          ${it.user.username} ${it.rsvpState.welNietTekst}<br/>
        </g:findAll>

        <h3>Wij komen niet</h3>

        <g:findAll in="${people}" expr="it.rsvpState == RsvpState.NO">
          ${it.user.username} ${it.rsvpState.welNietTekst}<br/>
        </g:findAll>

      </td>
    </tr>

  </table>
</div>
</body>
</html>
