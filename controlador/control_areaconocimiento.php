<?php
	session_start();
	require_once("../clases/clase_areaconocimiento.php");
	require_once("../clases/clase_bitacora.php");
    require_once('../libreria/utilidades.php');
	$lobjArea=new clsAreaconocimiento;
	$lobjBitacora=new clsBitacora;
	$lobjUtil=new clsUtil;

	$lobjArea->set_Area($_POST['idarea_conocimiento']);
	$lobjArea->set_Nombre($_POST['nombreare']);
	$lobjArea->set_Estatus($_POST['estatusare']);

	$lcReal_ip=$lobjUtil->get_real_ip();
    $ldFecha=date('Y-m-d h:m');
	$operacion=$_POST['operacion'];

	switch ($operacion) 
	{
		case 'registrar_area':
			$hecho=$lobjArea->registrar_area();
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Registrar','Cargar datos','*','tarea_conocimiento','','',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha registrado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='Error en el registro';
			}
		break;
		case 'editar_area':
			$laLocalidadAnterior=$lobjArea->consultar_area_bitacora();

			$laValorNuevo=$laValorAnterior=$laCampo=array();

			$hecho=$lobjArea->editar_area();
			if($hecho)
			{
				$cont=0;
				foreach ($laLocalidadAnterior as $key2 => $value2) 
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
					$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Modificar','Error en los datos',$laCampo[$i],'tarea_conocimiento',$laValorAnterior[$i],$laValorNuevo[$i],$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
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
		case 'eliminar_area':
			$hecho=$lobjArea->eliminar_area();
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Eliminar','No sé utiliza','estatusare','tarea_conocimiento','1','0',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha desactivado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='Error al eliminar';
			}
		break;
		case 'restaurar_area':
			$hecho=$lobjArea->restaurar_area();
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Restaurar','No sé utiliza','estatusare','tarea_conocimiento','0','1',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha restaurado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='No se pudo restaurar';
			}
		break;
		default:
			header('location: ../vista/intranet.php?vista=archivo/area_conocimiento');
		break;
	}

	header('location: ../vista/intranet.php?vista=archivo/area_conocimiento');
?>