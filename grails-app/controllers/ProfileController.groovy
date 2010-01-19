import org.codehaus.groovy.grails.plugins.springsecurity.Secured
import grails.converters.*
class ProfileController {
	def authenticateService
	//def searchableService
	
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
		params.sort = "lastUpdated"
		params.order = "desc"
		[ profileInstanceList: Profile.list( params ), profileInstanceTotal: Profile.count() ] 
    }

    def show = {
        def profileInstance = Person.findByUsername( params.id )?.profile

        if(!profileInstance) {
            flash.message = "Perfil de ${params.id} no encontrado"
            redirect(action:list)
        }
        else { return [ profileInstance : profileInstance ] }
    }

	def thumb = {
		def profileInstance = Person.findByUsername( params.id )?.profile
		if(profileInstance?.photo){
			response.setContentType("image/png")
			response.outputStream << profileInstance?.photo
		}else{}
	}
	
	@Secured(["ROLE_USER"])
    def delete = {
		def person
		def user = authenticateService.userDomain()
		if (user) {
			person = Person.get(user.id)
		}
        def profileInstance = person.profile
        if(profileInstance) {
            try {
                profileInstance.delete()
                flash.message = "Tu perfil ha sido eliminado"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Profile ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "Perfil de ${params.id} no encontrado"
            redirect(action:list)
        }
    }
	
	@Secured(["ROLE_USER"])
    def edit = {
    	def person
		def user = authenticateService.userDomain()
		if (user) {
			person = Person.get(user.id)
		}
        def profileInstance = person.profile

        if(!profileInstance) {
            flash.message = "Perfil no encontrado"
            redirect(action:list)
        }
        else {
            return [ profileInstance : profileInstance ]
        }
    }
	
	@Secured(["ROLE_USER"])
	def update = {
    	def person
		def user = authenticateService.userDomain()
		if (user) {
			person = Person.get(user.id)
		}
        def profileInstance = person.profile
        if(profileInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(profileInstance.version > version) {
                    
                    profileInstance.errors.rejectValue("version", "profile.optimistic.locking.failure", "Another user has updated this Profile while you were editing.")
                    render(view:'edit',model:[profileInstance:profileInstance])
                    return
                }
            }
            bindData(profileInstance, params, ["person.id","photo"])
            def photo = request.getFile('photo')
        	if (photo?.size > 0) {
        		def imageTool = new ImageTool()
        		imageTool.load(photo.getBytes())
        		imageTool.thumbnail(240)
        		profileInstance.photo = imageTool.getBytes("PNG")
        	}
            if(!profileInstance.hasErrors()) {
				profileInstance.save()
                flash.message = "Tu perfil ha sido actualizado"
                redirect(action:show,id:profileInstance.person.username)
            }
            else {
                render(view:'edit',model:[profileInstance:profileInstance])
            }
        }
        else {
            flash.message = "Perfil no encontrado"
            redirect(action:edit)
        }
    }
}
