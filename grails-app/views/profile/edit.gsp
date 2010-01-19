

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edita tu Perfil</title>
    </head>
    <body>
            <h2>Edita tu Perfil</h2>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${profileInstance}">
            <div class="errors">
                <g:renderErrors bean="${profileInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" action="update" enctype="multipart/form-data">
                <input type="hidden" name="version" value="${profileInstance?.version}" />
                    <label for="photo">Tu foto:</label>
        	        <input type="file" id="photo" name="photo" />
        	        <br/>
					<label for="bio">Bio:</label><br/>
                    <textarea id="bio" name="bio" cols="60" rows="10"/>${fieldValue(bean:profileInstance,field:'bio')}</textarea>
                    <br/>
                    <label for="location">Localización:</label>
                    <input type="text" id="location" name="location" value="${fieldValue(bean:profileInstance,field:'location')}"/>
                    <br/>
                    <label for="web">Tu Web o Blog:</label>
                    <input type="text" id="web" name="web" value="${fieldValue(bean:profileInstance,field:'web')}"/>
                    <br/>
                    <label for="twitter">Twitter:</label>
                    <input type="text" id="twitter" name="twitter" value="${fieldValue(bean:profileInstance,field:'twitter')}"/>
                    <br/>
                    <label for="enterprise">Empresa:</label>
                    <input type="text" id="enterprise" name="enterprise" value="${fieldValue(bean:profileInstance,field:'enterprise')}"/>
                    <br/>
                    <label for="enterpriseUrl">Web de tu empresa:</label>
                    <input type="text" id="enterpriseUrl" name="enterpriseUrl" value="${fieldValue(bean:profileInstance,field:'enterpriseUrl')}"/>
<br/><br/>
                <g:submitButton name="save" value="Guardar" />
            </g:form>

    </body>
</html>
