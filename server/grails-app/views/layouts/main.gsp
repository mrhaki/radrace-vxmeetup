<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'vx.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />
    </head>
    <body>
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
        </div>

        <div id="header">
          <table border="0">
            <tr>
              <td width="200">
                <div class="logoimg">
                <img align="left" src="${resource(dir:'images', file:'logo.gif')}" alt="VX Meetup" width="170" height="72"/>
                </div>
              </td>
              <td>
                <div class="navigation">
                <table border="0">
                  <tr>
                    <td colspan="4" align="right">
                        <div class="userinfo">
                        <sec:ifLoggedIn>
                            Welkom <sec:username/>!
                            <g:link controller='logout'>Logout</g:link>
                        </sec:ifLoggedIn>
                        <sec:ifNotLoggedIn>
                            <g:link controller='login' action='auth'>Login</g:link>
                        </sec:ifNotLoggedIn>
                        </div>
                    </td>
                  </tr>
                  <tr>
                    <td><g:link controller='home' action="index">Home</g:link></td>
                    <td><g:link controller="meetup" action="create">Nieuwe Meetup</g:link></td>
                    <td><g:link controller='meetingGroep' action="create">Nieuwe groep</g:link></td>
                    <td><a href="/VXMeetup/beheer/index.gsp">Beheer</a></td>
                  </tr>
                </table>
                </div>
              </td>
            </tr>
          </table>

        </div>

        <g:layoutBody />

    </body>
</html>