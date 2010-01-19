import org.springframework.security.context.SecurityContextHolder as SCH
import grails.util.Environment

class CommonsTagLib {
	def authenticateService
	
	def nl2br ={att, body->
		out << body().replaceAll('\n','<br/>')
	}
	def loggedInProfileInfo ={att, body->
		if (authenticateService.isLoggedIn()) {
			def principal = SCH.context.authentication.principal.domainClass
			def profile = Profile.find("from Profile where person.id=:person",[person:principal.id])
			def field = profile."$att.field"
			if(field!=null || field!=""){
				out << field
				return field
			}
		}
	}
	
	def gmapsKey = {
		def key
		switch(Environment.current) {
		case Environment.DEVELOPMENT:
			key = 'ABQIAAAA6_NbyUlUMh5DQaYd3JXikRQ5t1WJxELeJo7tjIZ-7svRBGSLtBT8_MxMvSLBl_advabyFTtF0R1TOQ'
		break
		case Environment.PRODUCTION:
			key = 'ABQIAAAA6_NbyUlUMh5DQaYd3JXikRTZZDnpkZUU7d4pNHCSa9_eX_1qohSt6CRq17TD2lKbc5Ltsg1IsorwDw'
		break
		}
		 
		out << '<script src="http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=false&amp;key='+key+'" type="text/javascript"></script>'
	}
}
