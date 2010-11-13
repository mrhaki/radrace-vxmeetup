package com.vx.meetup

class MeetupController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST",rsvpYes:"POST", rsvpNo:"POST", rsvpMaybe:"POST"]

    def springSecurityService

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [meetupInstanceList: Meetup.list(params), meetupInstanceTotal: Meetup.count()]
    }

    def create = {
        def meetupInstance = new Meetup()
        meetupInstance.properties = params
        return [meetupInstance: meetupInstance]
    }

    def save = {
        def meetupInstance = new Meetup(params)
        if (meetupInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'meetup.label', default: 'Meetup'), meetupInstance.id])}"
            redirect(action: "show", id: meetupInstance.id)
        }
        else {
            render(view: "create", model: [meetupInstance: meetupInstance])
        }
    }

    def show = {
        def meetupInstance = Meetup.get(params.id)
        if (!meetupInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'meetup.label', default: 'Meetup'), params.id])}"
            redirect(action: "list")
        }
        else {
            [meetupInstance: meetupInstance]
        }
    }

    def edit = {
        def meetupInstance = Meetup.get(params.id)
        if (!meetupInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'meetup.label', default: 'Meetup'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [meetupInstance: meetupInstance]
        }
    }

    def update = {
        def meetupInstance = Meetup.get(params.id)
        if (meetupInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (meetupInstance.version > version) {

                    meetupInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'meetup.label', default: 'Meetup')] as Object[], "Another user has updated this Meetup while you were editing")
                    render(view: "edit", model: [meetupInstance: meetupInstance])
                    return
                }
            }
            meetupInstance.properties = params
            if (!meetupInstance.hasErrors() && meetupInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'meetup.label', default: 'Meetup'), meetupInstance.id])}"
                redirect(action: "show", id: meetupInstance.id)
            }
            else {
                render(view: "edit", model: [meetupInstance: meetupInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'meetup.label', default: 'Meetup'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def meetupInstance = Meetup.get(params.id)
        if (meetupInstance) {
            try {
                meetupInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'meetup.label', default: 'Meetup'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'meetup.label', default: 'Meetup'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'meetup.label', default: 'Meetup'), params.id])}"
            redirect(action: "list")
        }
    }

    def rsvp = {
        def meetupInstance = Meetup.get(params.id)
        if (!meetupInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'meetup.label', default: 'Meetup'), params.id])}"
            redirect(action: "list")
        }
        else {
            def rsvpInstance = getRsvpForMeetup(meetupInstance)
            return [meetupInstance: meetupInstance, rsvpInstance: rsvpInstance]
        }
    }

    def rsvpYes = {
        changeRsvp RsvpState.YES
    }

    def rsvpNo = {
        changeRsvp RsvpState.NO

    }

    def rsvpMaybe = {
        changeRsvp RsvpState.MAYBE

    }

    def changeRsvp(rsvpState) {
        def meetupInstance = Meetup.get(params.id)
        if (!meetupInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'meetup.label', default: 'Meetup'), params.id])}"
            redirect(action: "list")
        }
        if (meetupInstance.datum > new Date()) {
            def rsvp = getRsvpForMeetup(meetupInstance);
            rsvp.rsvpState = rsvpState
            if (!rsvp.hasErrors() && rsvp.save(flush: true)) {
                redirect action: "rsvp", params: [id: params.id]
            }
            else {
                render(view: "rsvp", model: [meetupInstance: meetupInstance, rsvpInstance: rsvp])
            }
        }
        else {
            flash.message ="U kunt uw keuze niet meer wijzigen"
            redirect action:"rsvp", params: [id: params.id]
        }
    }

    def getRsvpForMeetup(meetupInstance) {
        def user = User.get(springSecurityService.getPrincipal().id)
        def rsvp = Rsvp.findByUserAndMeetup(user, meetupInstance);
        if (rsvp == null) rsvp = new Rsvp(user: user, meetup: meetupInstance);
        return rsvp
    }

}
