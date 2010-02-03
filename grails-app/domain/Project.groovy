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

	boolean isOwner(Person user){
		person?.id==user.id
	}
}
