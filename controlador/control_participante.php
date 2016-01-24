<?php
	session_start();
	require_once("../clases/clase_participante.php");
	require_once("../clases/clase_bitacora.php");
    require_once('../libreria/utilidades.php');
	$lobjParticipante=new clsParticipante;
	$lobjBitacora=new clsBitacora;
	$lobjUtil=new clsUtil;

	$lobjParticipante->set_Idparticipante($_POST['idparticipante']);
	$lobjParticipante->set_Cedulapar($_POST['cedulapar']);
	$lobjParticipante->set_Nombreunopar($_POST['nombreunopar']);
	$lobjParticipante->set_Nacionalidadpar($_POST['nacionalidadpar']);
	$lobjParticipante->set_Etniapar($_POST['etniapar']);
	$lobjParticipante->set_Nombredospar($_POST['nombredospar']);
	$lobjParticipante->set_Apellidounopar($_POST['apellidounopar']);
	$lobjParticipante->set_Apellidodospar($_POST['apellidodospar']);
	$lobjParticipante->set_Sexopar($_POST['sexopar']);
	$lobjParticipante->set_Telefonopar($_POST['telefonopar']);
	$lobjParticipante->set_Fechanacimientopar($_POST['fechanacimientopar']);
	$lobjParticipante->set_Direccionpar($_POST['direccionpar']);
	$lobjParticipante->set_Numhijopar($_POST['numhijopar']);
	$lobjParticipante->set_Viviendapar($_POST['viviendapar']);
	$lobjParticipante->set_Medioviviendapar($_POST['medioviviendapar']);
	$lobjParticipante->set_Tipoconstruccionpar($_POST['tipoconstruccionpar']);
	$lobjParticipante->set_Braillepar($_POST['braillepar']);
	$lobjParticipante->set_Estatuspar($_POST['estatuspar']);
	$lobjParticipante->set_IdDiagnostico($_POST['tdiagnostico_iddiagnostico']);
	$lobjParticipante->set_IdInstitucion($_POST['tinstitucion_idinstitucion']);

	$lcReal_ip=$lobjUtil->get_real_ip();
    $ldFecha=date('Y-m-d h:m');
	$operacion=$_POST['operacion'];

	switch ($operacion) 
	{
		case 'registrar_participante':
			$hecho=$lobjParticipante->registrar_participante();
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Registrar','Cargar datos','*','tparticipante','','',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha registrado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='Error en el registro';
			}
		break;
		case 'editar_participante':
			$laParticipanteAnterior=$lobjParticipante->consultar_participante_bitacora();

			$laValorNuevo=$laValorAnterior=$laCampo=array();

			$hecho=$lobjParticipante->editar_participante();
			if($hecho)
			{
				$cont=0;
				foreach ($laParticipanteAnterior as $key2 => $value2) 
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
					$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Modificar','Error en los datos',$laCampo[$i],'tparticipante',$laValorAnterior[$i],$laValorNuevo[$i],$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
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
		case 'eliminar_participante':
			$hecho=$lobjParticipante->eliminar_participante();
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Eliminar',$_POST['razondesactiva'],'estatuspar','tparticipante','1','0',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha desactivado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='Error al eliminar';
			}
		break;
		default:
			header('location: ../vista/intranet.php?vista=persona/participante');
		break;
	}

	header('location: ../vista/intranet.php?vista=persona/participante');
?>