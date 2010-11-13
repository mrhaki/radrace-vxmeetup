package com.vx.meetup

class Meetup {

    String titel
    String omschrijving
    Date datum
    String tijd

    static belongsTo = [meetingGroep: MeetingGroep]

    static constraints = {
        meetingGroep()
        titel blank: false, nullable: false
        omschrijving blank: false, nullable: false
        datum blank: false, nullable: false
        tijd blank: false, nullable: false
    }

    String toString() {
        "Meetup: $titel"
    }
}
