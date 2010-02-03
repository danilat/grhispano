

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
			<h2><g:message code="default.list.label" args="[entityName]" /></h2>
			<g:link action="create"><g:message code="default.create.label" args="[entityName]" /></g:link>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
                <table>
                    <thead>
                        <tr>
                            <g:sortableColumn property="name" title="${message(code: 'project.name.label', default: 'Name')}" />
                        
                            <th><g:message code="project.person.label" default="Person" /></th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${projectInstanceList}" status="i" var="projectInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${projectInstance.id}">${fieldValue(bean: projectInstance, field: "name")}</g:link></td>
<td><g:link action="show" controller="profile" id="${projectInstance.person?.username}">${fieldValue(bean: projectInstance, field: "person")}</g:link></td>                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            <div class="paginateButtons">
                <g:paginate total="${projectInstanceTotal}" />
            </div>
    </body>
</html>
