<?php
	session_start();
	require_once("../clases/clase_familiar.php");
	require_once("../clases/clase_bitacora.php");
    require_once('../libreria/utilidades.php');
	$lobjFamiliar=new clsFamiliar;
	$lobjBitacora=new clsBitacora;
	$lobjUtil=new clsUtil;

	$lobjFamiliar->set_Familiar($_POST['idfamiliar']);
	$lobjFamiliar->set_Nombreuno($_POST['nombreunofam']);
	$lobjFamiliar->set_Nombredos($_POST['nombredosfam']);
	$lobjFamiliar->set_Nacionalidadfam($_POST['nacionalidadfam']);
	$lobjFamiliar->set_Apellidouno($_POST['apellidounofam']);
	$lobjFamiliar->set_Apellidodos($_POST['apellidodosfam']);
	$lobjFamiliar->set_Sexo($_POST['sexofam']);
	$lobjFamiliar->set_Fecha($_POST['fechanacimientofam']);
	$lobjFamiliar->set_Direccion($_POST['direccionfam']);
	$lobjFamiliar->set_Telefono($_POST['telefonofam']);
	$lobjFamiliar->set_Ocupacion($_POST['ocupacionfam']);
	$lobjFamiliar->set_GradoInstuccion($_POST['gradoinstrucfam']);
	$lobjFamiliar->set_NumHijos($_POST['numhijofam']);
	$lobjFamiliar->set_Ingreso($_POST['ingresofam']);
	$lobjFamiliar->set_Diagnostico($_POST['tdiagnostico_iddiagnostico']);
	$lobjFamiliar->set_Localidad($_POST['tlocalidad_idlocalidad']);

	$lcReal_ip=$lobjUtil->get_real_ip();
    $ldFecha=date('Y-m-d h:m');
	$operacion=$_POST['operacion'];
	$fila=$_POST['fila'];

	switch ($operacion) 
	{
		case 'verificar':
			if($lobjFamiliar->consultar_familiar())
			{
				echo '1';
			}
				
		break;
		case 'registrar_familiar_popup':
			$hecho=$lobjFamiliar->registrar_familiar();
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Registrar','Cargar datos','*','tfamiliar','','',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha registrado exitosamente';
				header('location: ../vista/registrar_familiar.php?f='.$fila.'&cedula='.$_POST['idfamiliar'].'&nombre='.$_POST['apellidounofam'].' '.$_POST['nombreunofam']);
			}
			else
			{	
				$_SESSION['msj']='Error en el registro';
				header('location: ../vista/registrar_familiar.php');
			}
		break;
		case 'registrar_familiar':
			$hecho=$lobjFamiliar->registrar_familiar();
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Registrar','Cargar datos','*','tfamiliar','','',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha registrado exitosamente';
				header('location: ../vista/intranet.php?vista=persona/familiar');
			}
			else
			{	
				$_SESSION['msj']='Error en el registro';
				header('location: ../vista/intranet.php?vista=persona/familiar');
			}
		break;
		case 'editar_familiar':
			$hecho=$lobjFamiliar->editar_familiar();
			if($hecho)
			{				
				$_SESSION['msj']='Se ha modificado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='No se realizarón cambios';
			}
			header('location: ../vista/intranet.php?vista=persona/familiar');
		break;
		case 'eliminar_familiar':
			$hecho=$lobjFamiliar->eliminar_familiar();
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Eliminar',$_POST['razondesactiva'],'estatusfam','tfamiliar','1','0',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha eliminado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='Error al eliminar';
			}
			header('location: ../vista/intranet.php?vista=persona/familiar');
		break;

		case 'restaurar_familiar':
			$hecho=$lobjFamiliar->restaurar_familiar();
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Restaurar','No sé utiliza','estatusfam','tfamiliar','0','1',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha restaurado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='No se pudo restaurar';
			}
			header('location: ../vista/intranet.php?vista=persona/familiar');
		break;
		default:
			header('location: ../vista/intranet.php?vista=persona/familiar');
		break;
	
	}

?>