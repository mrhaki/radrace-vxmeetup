package com.vx.meetup

class MeetingGroepLogo {

    String contentType
    byte[] imageData

    static belongsTo = MeetingGroep

    static constraints = {
        imageData maxSize: 1024 * 1024
        contentType blank: false
    }
}
