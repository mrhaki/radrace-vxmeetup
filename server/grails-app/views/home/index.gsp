<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
    <title>Home</title>
    <meta name='layout' content='main' />

  </head>
  <body>

    <div id="home">

      <table border="0" width="100%">

        <tr>
          <td>
            <h1>VX Meetup: alle meetings op een rijtje</h1>

              <g:each in="${meetups}" var="meetup">
                <div class="meetupItem" style="background-image:url(${createLink(controller: 'meetingGroep', action: 'logo', id: meetup.meetingGroep.id)})">
                    <div class="meetupItemInfo">
                      <g:link controller="meetup" action="rsvp" id="${meetup.id}"><g:fieldValue bean="${meetup}" field="titel"/></g:link> <br />
                      <g:fieldValue bean="${meetup}" field="omschrijving"/><br />
                      <g:formatDate date="${meetup.datum}" format="EEEE dd MMMM"/>
                      <br /><br />
                      <g:link controller="meetup" action="create" params="[meetingGroup: meetup.meetingGroep.id]">Nieuwe meetup voor ${meetup.meetingGroep.titel}</g:link>
                    </div>
                 </div>

              </g:each>
          </td>


          <td align="right" width="20%">
            <g:include controller="home" action="upcoming"/>
          </td>
        </tr>


      </table>


    </div>

  </body>
</html>