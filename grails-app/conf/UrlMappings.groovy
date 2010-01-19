class UrlMappings {
    static mappings = {
      "/$controller/$action?/$id?"{
	      constraints {
			 // apply constraints here
		  }
	  }
      "/"(controller:"profile", action:"list")
      "/profile/$id"(controller:"profile", action:"show")
      "/profile/edit"(controller:"profile", action:"edit")
      "/profile/update"(controller:"profile", action:"update")
      "/profile/delete"(controller:"profile", action:"delete")
	  "500"(view:'/error')
	}
}
