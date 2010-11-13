package com.vx.meetup

class Meetup {

    String titel
    String omschrijving
    Date datum

    static constraints = {
        titel blank: false, nullable: false
        omschrijving blank: false, nullable: false
        datum blank: false, nullable: false
    }
}
