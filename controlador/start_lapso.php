<?php
	require_once("../clases/clase_lapso.php");
	$lobjLapso=new clsLapso;

	$APERTURADO = $lobjLapso->consultar_activo();

	if($APERTURADO)
	{
		$CIERRE = $lobjLapso->consultar_cierre();

		if($CIERRE)
		{
			$lobjLapso->set_Estadolap('CERRADO');
			$llHecho = $lobjLapso->editar_estado();
			if($llHecho)
			{
				print('<script>alert("Se ha cerrado su antiguo lapso");</script>');
			}
			
			$APERTURA = $lobjLapso->consultar_apertura();

			if($APERTURA)
			{
				$lobjLapso->set_Estadolap('APERTURADO');
				$llHecho = $lobjLapso->editar_estado();
				if($llHecho)
				{
					print('<script>alert("Se ha aperturado un nuevo lapso");</script>');
				}
			}
		}

	}
	else 
	{
		$APERTURA = $lobjLapso->consultar_apertura();

		if($APERTURA)
		{
			$lobjLapso->set_Estadolap('APERTURADO');
			$llHecho = $lobjLapso->editar_estado();
			if($llHecho)
			{
				print('<script>alert("Se ha aperturado un nuevo lapso");</script>');
			}
		}
	}
	
?>