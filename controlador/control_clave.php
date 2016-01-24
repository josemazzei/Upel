<?php
	session_start();
	require_once("../clases/clase_pregunta.php");
	require_once("../clases/clase_bitacora.php");
    require_once('../libreria/utilidades.php');
	$lobjPregunta=new clsPregunta;
	$lobjBitacora=new clsBitacora;
	$lobjUtil=new clsUtil;

	$IdPreguntas=$_POST['idpregunta'];
	$Preguntas=$_POST['pregunta'];
	$Respuestas=$_POST['respuesta'];
	$NroPreguntas=$_POST['nropreguntas'];
	$lobjPregunta->set_Usuario($_POST['tusuario_idusuario']);

	$lcReal_ip=$lobjUtil->get_real_ip();
    $ldFecha=date('Y-m-d h:m');
	$operacion=$_POST['operacion'];

	switch ($operacion) 
	{
		case 'cambiar_clave':
				$lobjPregunta->set_Usuario($_POST['tusuario_idusuario']);
				$llHecho = $lobjPregunta->cambio_clave_interno($_POST['clave_actual'], $_POST['clave_nueva']);
				
				if($llHecho)
				{
					$_SESSION['msj']='Se ha modificado exitosamente';
				}
				else
				{
					$_SESSION['msj']='No se realizarón cambios';
				}
			header('location: ../vista/intranet.php');

		break;
		default:
			header('location: ../vista/intranet.php');
		break;
	}

?>