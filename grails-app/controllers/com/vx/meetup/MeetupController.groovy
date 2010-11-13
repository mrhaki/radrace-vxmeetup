package com.vx.meetup

class MeetupController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

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
            return [meetupInstance: meetupInstance]
        }
    }

    def rsvpYes = {
        changeRsvp "yes"
    }

    def rsvpNo = {
        changeRsvp "no"

    }

    def rsvpMaybe = {
        changeRsvp "maybe"

    }

    def changeRsvp(rsvpState) {



       redirect action: "rsvp", params: [id: params.id] 
    }

}