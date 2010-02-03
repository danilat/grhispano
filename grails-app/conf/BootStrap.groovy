class BootStrap {

     def init = { servletContext ->
		def roles = ['ROLE_ADMIN','ROLE_USER']
		roles.each{ role ->
			def auth = Authority.findByAuthority(role)
			if(!auth){
				auth = new Authority(authority:role,description:"${role} users")
				auth.save()
			}
		}
     }
     def destroy = {
     }
} 