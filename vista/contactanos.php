	<section class="content contact">
		<article class="main">
		<h2><span class="text-green">CAIDV</span> CONTACTANOS</h2>
			<p style="text-align:justify">En CAIDV estamos para ayudar, así que si tienes alguna pregunta hacia nosotros, sientase libre de poder contactarnos a través de correo, telefono o asistiendo a nuestras instalaciones.Tambien puede enviarnos un mensaje a través del siguiente formulario de contacto.</p>
			<form action="enviar_correo.php" method="post" class="contact-form">
				<p class="half">
					<label for="nombre">Nombre</label><input name="nombre" id="nombre">
				</p>
				<p class="half">
					<label for="correo">Correo-e</label><input name="correo" id="correo">
				</p>
				<p>
					<label for="asunto">Asunto</label>
					<input name="asunto" id="asunto" type="text">
				</p>
				<p>
					<label for="mensaje">Mensaje</label><textarea name="mensaje" id="mensaje" rows="5" cols="20"></textarea>
				</p>
				<p><button name="enviar" type="submit" value="1">Enviar</button></p>
			</form>
		</article>
		<aside>
			<section>
				<div class="gmap" id="map">Mapa del CAIDV - Acarigua</div>
			</section><section>
				<h3><span>Puedes contactarnos a través</span></h3>
				<br>CENTRO DE ATENCION VISUAL DE DEFICIENCIA VISUAL (CAIDV - Acarigua Edo. Portueguesa)<br> <br>Dirección: Calle Luis Braille con Av. Circunvalación, detrás del centro de Bellas Artes. Sector Los Cortijos, Acarigua estado Portuguesa. COD. DEA: OD08081808 Fecha de Fundación: 16 de septiembre de 1986.</p>
				<p>Teléfonos: 04145562997 - 04245642522.<br>Correo electrónico: <br> Dpto. Administrativo - caidvacarigua@jahoo.es<br> Soporte del Sistema - info.caidv@caidv.com.ve</a></p>
			</section>
		</aside>
	</section>
	 <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=true"></script>
    <script type="text/javascript">
      function initialize() 
      {
      	posicion=new google.maps.LatLng(9.543677, -69.187648)
        var mapOptions = {
          center: posicion,
          zoom: 16
        };
        var map = new google.maps.Map(document.getElementById("map"),
            mapOptions);

        var marker = new google.maps.Marker({
		    position: posicion,
		    map: map,
		    title:"CAIDV - ACARIGUA ESTADO PORTUGUESA"
		});
      }
      google.maps.event.addDomListener(window, 'load', initialize);
    </script>