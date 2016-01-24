<?php
	session_start();
	require_once("../clases/clase_lapso.php");
	require_once("../clases/clase_bitacora.php");
    require_once('../libreria/utilidades.php');
	$lobjLapso=new clsLapso;
	$lobjBitacora=new clsBitacora;
	$lobjUtil=new clsUtil;

	$lobjLapso->set_Lapso($_POST['idlapso']);
	$lobjLapso->set_Nombrelap($_POST['nombrelap']);
	
	$lobjLapso->set_Estadolap($_POST['estadolap']);
	$lobjLapso->set_Estatuslap($_POST['estatuslap']);

	$lcReal_ip=$lobjUtil->get_real_ip();
    $ldFecha=date('Y-m-d h:m');
	$operacion=$_POST['operacion'];

	if($_GET)
	{
		$lobjLapso->set_Fechainicio($_GET['fechainilap']);
		$lobjLapso->set_Fechafin($_GET['fechafinlap']);
		$lobjLapso->set_Nombrelap($_GET['nombrelap']);
		$operacion=$_GET['operacion'];
	}

	switch ($operacion) 
	{
		case 'registrar_lapso':
			$hecho=$lobjLapso->registrar_lapso();
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Registrar','Cargar datos','*','tlapso','','',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha registrado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='Error en el registro';
			}
		break;
		case 'verificar':
			$hecho=$lobjLapso->consultar_rango();
			if(($_GET['fechainilap']=='') OR ($_GET['fechafinlap']==''))
			{
				print('');
			}
			else if(validar_dias() <= 0)
			{	
				print('Debe ingresar un rango de fecha diferente, este no es un rango de fechas valido.');
			}
			else if($hecho)
			{
				$fecha = $lobjLapso->consultar_ultima_fecha();
				print('Debe ingresar un rango de fecha diferente, existe un lapso creado entre ese rango de fechas. Fecha de cierre del ultimo lapso: <a href="#">'.$fecha.'</a>');
			}
			else if($_GET['nombrelap'])
			{
				$hecho = $lobjLapso->consultar_lapsos_nombre();
				if($hecho)
				{
					print('Debe ingresar un nombre del lapso diferente, existe un lapso creado con ese nombre.');
				}
				else
				{
					print('');
				}
			}
			else
			{
				print('');
			}

		break;
		case 'editar_lapso':
			$laLapsoAnterior=$lobjLapso->consultar_lapso_bitacora();

			$laValorNuevo=$laValorAnterior=$laCampo=array();

			$hecho=$lobjLapso->editar_lapso();
			if($hecho)
			{
				$cont=0;
				foreach ($laLapsoAnterior as $key2 => $value2) 
				{
					$value = $_POST[$key2];
					if($value)
					{
						if($value!=$value2)
						{
							$laValorNuevo[] = $value;
							$laValorAnterior[] = $value2;
							$laCampo[] 		= $key2;
							$cont++;
						}
					}
				}

				for($i=0;$i<$cont;$i++)
				{
					$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Modificar','Error en los datos',$laCampo[$i],'tlapso',$laValorAnterior[$i],$laValorNuevo[$i],$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
	   				$lnHecho=$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
   					if($lnHecho)
					{
						$_SESSION['msj']='Se ha modificado exitosamente';
					}
				}
			}
			else
			{	
				$_SESSION['msj']='No se realizarón cambios';
			}
		break;
		case 'eliminar_lapso':
			$hecho=$lobjLapso->eliminar_lapso();
			if($hecho)
			{
				$_SESSION['msj']='Se ha desactivado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='Error al eliminar';
			}
		break;
		default:
		break;
	}

function validar_dias()
{
	$FechaCul=$_GET['fechafinlap'];
	$FechaActual= $_GET['fechainilap'];
	
	$FechaActual = str_replace("-","",$FechaActual);
	$FechaActual = str_replace("/","",$FechaActual);
	$FechaCul = str_replace("-","",$FechaCul);
	$FechaCul = str_replace("/","",$FechaCul);

	ereg( "([0-9]{1,2})([0-9]{1,2})([0-9]{2,4})", $FechaActual, $FechaActual);
	ereg( "([0-9]{1,2})([0-9]{1,2})([0-9]{2,4})", $FechaCul, $FechaCul);

	$date1 = mktime(0,0,0,$FechaActual[2], $FechaActual[1], $FechaActual[3]);
	$date2 = mktime(0,0,0,$FechaCul[2], $FechaCul[1], $FechaCul[3]);
	
	$lcResult=round(($date2 - $date1) / (60 * 60 * 24));


	return $lcResult;
}
?>