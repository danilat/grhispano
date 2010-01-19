<html>
    <head>
        <title>grHispano: <g:layoutTitle default="" /></title>
        <link rel="stylesheet" href="${createLinkTo(dir:'css',file:'style.css')}" />
        <link rel="shortcut icon" href="${createLinkTo(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />				
    </head>
    <body>
		<div id="content">
			<h1><a href="${createLink(controller:'profile',action:'list')}"><span class="hr">gr</span>Hispano</a></h1>
			<ul id="top">
				<li><a class="current" href="${createLink(controller:'profile',action:'list')}">Home</a></li>
	            	<g:isNotLoggedIn>
	            <li><g:link controller="register">Regístrate</g:link></li>
	            <li><g:link controller="login">Entrar</g:link></li>
	            </g:isNotLoggedIn>
	            <g:isLoggedIn>
	            <li><g:link controller="profile" action="edit">Actualiza tu perfil</g:link></li>
	            <li><g:link controller="logout">Salir</g:link></li>
	            </g:isLoggedIn>
			</ul>

			<div id="intro">
				<p>El quién es quién dentro de la comunidad <a href="http://groovy.codehaus.org/">Groovy</a> / <a href="http://grails.org/">Grails</a> / <a href="http://griffon.codehaus.org/">Griffon</a> / <a href="http://easyb.org/">Easyb</a>... de habla hispana </p>
			</div>
			<g:isLoggedIn>
			<g:if test="${!loggedInProfileInfo(field:'bio') || !loggedInProfileInfo(field:'location')}">
			<div class="message">Tienes poca información en <g:link controller="profile" action="show" id="${loggedInUserInfo(field:'username')}">tu perfil</g:link>, para poder darte a conocer mejor a la comunidad <g:link controller="profile" action="edit">completa</g:link> tu biografía y localización.</div><br/>
			</g:if>
			</g:isLoggedIn>
			<div id="left">
				<g:layoutBody />
			</div>
			<div id="right">
				<%/*
				<h3>Buscar en la web</h3>
				<ul>
					<li>
						<g:form url='[controller: "searchable", action: "index"]' id="searchableForm" name="searchableForm" method="get">
							<input type="text" id="query" name="q" value="${params.q}"/> <br/>
							<input type="submit" value="Buscar">
						</g:form>
					</li>
				</ul>
				<br/>
				*/%>
				<h3>Sitios de la comunidad:</h3>
				<ul>
					<li><a href="http://groovy.org.es/">groovy.org.es</a></li>
	        		<li><a href="http://grails.org.mx/">grails.org.mx</a></li>
	        		<li><a href="http://groups.google.com/group/grailsencastellano">Lista grailsEnCastellano</a></li>
	        		<li><a href="http://es.debugmodeon.com/grupo/groovy">Grupo Groovy en debugmodeon</a></li>
	        		<li><a href="http://es.debugmodeon.com/grupo/grails">Grupo Grails en debugmodeon</a></li>
	        		<li><a href="http://es.debugmodeon.com/grupo/griffon">Grupo Griffon en debugmodeon</a></li>
				</ul>
			</div>
			<br/><br/>
			<div id="footer">
				<p>grHispano es por el momento un simple directorio de programadores hispanos que utilizan groovy y alguno de los frameworks o librerías relacionadas con el lenguaje. El código es libre y <a href="http://github.com/danilat/grhispano">está disponible en github</a> para quien quiera verlo o utilizarlo como le de la gana, bajo licencia <a href="http://sam.zoy.org/wtfpl/">WTFPL</a> ;)</p>
				<p><a target="_blank" href="http://www.stylishtemplate.com" title="Website Templates">Website Templates</a> by <a title="Free CSS Templates" href="http://www.solucija.com/">Solucija</a> &middot; Released under a <a href="http://creativecommons.org/licenses/by-nc-sa/3.0/">Creative Commons Licence</a>. Powered by <a href="http://grails.org/">Grails</a></p>
			</div>
		</div>
    </body>	
</html>