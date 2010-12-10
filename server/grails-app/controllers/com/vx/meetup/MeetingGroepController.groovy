package com.vx.meetup

class MeetingGroepController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [meetingGroepInstanceList: MeetingGroep.list(params), meetingGroepInstanceTotal: MeetingGroep.count()]
    }

    def create = {
        def meetingGroepInstance = new MeetingGroep()
        meetingGroepInstance.properties = params
        return [meetingGroepInstance: meetingGroepInstance, meetingGroepList: MeetingGroep.list()]
    }

    def save = {
        def meetingGroepInstance = new MeetingGroep(params)
        def logo = request.getFile("logoImage")
        if (!logo.empty) {
            meetingGroepInstance.logo = new MeetingGroepLogo(contentType: logo.contentType, imageData: logo.bytes)
        }

        if (meetingGroepInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'meetingGroep.label', default: 'MeetingGroep'), meetingGroepInstance.id])}"
            redirect(action: "show", id: meetingGroepInstance.id)
        }
        else {
            render(view: "create", model: [meetingGroepInstance: meetingGroepInstance])
        }
    }

    def show = {
        def meetingGroepInstance = MeetingGroep.get(params.id)
        if (!meetingGroepInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'meetingGroep.label', default: 'MeetingGroep'), params.id])}"
            redirect(action: "list")
        }
        else {
            [meetingGroepInstance: meetingGroepInstance]
        }
    }

    def edit = {
        def meetingGroepInstance = MeetingGroep.get(params.id)
        if (!meetingGroepInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'meetingGroep.label', default: 'MeetingGroep'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [meetingGroepInstance: meetingGroepInstance]
        }
    }

    def update = {
        def meetingGroepInstance = MeetingGroep.get(params.id)
        if (meetingGroepInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (meetingGroepInstance.version > version) {

                    meetingGroepInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'meetingGroep.label', default: 'MeetingGroep')] as Object[], "Another user has updated this MeetingGroep while you were editing")
                    render(view: "edit", model: [meetingGroepInstance: meetingGroepInstance])
                    return
                }
            }
            meetingGroepInstance.properties = params

            def logo = request.getFile("logoImage")
            if (!logo.empty) {
                meetingGroepInstance.logo = new MeetingGroepLogo(contentType: logo.contentType, imageData: logo.bytes)
            }

            if (!meetingGroepInstance.hasErrors() && meetingGroepInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'meetingGroep.label', default: 'MeetingGroep'), meetingGroepInstance.id])}"
                redirect(action: "show", id: meetingGroepInstance.id)
            }
            else {
                render(view: "edit", model: [meetingGroepInstance: meetingGroepInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'meetingGroep.label', default: 'MeetingGroep'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def meetingGroepInstance = MeetingGroep.get(params.id)
        if (meetingGroepInstance) {
            try {
                meetingGroepInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'meetingGroep.label', default: 'MeetingGroep'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'meetingGroep.label', default: 'MeetingGroep'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'meetingGroep.label', default: 'MeetingGroep'), params.id])}"
            redirect(action: "list")
        }
    }

    def logo = {
        def meetingGroepInstance = MeetingGroep.get(params.id)
        def logo = meetingGroepInstance.logo
        if (logo) {
            response.contentType = logo.contentType
            response.outputStream << logo.imageData
            response.outputStream.flush()
        } else {
            response.status = 404
        }
    }

    def meetingGroepInfo = {
        [meetingGroep: MeetingGroep.get(params.int('id'))]
    }
}
