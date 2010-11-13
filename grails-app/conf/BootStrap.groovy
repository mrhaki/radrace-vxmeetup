import com.vx.meetup.User
import com.vx.meetup.UserRole
import com.vx.meetup.Role

class BootStrap {

    def springSecurityService

    def init = { servletContext ->
        def role = new Role(authority: 'ROLE_USER').save()
        ['marc', 'michel', 'mrhaki'].each {
            def user = new User(username: it, password: springSecurityService.encodePassword(it), enabled: true).save()
            UserRole.create user, Role.findByAuthority('ROLE_USER'), true
        }
    }
    def destroy = {
    }
}
