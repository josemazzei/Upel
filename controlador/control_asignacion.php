<?php
	session_start();
	require_once("../clases/clase_rol.php");
	$lobjRol=new clsRol;

	$lobjRol->set_Rol($_POST['idrol']);
	$lobjRol->set_Nombre($_POST['nombrerol']);
	$operacion=$_POST['operacion'];

	switch ($operacion) 
	{
		case 'registrar_rol':
			$hecho=$lobjRol->registrar_rol();
			if($hecho)
			{
				$_SESSION['msj']='Se ha registrado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='Error en el registro';
			}
		break;
		case 'editar_rol':
			$hecho=$lobjRol->editar_rol();
			if($hecho)
			{
				$_SESSION['msj']='Se ha modificado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='No se realizarón cambios';
			}
		break;
		case 'eliminar_rol':
			$hecho=$lobjRol->eliminar_rol();
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
			header('location: ../vista/intranet.php?vista=seguridad/rol');
		break;
	}

	header('location: ../vista/intranet.php?vista=seguridad/rol');
?>