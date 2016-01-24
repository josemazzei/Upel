<?php
	session_start();
	require_once("../clases/clase_rol.php");
	require_once("../clases/clase_bitacora.php");
    require_once('../libreria/utilidades.php');
	$lobjRol=new clsRol;
	$lobjBitacora=new clsBitacora;
	$lobjUtil=new clsUtil;

	$lobjRol->set_Rol($_POST['idrol']);
	$lobjRol->set_Nombre($_POST['nombrerol']);
	$lobjRol->set_Modulo($_POST['idmodulo']);
	$lobjRol->set_Orden($_POST['orden']);
	$lobjRol->set_Servicio($_POST['idservicio']);
	$operacion=$_POST['operacion'];
	$lcReal_ip=$lobjUtil->get_real_ip();
    $ldFecha=date('Y-m-d h:m');

	switch ($operacion) 
	{
		case 'registrar_rol':
			if(!$lobjRol->validar_repetido())
			{
				$hecho=$lobjRol->registrar_rol();
			
				if($hecho)
				{
					$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Registrar','Cargar datos','*','trol','','',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
	   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
					$_SESSION['msj']='Se ha registrado exitosamente';
				}
				else
				{	
					$_SESSION['msj']='Error en el registro';
				}
			}
			else
			{	
				$_SESSION['msj']='Error , el rol a registrar ya existe.';
			}
			header('location: ../vista/intranet.php?vista=seguridad/rol');
		break;
		case 'editar_rol':
		if(!$lobjRol->validar_repetido())
		{
			$hecho=$lobjRol->editar_rol();
			if($hecho)
			{
				$_SESSION['msj']='Se ha modificado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='No se realizarón cambios';
			}
		}
		else
		{	
			$_SESSION['msj']='Error , el rol a registrar ya existe.';
		}	
			header('location: ../vista/intranet.php?vista=seguridad/rol');
		break;
		case 'eliminar_rol':
			$hecho=$lobjRol->eliminar_rol();
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Eliminar','No sé utiliza','estatusser','trol','1','0',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha desactivado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='Error al eliminar';
			}
			header('location: ../vista/intranet.php?vista=seguridad/rol');
		break;
		case 'asignar_modulo':
			$hecho=$lobjRol->asignar_modulo();
			if($hecho)
			{
				$_SESSION['msj']='Se han asignado los modulos exitosamente';
			}
			else
			{	
				$_SESSION['msj']='Error al asignar los modulo';
			}
			header('location: ../vista/intranet.php?vista=seguridad/asignar_servicio&id='.$_POST['idrol']);
		break;
		case 'asignar_servicio':
			require_once('../clases/clase_modulo.php');
            $lobjModulo=new clsModulo;
            $laModulos=$lobjRol->consultar_modulos_menu();
            $lobjRol->quitar_servicios();            
				for ($i=0; $i <count($laModulos);$i++)
				{
					if($_POST['idservicio'.$i])
					{
						$lobjRol->set_Servicio($_POST['idservicio'.$i]);
						$lobjRol->set_Orden($_POST['orden'.$i]);
						$hecho=$lobjRol->asignar_servicio();
					}
				}
			
			if($hecho)
			{
				$_SESSION['msj']='Se han asignado los servicios exitosamente';
			}
			else
			{	
				$_SESSION['msj']='Error al asignar los servicios';
			}

			header('location: ../vista/intranet.php?vista=seguridad/asignar_servicio');
		break;
		case 'restaurar_rol':
			$hecho=$lobjRol->restaurar_rol();
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Restaurar','No sé utiliza','estatusrol','trol','0','1',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha restaurado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='No se pudo restaurar el servicio';
			}

			header('location: ../vista/intranet.php?vista=seguridad/rol');
		break;
		default:
			header('location: ../vista/intranet.php');
		break;
	}

?>