

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Desarrolladores</title>
    </head>
    <body>
        
            <h2>Desarrolladores</h2>
			<p>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
                    <g:each in="${profileInstanceList}" status="i" var="profileInstance">
						<div style="{display: inline-block;}">
							<h3><g:link action="show" id="${profileInstance.person.username}">${fieldValue(bean:profileInstance, field:'person.userRealName')}</g:link></h3>
							<br/>
                            
								<g:link action="show" id="${profileInstance.person.username}">
								<g:if test="${profileInstance.photo}">
                            	<img height="128" alt="${fieldValue(bean:profileInstance, field:'person.userRealName')}"  src="${createLink(controller:'profile',action:'thumb',id:profileInstance.person.username)}"/>
								</g:if>
								<g:else>
								<img alt="Foto de ${fieldValue(bean:profileInstance, field:'person.userRealName')}" src="${resource(file:'images/default_profile.gif')}" style="float:left;margin-right:10px"/>
								</g:else>
                            	</g:link>
									
							</div>
							
							

                    </g:each>
            <div class="">
                <g:paginate total="${profileInstanceTotal}" />
            </div>
        	</p>
    </body>
</html>
