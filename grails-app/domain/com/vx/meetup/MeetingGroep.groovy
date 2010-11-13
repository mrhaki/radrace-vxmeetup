package com.vx.meetup

class MeetingGroep {

    static constraints = {
        titel         blank: false, nullable: false
        omschrijving  blank: false, nullable: false
    }

    String titel;
    String omschrijving;

}
