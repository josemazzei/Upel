<?php
	require_once('../clases/clase_noticia.php');
	$lobjNoticia = new clsNoticia();
	$laNoticias = $lobjNoticia->consultar_noticias_activas_limit();
?>
		<section class="columns">
			<h2><span>Noticias</span></h2>
			<?php
				for($i=0;$i<count($laNoticias);$i++)
				{
					$Texto = substr($laNoticias[$i][2], 0, 500);
					
			?>
			<article class="col3 post">
				<div class="img"><a href="#"><span class="img-border"><img src="../media/img/noticia/<?php print($laNoticias[$i][3]);?>" alt=""></span></a></div>
				<h2><a href="#"><?php print($laNoticias[$i][1]);?></a></h2>
				<p class="post-meta">Fecha: <?php print($laNoticias[$i][4]);?></p>
				<p><?php print($Texto);?></p>
				<p class="more"><a href="?vista=noticia&id=<?php print($laNoticias[$i][0]);?>">Leer mas...</a></p>
			</article>

			<?php
				}
			?>
		</section>
		<article class="content-slider hp-our-clients">
			<h2><span>Enlaces de interés</span></h2>
			<div class="slider-box">
				<ul>
					<li><a href="http://www.me.gob.ve/" target="_blank"><img width="140px" height="80px" src="../media/images/mppe.jpg" alt="Ministerio del poder popular para la educación" title="Ministerio del poder popular para la educación" class="logo"></a></li>
					<li><a href="http://www.portuguesa.gob.ve/" target="_blank"><img width="140px" height="80px"  src="../media/images/portuguesa.jpg" alt="" class="logo"></a></li>
					
				</ul>
			</div>
		</article>
		<a href="#top" class="go-top">Subir</a>