

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
        <title>${fieldValue(bean: projectInstance, field: "name")}</title>
    </head>
    <body>
            <h2>${fieldValue(bean: projectInstance, field: "name")}</h2>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
                    
	<p>
<g:message code="project.description.label" default="Description" />
                            <g:nl2br>
                            ${fieldValue(bean: projectInstance, field: "description")}
                            </g:nl2br>
                        </p>
                    
	<p>
<g:message code="project.url.label" default="Url" />
                            
                            ${fieldValue(bean: projectInstance, field: "url")}
                            
                        </p>
                    
	<p>
<g:message code="project.person.label" default="Person" />
                            
                            <g:link controller="profile" action="show" id="${projectInstance?.person?.username}">${projectInstance?.person?.encodeAsHTML()}</g:link>
                            
                        </p>
                    
                    
            
                <g:form>
                    <g:hiddenField name="id" value="${projectInstance?.id}" />
					<g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" />
                    <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </g:form>
    </body>
</html>
