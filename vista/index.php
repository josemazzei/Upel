<?php
    
    session_start(); //inicia la session, la cual permite trabajar con la variable $_SESSION
    $msj=(isset($_SESSION['msj']))?$_SESSION['msj']:"";
    $vista=(isset($_GET['vista']))?$_GET['vista']:"";//toma el valor que se guarda en la variable vista que está en la URL.
    if($msj) //verifica si existe algún texto en el arreglo msj de la variable $_SESSION
    {
        echo '<script>alert("'.$msj.'");</script>'; // si existia un mensaje este lo imprime mediante un alert!
        unset($_SESSION['msj']); //borra lo que habia en la variable.
    }
    include('../clases/clase_configuracion.php');
    $lobjConfiguracion = new clsConfiguracion();
    $DatosConfiguracion = $lobjConfiguracion->consultar_configuracion_bitacora();
?>
<!DOCTYPE html> 
<html>
<head>
	<meta charset="UTF-8">
	<title>CAIDV | INICIO</title>
	<meta name="description" content="">
	<meta name="keywords" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
	<link href="../media/style.css" rel="stylesheet" type="text/css" media="screen">
	<link href="../media/style-headers.css" rel="stylesheet" type="text/css" media="screen">
	<link href="../media/style-colors.css" rel="stylesheet" type="text/css" media="screen">
	<link href="../media/font-awesome-4.0.3/css/font-awesome.min.css" rel="stylesheet" type="text/css" media="screen">

    <script type="text/javascript" src="../media/js/jquery.js"></script>
	<script type="text/javascript" src="../media/js/scripts.js"></script>
    <script type="text/javascript" src="../libreria/validacion/js/lemez_validacion_intranet.js"></script>
	<!--[if lt IE 9]>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<link href="style-ie.css" rel="stylesheet" type="text/css" media="screen">
	<![endif]-->
</head>

<body class="home color-green"><div class="root">
	<section>
	<img class="cintillo" src="../media/images/cintillo-caidv.jpg">
	</section>
	<header class="h6 sticky-enabled no-topbar">
		<section class="top">
			<div>
				<p><a class="text-white" href="?vista=acceso_intranet"><i class="fa fa-lock"></i> ENTRAR</a> </p>
			</div>
		</section>
		
		<section class="main-header">
			<p class="title">
				<a href="./">
					<img src="../media/images/CAIDV.png" alt="logo" width="250" height="65"></a></p>
			<nav class="social">
				<ul>
					<li><a href="#" class="facebook">Facebook</a></li>
					<li><a href="#" class="twitter">Twitter</a></li>
				</ul>
			</nav>
			<nav class="mainmenu">
				<ul>
					<li <?php if($vista==''){echo 'class="current-menu-item"';}?> >
						<a href="./"><i class="fa fa-home"></i> INICIO</a>
					</li>					
					<li <?php if($vista=='informacion'){echo 'class="current-menu-item"';}?>>
						<a href="?vista=informacion"><i class="fa fa-caret-right"></i> INFORMACIÓN</a>
					</li>
					<li <?php if($vista=='noticias'){echo 'class="current-menu-item"';}?>>
						<a href="?vista=noticias"><i class="fa fa-caret-right"></i> BLOG - NOTICIAS</a>
					</li>					
					<li <?php if($vista=='acceso_intranet'){echo 'class="current-menu-item"';}?>>
						<a href="?vista=acceso_intranet"><i class="fa fa-caret-right"></i> INTRANET</a>
					</li>
					<li <?php if($vista=='contactanos'){echo 'class="current-menu-item"';}?>>
						<a href="?vista=contactanos"><i class="fa fa-caret-right"></i> CONTACTANOS</a>
					</li>					
				</ul>			
			</nav>
			
			<div class="clear"></div>
		</section>
	</header>
	<?php

	require_once('../clases/clase_slider.php');
    $lobjslider=new clsSlider;
    $lasliders=$lobjslider->consultar_slider_activas();
               
    if(!file_exists('../vista/'.$vista.'.php'))
    {
    	?>
    		<section class="slider3 p02">
    			<div class="slider">
			
    	<?php

    	for($s=0;$s<count($lasliders);$s++)
    	{
    		?>
				<article>
					<span class="img-border"><img style="max-height:350px;" src="../media/img/slider/<?php print($lasliders[$s][3]); ?>" alt=""></span>
					<h3><?php print($lasliders[$s][1]); ?></h3>
					<p><?php print($lasliders[$s][2]); ?></p>
				</article>

    		<?php
    	} //Fin del for

    	?> 		</div>
    		</section>

    	<?php

		    }//Fin del if
		 ?>
	<section class="content">
		<?php
	        if(file_exists('../vista/'.$vista.'.php')) //verifica el contenido de la variable vista.
	        {
	                include('../vista/'.$vista.'.php');// y si exite el archivo que trae este incluirá el cintenido
	        }   
	        else
	        {
	            include('../vista/inicio.php');// Si no exite o no tiene nada la variable vista entonces trae por defecto la vista index.html
	        }
    	?> 
	</section>

	<footer>

		<section class="bottom">
			<p>CENTRO DE ATENCIÓN INTEGRAL DE DEFICIENCIAS VISUALES: Dirección calle Luis Braille con Av. Circunvalación, detrás del centro de Bellas Artes. Sector Los Cortijos, Acarigua estado Portuguesa. Teléfonos: 04145562997 - 04245642522. Email: caidvacarigua@jahoo.es. COD. DEA: OD08081808 Fecha de Fundación: 16 de septiembre de 1986.</p><p style="text-align:center; width:100%"> &copy; Todos los derechos reservados CAIDV / UPTP "J.J. Montilla" 2014 / 2015 - info.caidv@gmail.com</p>
			<nav class="social">
				<ul>
					<li><a href="#" class="facebook">Facebook</a></li>
					<li><a href="#" class="twitter">Twitter</a></li>
				</ul>
			</nav>
		</section>
	</footer></div>

	

	<!--[if lt IE 9]>
		<script type="text/javascript" src="js/ie.js"></script>
	<![endif]-->
</body>

</html>