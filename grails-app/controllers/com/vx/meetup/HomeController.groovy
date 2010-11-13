package com.vx.meetup

class HomeController {

    def index = {
        [meetups: upcomingMeetups()]
    }

    def upcoming = {
        [meetups: upcomingMeetups()]
    }

    def upcomingMeetups() {
        Meetup.list(sort: 'datum', order: 'desc')
    }
}
