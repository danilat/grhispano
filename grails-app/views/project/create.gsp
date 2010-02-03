

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        
            <g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link>
       
            <h2><g:message code="default.create.label" args="[entityName]" /></h2>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${projectInstance}">
            <div class="errors">
                <g:renderErrors bean="${projectInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                        
                                    <label for="name"><g:message code="project.name.label" default="Name" /></label>
                                
                                    <g:textField name="name" value="${projectInstance?.name}" />
                                <br/>
                        
                                    <label for="description"><g:message code="project.description.label" default="Description" /></label>
                                
                                    <textarea id="description" name="description" cols="60" rows="10"/>${projectInstance?.description}</textarea>
                                <br/>
                        
                                    <label for="url"><g:message code="project.url.label" default="Url" /></label>
                                
                                    <g:textField name="url" value="${projectInstance?.url}" />
                                <br/>
                        
                <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
            </g:form>
    </body>
</html>
