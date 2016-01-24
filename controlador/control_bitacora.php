<?php	
	session_start();
	require_once("../clases/clase_bitacora.php");
    require_once('../libreria/utilidades.php');
	$lobjBitacora=new clsBitacora;
	$lobjUtil=new clsUtil;
	/*
	Se reciben todos los datos y se asignan a las variables para posteriormente enviarlos a la clase bitac
	*/
	$lnIdBitacora=$_POST['idbitacora'];
	$lcDireccion=$_POST['direccionbit'];
	$ldFecha=$_POST['fechahorabit'];
	$lcIp=$_POST['ipbit'];
	$lcUsuario=$_POST['idusuario'];
	$lcServicio=$_POST['serviciobit'];
	$lcValorAnterior=$_POST['valoranteriorbit'];
	$lcValorNuevo=$_POST['valornuevobit'];
	$lcOperacion=$_POST['operacionbit'];
	$lcMotivo=$_POST['motivobit'];
	$lcCampo=$_POST['campobit'];
	$lcTabla=$_POST['tablabit'];
	$operacion=$_POST['operacion'];

	//Toma la ip y la fecha actual del dispositivo desde el cual se está haciendo la petición
	$lcReal_ip=$lobjUtil->get_real_ip();
    $ldFecha=date('Y-m-d h:m');


    /*
		Se realizan las operaciones pertenecientes a la bitacora, en las cuales se envian los paramentos a través
		de un metódo SET y se ejecutan las funciones correpondientes al caso del objeto bitacora.
    */
	switch ($operacion) 
	{
		case 'revertir':
			$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Revertir los cambios','Cambios no deseados',$lcCampo,$lcTabla,$lcValorAnterior,$lcValorNuevo,$_SESSION['usuario'],$lcServicio);
			$hecho=$lobjBitacora->revertir_cambios();			
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Revertir los cambios','Cambios no deseados',$lcCampo,$lcTabla,$lcValorNuevo,$lcValorAnterior,$_SESSION['usuario'],$lcServicio);
				$hecho=$lobjBitacora->registrar_bitacora();
				if($hecho)
				{
					$_SESSION['msj']='Se lograron revertir los cambios con éxito';
				}
			}
			else
			{	
				$_SESSION['msj']='No se pudieron revertir los cambios';
			}
		break;
		default:
			header('location: ../vista/intranet.php?vista=seguridad/bitacora');
		break;
	}

	header('location: ../vista/intranet.php?vista=seguridad/bitacora');
?>