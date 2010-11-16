<div class="upcomingMeetups">
<h2>Aankomende Meetups</h2>

<table border="0">
  <g:each in="${meetups}" var="meetup">
    <tr>
      <td>
        <h3><g:link controller="meetup" action="create" params="${meetup}"></g:link></h3>
        <g:link controller="meetup" action="rsvp" id="${meetup.id}"><g:fieldValue bean="${meetup}" field="titel"/></g:link> <br />
        <g:fieldValue bean="${meetup}" field="omschrijving"/><br />
        <g:formatDate date="${meetup.datum}" format="EEEE dd MMMM"/>
      </td>
    </tr>
  </g:each>
</table>
</div>