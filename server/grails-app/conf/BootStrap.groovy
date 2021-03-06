import com.vx.meetup.User
import com.vx.meetup.UserRole
import com.vx.meetup.Role
import com.vx.meetup.MeetingGroep
import com.vx.meetup.Meetup
import com.vx.meetup.MeetingGroepLogo



class BootStrap {

    def springSecurityService

    def init = { servletContext ->
        initUsers()
        initMeetingGroeps()
        initMeetups()
        setDefaultLocale()
    }

    def destroy = {
    }

    private def setDefaultLocale() {
        Locale.setDefault(new Locale("nl", "NL"))
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

    private void initMeetingGroeps() {
        if (MeetingGroep.count() == 0) {
            ['Architectuur': 'architect.jpg', 'Grails': 'grails.png', 'SEAM': 'seam.png', 'Coding': 'coding.jpg',
                    'Agile': 'agile.png', 'Scala': 'scala.png'].each { titel, logo ->
                createMeetingGroep titel, logo
            }
        }
    }

    private void createMeetingGroep(titel, logoImageName) {
        def image = new File("web-app/images/logo/$logoImageName").bytes
        def contentType = "image/${logoImageName[-3..-1]}"
        def logoImage = new MeetingGroepLogo(contentType: contentType, imageData: image)
        def group = new MeetingGroep(titel: titel, omschrijving: titel, logo: logoImage).save(flush: true)
        println "$group is created"
    }

    private void initMeetups() {
        if (Meetup.count() == 0) {
            createMeetup groep: 'Agile', titel: 'Agile SIG', omschrijving: 'T.O.C. Demming Cycle', datum: createDate(year: 2010, month: 11, date: 19, hourOfDay: 20, minute: 0)
            createMeetup groep: 'Architectuur', titel: 'Archictuur SIG', omschrijving: 'Design Patterns', datum: createDate(year: 2010, month: 11, date: 19, hourOfDay: 20, minute: 0)
            createMeetup groep: 'Grails', titel: 'Gails SIG', omschrijving: 'TDD', datum: createDate(year: 2011, month:0, date: 19, hourOfDay: 17, minute: 45)
            createMeetup groep: 'Scala', titel: 'Scala Usergroup', omschrijving: 'LIFT', datum: createDate(year: 2011, month: 1, date: 19, hours: 20)
            createMeetup groep: 'SEAM', titel: 'SEAM SIG', omschrijving: 'IRIS', datum: createDate(year: 2011, month: 1, date: 24, hourOfDay: 18, minute: 30)
            createMeetup groep: 'Coding', titel: 'Coding Dojo', omschrijving: 'SETS', datum: createDate(year: 2011, month: 1, date: 24, hourOfDay: 18, minute: 0)
            createMeetup groep: 'Coding', titel: 'Java weekend', omschrijving: 'Weekend fun', datum: createDate(year: 2010, month: 10, date: 12, hourOfDay: 17, minute: 0)
        }
    }

    private Date createDate(args) {
        def cal = Calendar.instance
        args = args + [second: 0]
        cal.set args
        return cal.time
    }

    private void createMeetup(args) {
        def datum = args.datum
        def group = MeetingGroep.findByTitel(args.groep)
        println "found $group"
        def meetup = new Meetup(meetingGroep: group, titel: args.titel, omschrijving: args.omschrijving, datum: datum).save(flush:true)
        println "$meetup is created"
    }
}
