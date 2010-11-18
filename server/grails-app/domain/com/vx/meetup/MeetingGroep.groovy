package com.vx.meetup

class MeetingGroep {

    static constraints = {
        titel         blank: false, nullable: false
        omschrijving  blank: false, nullable: false
        logo          nullable: true
    }

    static hasMany = [meetups: Meetup]

    String titel
    String omschrijving
    byte[] logo

    String toString() {
        "Groep: $titel"
    }
}
