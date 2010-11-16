package com.vx.meetup

class Rsvp {

    static belongsTo = [Meetup, User]

    Meetup meetup;
    User user;
    RsvpState rsvpState;

    static constraints = {
    }
}
