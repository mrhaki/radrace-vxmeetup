package com.vx.meetup

class HomeController {

    def index = {
        [meetups: upcomingMeetups()]
    }

    def upcoming = {
        [meetups: upcomingMeetups()]
    }

    def upcomingMeetups() {
        def now = new Date()
        now.clearTime()
        Meetup.findAllByDatumGreaterThanEquals(now, [sort: 'datum', order: 'asc'])
    }
}
