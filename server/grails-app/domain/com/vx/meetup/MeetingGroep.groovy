package com.vx.meetup

class MeetingGroep {

    static constraints = {
        titel         blank: false, nullable: false
        omschrijving  blank: false, nullable: false
    }

    static hasMany = [meetups: Meetup]

    String titel;
    String omschrijving;

    String toString() {
        "Groep: $titel"
    }
}
