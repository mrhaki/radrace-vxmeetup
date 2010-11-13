<%@ page import="com.vx.meetup.Meetup" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'meetup.label', default: 'Meetup')}"/>
  <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
  <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></span>
  <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link></span>
</div>
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
</body>
</html>
