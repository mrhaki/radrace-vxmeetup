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
        Locale.setDefault(new Locale("nl", "NL"))
    }

    def destroy = {
    }

    private void initUsers(it) {
        if (User.count() == 0) {
            def role = new Role(authority: 'ROLE_USER').save()
            ['marc', 'michel', 'mrhaki'].each {
                def user = new User(username: it, password: springSecurityService.encodePassword(it), enabled: true).save()
                UserRole.create user, Role.findByAuthority('ROLE_USER'), true
            }
        }
    }

    private void initMeetingGroups() {
        if (MeetingGroep.count() == 0) {
            ['Architectuur', 'Grails', 'SEAM', 'Coding', 'Agile SIG', 'Scala'].each {
                def group = new MeetingGroep(titel: it, omschrijving: it).save(flush: true)
                println "$group is created"
            }
        }
    }

    private void initMeetups() {
        if (Meetup.count() == 0) {
            createMeetup groep: 'Agile SIG', titel: 'Agile SIG', omschrijving: 'T.O.C. Demming Cycle', datum: createDate(year: 110, month: 11, date: 19), tijd: "18.30"
            createMeetup groep: 'Architectuur', titel: 'Archictuur SIG', omschrijving: 'Design Patterns', datum: createDate(year: 110, month: 11, date: 19), tijd: "18.30"
            createMeetup groep: 'Grails', titel: 'Gails SIG', omschrijving: 'TDD', datum: createDate(year: 111, month:0, date: 19), tijd: "18.30"
            createMeetup groep: 'Scala', titel: 'Scala Usergroup', omschrijving: 'LIFT', datum: createDate(year: 111, month: 1, date: 19), tijd: "18.30"
            createMeetup groep: 'SEAM', titel: 'SEAM SIG', omschrijving: 'IRIS', datum: createDate(year: 111, month: 1, date: 24), tijd: "18.30"
            createMeetup groep: 'Coding', titel: 'Coding Dojo', omschrijving: 'SETS', datum: createDate(year: 111, month: 1, date: 24), tijd: "18.30"
            createMeetup groep: 'Coding', titel: 'Java weekend', omschrijving: 'Weekend fun', datum: createDate(year: 110, month: 10, date: 12), tijd: "18.30"
        }
    }

    private Date createDate(args) {
        Date date = new Date(args)
        date.clearTime()
        return date
    }

    private void createMeetup(args) {
        def datum = args.datum
        datum.clearTime()
        def group = MeetingGroep.findByTitel(args.groep)
        println "found $group"
        def meetup = new Meetup(meetingGroep: group, titel: args.titel, omschrijving: args.omschrijving, datum: datum, tijd: args.tijd).save(flush:true)
        println "$meetup is created"
    }
}
