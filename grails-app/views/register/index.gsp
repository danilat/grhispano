<head>
	<meta name="layout" content="main" />
	<title>Registro</title>
</head>

<body>
	
		<h2>Registro</h2>
		<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
		</g:if>
		<g:hasErrors bean="${person}">
		<div class="errors">
			<g:renderErrors bean="${person}" as="list" />
		</div>
		</g:hasErrors>

		<g:form action="save">
			<label for='username'>Login:</label>
			<input type="text" name='username' value="${person?.username?.encodeAsHTML()}"/>
			<br/>
			<label for='userRealName'>Nombre completo:</label>
			<input type="text" name='userRealName' value="${person?.userRealName?.encodeAsHTML()}"/>
			<br/>
			<label for='passwd'>Password:</label>
			<input type="password" name='passwd' value="${person?.passwd?.encodeAsHTML()}"/>
			<br/>
			<label for='enabled'>Confirmar Password:</label>
			<input type="password" name='repasswd' value="${person?.passwd?.encodeAsHTML()}"/>
			<br/>
			<label for='email'>Email:</label>
			<input type="text" name='email' value="${person?.email?.encodeAsHTML()}"/>
			<br/>
			<label for='code'>Introduce el código: </label>
			<input type="text" name="captcha" size="8"/>
			<img src="${createLink(controller:'captcha', action:'index')}" align="absmiddle"/>
			<br/><br/>
			<input class='save' type="submit" value="Regístrate!"></input>
		</g:form>
	
</body>
