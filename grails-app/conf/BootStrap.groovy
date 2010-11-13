import com.vx.meetup.User
import com.vx.meetup.UserRole
import com.vx.meetup.Role
import com.vx.meetup.MeetingGroep
import com.vx.meetup.Meetup

class BootStrap {

    def springSecurityService

    def init = { servletContext ->
        initUsers()
        initMeetingGroups()
        initMeetups()
    }

    def destroy = {
    }

    private void initUsers(it) {
        def role = new Role(authority: 'ROLE_USER').save()
        ['marc', 'michel', 'mrhaki'].each {
            def user = new User(username: it, password: springSecurityService.encodePassword(it), enabled: true).save()
            UserRole.create user, Role.findByAuthority('ROLE_USER'), true
        }
    }

    private void initMeetingGroups() {
        ['Architectuur', 'Grails', 'SEAM', 'Coding', 'Agile SIG', 'Scala'].each {
            def group = new MeetingGroep(titel: it, omschrijving: it).save(flush: true)
            println "$group is created"
        }
    }

    private void initMeetups() {
        createMeetup titel: 'Agile SIG', omschrijving: 'T.O.C. Demming Cycle', datum: new Date(year: 110, month: 11, date: 19)
        createMeetup titel: 'Archictuur SIG', omschrijving: 'Design Patterns', datum: new Date(year: 110, month: 11, date: 19)
        createMeetup titel: 'Gails SIG', omschrijving: 'TDD', datum: new Date(year: 111, month:0, date: 19)
        createMeetup titel: 'Scala Usergroup', omschrijving: 'LIFT', datum: new Date(year: 111, month: 1, date: 19)
        createMeetup titel: 'SEAM SIG', omschrijving: 'IRIS', datum: new Date(year: 111, month: 1, date: 24)
        createMeetup titel: 'Coding Dojo', omschrijving: 'SETS', datum: new Date(year: 111, month: 1, date: 24)
    }

    private void createMeetup(args) {
        def meetup = new Meetup(args).save(flush:true)
        println "$meetup is created"
    }
}
