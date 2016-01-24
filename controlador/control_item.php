<?php
	session_start();
	require_once("../clases/clase_item.php");
	require_once("../clases/clase_bitacora.php");
    require_once('../libreria/utilidades.php');
	$lobjItem=new clsItem;
	$lobjBitacora=new clsBitacora;
	$lobjUtil=new clsUtil;

	$lobjItem->set_Item($_POST['iditem']);
	$lobjItem->set_Nombre($_POST['nombreite']);
	$lobjItem->set_Descripcion($_POST['descripcionite']);
	$lobjItem->set_Tipo($_POST['tipoite']);
	$lobjItem->set_Valor($_POST['valor']);
	$lobjItem->set_Estatus($_POST['estatusite']);

	$lcReal_ip=$lobjUtil->get_real_ip();
    $ldFecha=date('Y-m-d h:m');
	$operacion=$_POST['operacion'];

	switch ($operacion) 
	{
		case 'registrar_item':
			$hecho=$lobjItem->registrar_item();
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Registrar','Cargar datos','*','titem','','',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha registrado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='Error en el registro';
			}
		break;
		case 'editar_item':


			$hecho=$lobjItem->editar_item();
			if($hecho)
			{
				$_SESSION['msj']='Se ha modificado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='No se realizarón cambios';
			}
		break;
		case 'eliminar_item':
			$hecho=$lobjItem->eliminar_item();
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Eliminar','No sé utiliza','estatusasi','titem','1','0',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha eliminado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='Error al eliminar';
			}
		break;
		case 'restaurar_item':
			$hecho=$lobjItem->restaurar_item();
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Restaurar','No sé utiliza','estatusasi','titem','0','1',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha restaurado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='No se pudo restaurar';
			}
		break;
		default:
			header('location: ../vista/intranet.php?vista=archivo/item');
		break;
	}

	header('location: ../vista/intranet.php?vista=archivo/item');
?>