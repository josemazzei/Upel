<?php    
    session_start(); //inicia la session, la cual permite trabajar con la variable $_SESSION

    $usuario=(isset($_SESSION['usuario']))?$_SESSION['usuario']:"";//toma el valor que se guarda en la variable usuario que está en la variable $_SESSION

    if($usuario)  //verifica si existe algún usuario logueado en el arreglo usuario de la variable $_SESSION
    {
        echo '<script>alert("Usted tiene una sesíón abierta!");window.location.href="intranet.php";</script>'; // Si no existe un usuario logeado entonces le mostraŕa un mensaje y lo sacará para el inicio! 
    }
?>

<link rel="stylesheet" type="text/css" href="../libreria/jquery.realperson.package-2.0.1/jquery.realperson.css"> <!--CSS que da estilo al plugin del captcha-->
<script type="text/javascript" src="../libreria/jquery.realperson.package-2.0.1/jquery.plugin.js"></script>		<!--js del plugin del captcha-->
<script type="text/javascript" src="../libreria/jquery.realperson.package-2.0.1/jquery.realperson.js"></script> <!--js que implementa las funciones directas del captcha-->
<script> <!--Inicializa el plugin del captcha-->
$(function() {
	$('#defaultReal').realperson();
});
</script>
<section class="columns">
 	<h2><span class="text-green">CAIDV</span> INTRANET</h2>
	<article class="col2">
		<p style="text-align:justify">Este es el acceso al sistema de gestión educativa del CAIDV, para acceder solo debe ingresar su usuario y clave, sí no puede acceder al sistema porque no recuerda su clave haga clic en "¿No puede acceder a su cuenta?", en esta opción debe ingresar los datos que le solicita cada paso, si lo hace correctamente podrá recuperar su cuenta.</p>
		<h3>RECOMENDACIONES DE SEGURIDAD</h3>
		<ul class="tick" style="text-align:justify">
			<li>No use claves como su fecha de nacimiento, cedula o cualquier cosa que pueda ser asociada con usted de forma sencilla.</li>
			<li>Le sugerimos que use una clave que contenga letras,numero y/o caracteres especiales, tambien puede usar frases incoherentes, por ejemplo: "9878Miguel325.34" ó "cococonmantequilla".</li>
			<li>No comparta su clave con nadie.</li>
			<li>Cierre su sesión al terminar sus actividades dentro de la intranet.</li>
		</ul>
	</article><article class="col2">
	<section class="landing-form">
			<form action="../controlador/control_acceso.php" method="post">
				<h2  style="text-align: center;">Accede a tu cuenta</h2>
				<p><label for="name">Usuario <i class="fa fa-user"></i></label><input type="text" name="usuario" id="cam_usuario"></p>
				<p><label for="email">Clave <i class="fa fa-lock"></i></label><input name="clave" id="cam_clave" type="password"></p>
				<!--<p><input type="text" style="display: inline-block;width: 150px;float: left;margin-left: 20px;" id="defaultReal" name="defaultReal"></p>
				<p><input type="text" style="text-transform:uppercase"id="defaultReal" name="defaultReal"></p> <!-- Campo que implementa el código captcha-->
				<p><button class="color-green" style="color:#fff;font-weight:bold;width:47%;display:inline" name="entrar" id="btnentrar" type="submit" value="Iniciar sesión">Iniciar sesión</button><button  style="color:#fff;font-weight:bold;background:#e94141;border-color:#e94141;width:47%;display:inline" name="cancelar" id="btncancelar" type="reset" value="Cancelar">Cancelar</button></p>
				<p style="text-align: center;"><b><a onclick="window.open('recuperar_cuenta.php', 'window', 'width=700,height=500');" class="text-white">¿No puede acceder a tu cuenta?</a></b></p>
			</form>
		</section>
	</article>
</section>
<script type="text/javascript">
	$(function(){
    $("#cam_usuario").lemez_aceptar("texto_numero","btnentrar");
    $("#cam_clave").lemez_aceptar("contraseña","btnentrar");
  // $("#defaultReal").lemez_aceptar("texto_numero","btnentrar");// Valida que el código captcha sea obligatorio y que sea de tipo texto y numero
    });
</script>
		
