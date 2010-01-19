

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Perfil de ${fieldValue(bean:profileInstance, field:'person.userRealName')}</title>
		<g:gmapsKey/>
    </head>
    <body>
            <h2>Perfil de ${fieldValue(bean:profileInstance, field:'person.userRealName')}</h2>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <p>
				<g:if test="${profileInstance.photo}">
               <img alt="Foto de ${fieldValue(bean:profileInstance, field:'person.userRealName')}" src="${createLink(controller:'profile',action:'thumb',id:profileInstance.person.username)}" style="float:left;margin-right:10px"/>
				</g:if>
				<g:else>
				<img alt="Foto de ${fieldValue(bean:profileInstance, field:'person.userRealName')}" src="${resource(file:'images/default_profile.gif')}" style="float:left;margin-right:10px"/>
				</g:else>
                    <p>        
                    Bio: <g:nl2br>${fieldValue(bean:profileInstance, field:'bio')}</g:nl2br>
				</p>   
				<p>     
                        <g:if test="${profileInstance.web}">
						Mi web(o blog) es <a href="${fieldValue(bean:profileInstance, field:'web')}">${fieldValue(bean:profileInstance, field:'web')}</a>
						<br/>
                        </g:if>    

                    	<g:if test="${profileInstance.twitter}">

                            Mi twitter es <a href="http://twitter.com/${fieldValue(bean:profileInstance, field:'twitter')}">
                            	@${fieldValue(bean:profileInstance, field:'twitter')}
                            	</a>
                            <br/>
                        </g:if>
                    	<g:if test="${profileInstance.enterprise}">
                        Trabajo en
                            <g:if test="${profileInstance.enterpriseUrl}">
                            	<a href="${fieldValue(bean:profileInstance, field:'enterpriseUrl')}">${fieldValue(bean:profileInstance, field:'enterprise')}</a>
                            </g:if>
                            <g:else>
                            	${fieldValue(bean:profileInstance, field:'enterprise')}
                            </g:else>
                            <br/>
                    	</g:if>
						<g:if test="${profileInstance.location}">
						Localización: ${fieldValue(bean:profileInstance, field:'location')}
						<br/>
						<div id="map" style="width: 500px; height: 300px">mapa</div>
						<script type="text/javascript">
							var map = null;
							var geocoder = null;
							
						    function initialize() {
						      if (GBrowserIsCompatible()) {
						        map = new GMap2(document.getElementById("map"));
								map.addControl(new GSmallMapControl());
							    map.addControl(new GMapTypeControl());
							 
								geocoder = new GClientGeocoder();
								showAddress("${profileInstance.location}");
						      }
						    }
							function showAddress(address) {
							      if (geocoder) {
							        geocoder.getLatLng(
							          address,
							          function(point) {
							            if (!point) {
							              map.setCenter(new GLatLng(0, 0), 5);
							            } else {
							              map.setCenter(point, 6);
							              var marker = new GMarker(point);
							              map.addOverlay(marker);
							              marker.openInfoWindowHtml("<strong>${profileInstance.person.userRealName}</strong><br/>"+address);
							            }
							          }
							        );
							      }
							 }
						
							initialize()

						    </script>
						
						 </g:if>
					</p>
			</p>
    </body>
</html>
