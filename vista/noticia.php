<?php
	require_once('../clases/clase_noticia.php');
	$lobjNoticia = new clsNoticia();
	$idnoticia = (isset($_GET['id'])) ? $_GET['id'] : "";
	$lobjNoticia->set_Noticia($idnoticia);
	$Datos_Noticia = $lobjNoticia->consultar_noticia_post();
?>
	<section class="content">
		<section class="main single">
			<article>
				<h1><?php print($Datos_Noticia[1]); ?></h1>
				<p class="post-meta">Fecha: <?php print($Datos_Noticia[4]); ?></p>
				<p><img src="../media/img/noticia/<?php print($Datos_Noticia[3]);?>" alt=""></p>
				<?php print($Datos_Noticia[2]); ?>
			</article>
			

		</section>
	</section>


			