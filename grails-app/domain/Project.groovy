class Project {
	String name
	String description
	String url
	static belongsTo=[person:Person]
	
    static constraints = {
		name(nullable:false,blank:false)
		description(nullable:false,blank:false)
		url(url:true)
    }
	static mapping = {
		description type:'text'
	}

	boolean isOwner(Person user){
		person?.id==user.id
	}
}
