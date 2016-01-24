<?php
	require_once('../clases/clase_noticia.php');
	$lobjNoticia = new clsNoticia();
	$laNoticias = $lobjNoticia->consultar_noticias_activas();
?>

		<section class="columns">
			<?php
			if(count($laNoticias)!=0)
			{
			?>
			<h2><span class="text-green">CAIDV ACARIGUA</span> NOTICIAS</h2>
			<?php
			}
			else
			{
			?>
				<h2>NO EXISTEN NOTICIAS REGISTRADAS</h2>
			<?php
			}
				for($i=0;$i<count($laNoticias);$i++)
				{
					$Texto = substr($laNoticias[$i][2], 0, 500);
					
			?>
			<article class="col3 post">
				<div class="img"><a href="?vista=noticia&id=<?php print($laNoticias[$i][0]);?>"><span class="img-border"><img src="../media/img/noticia/<?php print($laNoticias[$i][3]);?>" alt=""></span></a></div>
				<h2><a href="?vista=noticia&id=<?php print($laNoticias[$i][0]);?>"><?php print($laNoticias[$i][1]);?></a></h2>
				<p class="post-meta">Fecha: <?php print($laNoticias[$i][4]);?></p>
				<p><?php print($Texto);?></p>
				<p class="more"><a href="?vista=noticia&id=<?php print($laNoticias[$i][0]);?>">Leer mas...</a></p>
			</article>

			<?php
				}
			?>
		</section>
		