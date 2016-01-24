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
	$lobjLapso->set_Fechainicio($_POST['fechainilap']);
	$lobjLapso->set_Fechafin($_POST['fechafinlap']);
	$lobjLapso->set_Estadolap($_POST['estadolap']);
	$lobjLapso->set_Estatuslap($_POST['estatuslap']);

	$lcReal_ip=$lobjUtil->get_real_ip();
    $ldFecha=date('Y-m-d h:m');
	$operacion=$_POST['operacion'];

	if($_GET)
	{
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
			if($hecho)
			{
				print('Debe ingresar un rango de fecha distinto, ya existe un lapso dentro de ese rango de fecha');
			}
			else
			{	
				print('');
			}
		break;
		case 'editar_lapso':

			if($_POST['estadolap']=='Cerrado')
			{
				$lobjLapso->cerrar_lapso();
			}
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
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Eliminar',$_POST['razondesactiva'],'estatuslap','tlapso','1','0',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha desactivado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='Error al eliminar';
			}
		break;
		case 'restaurar_lapso':
			$hecho=$lobjLapso->restaurar_lapso();
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Restaurar','No sé utiliza','estatuslap','tlapso','0','1',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha restaurado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='No se pudo restaurar el institucion';
			}

		break;
		default:
			header('location: ../vista/intranet.php?vista=curso/lapso');
		break;
	}

	header('location: ../vista/intranet.php?vista=curso/lapso');
?>