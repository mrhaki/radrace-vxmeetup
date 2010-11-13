<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
    <title>Simple GSP page</title>
    <meta name='layout' content='main' />

  </head>
  <body>

    <div id="home">

      <table border="0" width="100%">

        <tr>
          <td>
            <h1>VX Meetup: alle meetings op een rijtje</h1>

              <g:each in="${meetups}" var="meetup">
                <div class="meetupItem">
                    <g:link controller="meetup" action="rsvp" id="${meetup.id}"><g:fieldValue bean="${meetup}" field="titel"/></g:link> <br />
                    <g:fieldValue bean="${meetup}" field="omschrijving"/><br />
                    <g:formatDate date="${meetup.datum}" format="EEEE dd MMMM"/>
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