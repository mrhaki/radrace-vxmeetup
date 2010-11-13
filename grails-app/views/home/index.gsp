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
            <ul>
            <g:each in="['Agile SIG', 'Architectuur SIG']">
              <li>${it}</li>
            </g:each>
            </ul>
          </td>


          <td>
            <g:include controller="home" action="upcoming"/>
          </td>
        </tr>


      </table>


    </div>

  </body>
</html>