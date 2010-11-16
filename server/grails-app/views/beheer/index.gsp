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
            <h1>Beheer</h1>

            <g:link controller="user" action="search">Gebruikers</g:link> <br/>
            <g:link controller="meetup" action="list">Meetups</g:link>    <br/>
            <g:link controller="meetingGroep" action="list">Groepen</g:link>   <br/>
            
      </table>


    </div>

  </body>
</html>