package com.vx.meetup

import grails.plugin.spock.ControllerSpec

class HomeControllerSpec extends ControllerSpec {

    def "upcomingMeetups() with two dates in future must return two dates"() {
        when:
            mockMeetups([2, 3])
        then:
            controller.upcoming().meetups.size() == 2
    }

    def "upcomingMeetups() 3 meetups of which 2 have dates in future and 1 in the past must return two dates"() {
        when:
            mockMeetups([2, 3, -2])
        then:
            controller.upcoming().meetups.size() == 2
    }

    def "upcomingMeetups() with two dates in the future must return two dates sorted ascending by date"() {
        when:
            mockMeetups([5, 2])
        then:
            controller.upcoming().meetups[0].datum < controller.upcoming().meetups[1].datum
    }

    private void mockMeetups(dayDifference) {
        def meetups = dayDifference.collect {
            new Meetup(datum: new Date() + it)
        }
        mockDomain Meetup, meetups
    }


}
