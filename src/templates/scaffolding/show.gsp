<% import grails.persistence.Event %>
<%=packageName%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
            <h2><g:message code="default.show.label" args="[entityName]" /></h2>
            <g:if test="\${flash.message}">
            <div class="message">\${flash.message}</div>
            </g:if>

                    <%  excludedProps = Event.allEvents.toList() << 'version'
                        props = domainClass.properties.findAll { !excludedProps.contains(it.name) }
                        Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
                        props.each { p -> %>
	<p>
<g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" />
                            <%  if (p.isEnum()) { %>
                            \${${propertyName}?.${p.name}?.encodeAsHTML()}
                            <%  } else if (p.oneToMany || p.manyToMany) { %>
                            <ul>
                                <g:each in="\${${propertyName}.${p.name}}" var="${p.name[0]}">
                                    <li><g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${p.name[0]}.id}">\${${p.name[0]}?.encodeAsHTML()}</g:link></li>
                                </g:each>
                            </ul>
                            <%  } else if (p.manyToOne || p.oneToOne) { %>
                            <g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${propertyName}?.${p.name}?.id}">\${${propertyName}?.${p.name}?.encodeAsHTML()}</g:link>
                            <%  } else if (p.type == Boolean.class || p.type == boolean.class) { %>
                            <g:formatBoolean boolean="\${${propertyName}?.${p.name}}" />
                            <%  } else if (p.type == Date.class || p.type == java.sql.Date.class || p.type == java.sql.Time.class || p.type == Calendar.class) { %>
                            <g:formatDate date="\${${propertyName}?.${p.name}}" />
                            <%  } else { %>
                            \${fieldValue(bean: ${propertyName}, field: "${p.name}")}
                            <%  } %>
                        </p>
                    <%  } %>
                    
            
                <g:form>
                    <g:hiddenField name="id" value="\${${propertyName}?.id}" />
					<g:actionSubmit class="edit" action="edit" value="\${message(code: 'default.button.edit.label', default: 'Edit')}" />
                    <g:actionSubmit class="delete" action="delete" value="\${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('\${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </g:form>
    </body>
</html>
