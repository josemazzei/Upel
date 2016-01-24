<?php
	session_start();
	require_once("../clases/clase_servicio.php");
	require_once("../clases/clase_bitacora.php");
    require_once('../libreria/utilidades.php');
	$lobjServicio=new clsServicio;
	$lobjBitacora=new clsBitacora;
	$lobjUtil=new clsUtil;

	$lobjServicio->set_Servicio($_POST['idservicio']);
	$lobjServicio->set_Nombre($_POST['nombreser']);
	$lobjServicio->set_Enlace($_POST['enlaceser']);
	$lobjServicio->set_Visible($_POST['visibleser']);
	$lobjServicio->set_Modulo($_POST['idmodulo']);

	$lcReal_ip=$lobjUtil->get_real_ip();
    $ldFecha=date('Y-m-d h:m');
	$operacion=$_POST['operacion'];

	switch ($operacion) 
	{
		case 'registrar_servicio':
			$hecho=$lobjServicio->registrar_servicio();
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Registrar','Cargar datos','*','tservicio','','',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha registrado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='Error en el registro';
			}
			header('location: ../vista/intranet.php?vista=seguridad/servicio');
		break;
		case 'editar_servicio':
			$lobjServicio->set_Servicio($_POST['idservicio']);
			$laServicioAnterior=$lobjServicio->consultar_servicio_bitacora();

			$laValorNuevo=$laValorAnterior=$laCampo=array();

			$hecho=$lobjServicio->editar_servicio();
			if($hecho)
			{
				$cont=0;
				foreach ($laServicioAnterior as $key2 => $value2) 
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
					$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Modificar','Error en los datos',$laCampo[$i],'tservicio',$laValorAnterior[$i],$laValorNuevo[$i],$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
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
			header('location: ../vista/intranet.php?vista=seguridad/servicio');
		break;
		case 'eliminar_servicio':
			$hecho=$lobjServicio->eliminar_servicio();
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Eliminar','No sé utiliza','estatusser','tservicio','1','0',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha desactivado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='Error al eliminar';
			}
			header('location: ../vista/intranet.php?vista=seguridad/servicio');
		break;
		case 'restaurar_servicio':
			$hecho=$lobjServicio->restaurar_servicio();
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Restaurar','No sé utiliza','estatusser','tservicio','0','1',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha restaurado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='No se pudo restaurar el servicio';
			}

			header('location: ../vista/intranet.php?vista=seguridad/servicio');
		break;
		default:
			header('location: ../vista/intranet.php?vista=seguridad/servicio');
		break;
	}

?>