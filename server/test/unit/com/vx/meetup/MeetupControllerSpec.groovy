package com.vx.meetup

import grails.plugin.spock.ControllerSpec

class MeetupControllerSpec extends ControllerSpec {

    def "bezetteDagen() roept de bezette dagen service aan"() {
        given:
            def jaar = 2010
            def maand = 3
            def bezetteDagenService = Mock(BezetteDagenService)
        when:
            controller.bezetteDagenService = bezetteDagenService
            controller.params.maand = maand
            controller.params.jaar = jaar
            controller.bezetteDagen()
        then:
            1 * bezetteDagenService.getBezetteDagen(jaar, maand) >> []
    }

}
