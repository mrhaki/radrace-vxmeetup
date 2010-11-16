package com.vx.meetup

enum RsvpState {

    YES("wel"),
    NO("niet"),
    MAYBE("misschien")

    String welNietTekst

    RsvpState(String welNietTekst) {
        this.welNietTekst = welNietTekst;
    }

}
