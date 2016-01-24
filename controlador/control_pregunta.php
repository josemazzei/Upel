<?php
	session_start();
	require_once("../clases/clase_pregunta.php");
	require_once("../clases/clase_usuario.php");
	require_once("../clases/clase_bitacora.php");
    require_once('../libreria/utilidades.php');
	$lobjPregunta=new clsPregunta;
	$lobjUsuario=new clsUsuario;
	$lobjBitacora=new clsBitacora;
	$lobjUtil=new clsUtil;

	$IdPreguntas=$_POST['idpregunta'];
	$Preguntas=$_POST['pregunta'];
	$Respuestas=$_POST['respuesta'];
	$NroPreguntas=$_POST['nropreguntas'];
	$lobjUsuario->set_Usuario($_POST['tusuario_idusuario']);
	$lobjPregunta->set_Usuario($_POST['tusuario_idusuario']);

	$lcReal_ip=$lobjUtil->get_real_ip();
    $ldFecha=date('Y-m-d h:m');
	$operacion=$_POST['operacion'];

	switch ($operacion) 
	{
		case 'registrar_pregunta':
			for($i=0;$i<$NroPreguntas;$i++)
			{
				$lobjPregunta->set_Pregunta($Preguntas[$i]);
				$lobjPregunta->set_Respuesta($Respuestas[$i]);
				$hecho=$lobjPregunta->registrar_pregunta();
				if($hecho)
				{
					$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Registrar','Cargar datos','*','tpregunta','','',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
						$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
					$_SESSION['msj']='Se ha registrado exitosamente';
				}
				else
				{	
					$_SESSION['msj']='Error en el registro';
				}
			}
		break;
		case 'editar_pregunta':
			for($i=0;$i<$NroPreguntas;$i++)
			{
				$lobjPregunta->set_IdPregunta($IdPreguntas[$i]);
				$lobjPregunta->set_Pregunta($Preguntas[$i]);
				$lobjPregunta->set_Respuesta($Respuestas[$i]);
				$laLocalidadAnterior=$lobjPregunta->consultar_pregunta_bitacora();

				$laValorNuevo=$laValorAnterior=$laCampo=array();

				$hecho=$lobjPregunta->editar_pregunta();
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
						$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Modificar','Error en los datos',$laCampo[$i],'tpregunta',$laValorAnterior[$i],$laValorNuevo[$i],$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
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
			}
		break;
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
		break;
		case 'primera_vez':
				$lobjPregunta->set_Usuario($_POST['tusuario_idusuario']);
				$llHecho = $lobjPregunta->cambio_clave_interno($_POST['clave_actual'], $_POST['clave_nueva']);
				if($llHecho)
				{
					for($i=0;$i<$NroPreguntas;$i++)
					{
						$lobjPregunta->set_Pregunta($Preguntas[$i]);
						$lobjPregunta->set_Respuesta($Respuestas[$i]);
						$hecho=$lobjPregunta->registrar_pregunta();
						if($hecho)
						{
							$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Registrar','Cargar datos','*','tpregunta','','',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
								$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
							$_SESSION['msj']='Registro exitoso';
						}
						else
						{	
							$_SESSION['msj']='Error en el registro';
						}
					}
				}
				if($llHecho)
				{
					$_SESSION['msj']='Registro exitoso';
				}
				else
				{
					$_SESSION['msj']='Error en el registro';
				}
				
		break;
		case 'eliminar_localidad':
			$hecho=$lobjPregunta->eliminar_localidad();
			if($hecho)
			{
				$_SESSION['msj']='Se ha desactivado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='Error al eliminar';
			}
		break;
		case 'desbloquear_usuario':
			$hecho=$lobjPregunta->desbloquear();
			if($hecho)
			{
				$_SESSION['msj']='Se ha desbloqueado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='Error al desbloquear';
			}
			header('location: ../vista/intranet.php?vista=seguridad/bloquear');
			exit();
		break;
		case 'bloquear_usuario':
			$hecho=$lobjUsuario->bloquear_usuario();
			if($hecho)
			{
				$_SESSION['msj']='Se ha bloqueado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='Error al bloquear';
			}
			header('location: ../vista/intranet.php?vista=seguridad/bloquear');
			exit();
		break;
		default:
			header('location: ../vista/intranet.php?vista=seguridad/registrar_pregunta');
		break;
	}

	header('location: ../vista/intranet.php?vista=seguridad/registrar_pregunta');
?>