<head>
<meta name='layout' content='main' />
<title>Login</title>
<style type='text/css' media='screen'>
.login_message {color:red;}
.chk {height:12px;}
</style>
</head>

<body>
		<h2>Entrar</h2>
	
			<g:if test='${flash.message}'>
				<div class='errors'><ul><li>${flash.message}</li></ul></div>
			</g:if>
			<form action='${postUrl}' method='POST'>
				<label for='j_username'>Login:</label>
				<input type='text' name='j_username' id='j_username' value='${request.remoteUser}' />
				<br/>
				<label for='j_password'>Password:</label>
				<input type='password' name='j_password' id='j_password' />
				<br/>
				<label for='remember_me'>Recordarme:</label>
				<input type='checkbox' class='chk' name='_spring_security_remember_me' id='remember_me'
				<g:if test='${hasCookie}'>checked='checked'</g:if> />
				<br/><br/>
				<input type='submit' value='Entrar' />
			</form>
</body>
