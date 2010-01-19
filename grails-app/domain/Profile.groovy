class Profile {
	//static searchable = true  
	static belongsTo = [person:Person]
	byte[] photo
	String bio
	String enterprise
	String enterpriseUrl
	String web
	String twitter
	String location
	Date dateCreated
	Date lastUpdated
    static constraints = {
		photo(nullable:true)
		bio(nullable:true)
		web(nullable:true,url:true)
		twitter(nullable:true)
		enterprise(nullable:true)
		enterpriseUrl(nullable:true,url:true)
		location(nullable:true)
		dateCreated(nullable:true)
		lastUpdated(nullable:true)
    }
	static mapping = {
		bio type:'text'
	}
}
