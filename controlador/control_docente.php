<?php
	session_start();
	require_once("../clases/clase_docente.php");
	require_once("../clases/clase_bitacora.php");
    require_once('../libreria/utilidades.php');
	$lobjDocente=new clsDocente;
	$lobjBitacora=new clsBitacora;
	$lobjUtil=new clsUtil;

	$lobjDocente->set_Docente($_POST['iddocente']);
	$lobjDocente->set_Nacionalidad($_POST['nacionalidaddoc']);
	$lobjDocente->set_Nombreuno($_POST['nombreunodoc']);
	$lobjDocente->set_Nombredos($_POST['nombredosdoc']);
	$lobjDocente->set_Apellidouno($_POST['apellidounodoc']);
	$lobjDocente->set_Apellidodos($_POST['apellidodosdoc']);
	$lobjDocente->set_Sexo($_POST['sexodoc']);
	$lobjDocente->set_Fecha($_POST['fechanacimientodoc']);
	$lobjDocente->set_Direccion($_POST['direcciondoc']);
	$lobjDocente->set_Telefono($_POST['telefonodoc']);
	$lobjDocente->set_Titulo($_POST['titulodoc']);
	$lobjDocente->set_Tipo($_POST['tipodoc']);
	$lobjDocente->set_Diagnostico($_POST['tdiagnostico_iddiagnostico']);
	$lobjDocente->set_Localidad($_POST['tlocalidad_idlocalidad']);

	$lcReal_ip=$lobjUtil->get_real_ip();
    $ldFecha=date('Y-m-d h:m');
	$operacion=$_POST['operacion'];

	switch ($operacion) 
	{
		case 'registrar_docente':
			$hecho=$lobjDocente->registrar_docente();
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Registrar','Cargar datos','*','tdocente','','',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha registrado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='Error en el registro';
			}
		break;
		case 'editar_docente':
			$laDocenteAnterior=$lobjDocente->consultar_docente_bitacora();

			$laValorNuevo=$laValorAnterior=$laCampo=array();

			$hecho=$lobjDocente->editar_docente();
			if($hecho)
			{
				$cont=0;
				foreach ($laDocenteAnterior as $key2 => $value2) 
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
					$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Modificar','Error en los datos',$laCampo[$i],'tdocente',$laValorAnterior[$i],$laValorNuevo[$i],$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
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
		case 'eliminar_docente':
			$hecho=$lobjDocente->eliminar_docente();
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Eliminar',$_POST['razondesactiva'],'estatusdoc','tdocente','1','0',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha desactivado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='Error al eliminar';
			}
		break;
		case 'restaurar_docente':
			$hecho=$lobjDocente->restaurar_docente();
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Restaurar','No sé utiliza','estatusdoc','tdocente','0','1',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha restaurado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='No se pudo restaurar';
			}
		break;
		default:
			header('location: ../vista/intranet.php?vista=persona/docente');
		break;
	}

	header('location: ../vista/intranet.php?vista=persona/docente');
?>