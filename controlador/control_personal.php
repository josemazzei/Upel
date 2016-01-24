<?php
	session_start();
	require_once("../clases/clase_personal.php");
	require_once("../clases/clase_usuario.php");
	require_once("../clases/clase_bitacora.php");
    require_once('../libreria/utilidades.php');
	$lobjPersonal=new clsPersonal;
	$lobjUsuario=new clsUsuario;
	$lobjBitacora=new clsBitacora;
	$lobjUtil=new clsUtil;

	$lobjPersonal->set_Personal($_POST['idpersonal']);
	$lobjPersonal->set_Nacionalidad($_POST['nacionalidadper']);
	$lobjPersonal->set_Nombreuno($_POST['nombreunoper']);
	$lobjPersonal->set_Nombredos($_POST['nombredosper']);
	$lobjPersonal->set_Apellidouno($_POST['apellidounoper']);
	$lobjPersonal->set_Apellidodos($_POST['apellidodosper']);
	$lobjPersonal->set_Sexo($_POST['sexoper']);
	$lobjPersonal->set_Fecha($_POST['fechanacimientoper']);
	$lobjPersonal->set_Direccion($_POST['direccionper']);
	$lobjPersonal->set_Telefono($_POST['telefonoper']);
	$lobjPersonal->set_Cargo($_POST['cargoper']);
	$lobjPersonal->set_Estatus($_POST['estatusper']);
	$lobjPersonal->set_Diagnostico($_POST['tdiagnostico_iddiagnostico']);
	$lobjPersonal->set_Localidad($_POST['tlocalidad_idlocalidad']);
	$lobjPersonal->set_Correo($_POST['correoper']);

	$lobjUsuario->set_Usuario($_POST['idpersonal']);
	$lobjUsuario->set_Rol($_POST['idrol']);
	$lobjUsuario->set_Persona($_POST['idpersonal']);
	$lobjUsuario->set_Email($_POST['correoper']);
	$lobjUsuario->set_Nombre($_POST['apellidounoper'].' '.$_POST['nombreunoper']);

	$lcReal_ip=$lobjUtil->get_real_ip();
    $ldFecha=date('Y-m-d h:m');
	$operacion=$_POST['operacion'];

	switch ($operacion) 
	{
		case 'verificar':
			if($lobjPersonal->consultar_persona())
			{
				echo '1';
			}
				
		break;
		case 'registrar_personal':
			$hecho=$lobjPersonal->registrar_personal();
			$hecho=$lobjUsuario->registrar_usuario();
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Registrar','Cargar datos','*','tpersonal','','',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha registrado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='Error en el registro';
			}
			header('location: ../vista/intranet.php?vista=persona/personal');
		break;
		case 'editar_personal':
			$laDocenteAnterior=$lobjPersonal->consultar_persona_bitacora();

			$laValorNuevo=$laValorAnterior=$laCampo=array();

			$hecho=$lobjPersonal->editar_personal();
			$hecho=$lobjUsuario->editar_usuario();
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
				if($hecho)
				{
					$_SESSION['msj']='Se ha modificado exitosamente';
				}
				for($i=0;$i<$cont;$i++)
				{
					$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Modificar','Error en los datos',$laCampo[$i],'tpersonal',$laValorAnterior[$i],$laValorNuevo[$i],$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
	   				$lnHecho=$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
   					
				}
				
			}
			else
			{	
				$_SESSION['msj']='No se realizarón cambios';
			}
			header('location: ../vista/intranet.php?vista=persona/personal');
		break;
		case 'eliminar_docente':
			$hecho=$lobjPersonal->eliminar_personal();
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Eliminar',$_POST['razondesactiva'],'estatusper','tpersonal','1','0',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha desactivado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='Error al eliminar';
			}
			header('location: ../vista/intranet.php?vista=persona/personal');
		break;
		case 'restaurar_personal':
			$hecho=$lobjPersonal->restaurar_personal();
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Restaurar','No sé utiliza','estatusper','tpersonal','0','1',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha restaurado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='No se pudo restaurar el personal';
			}

			header('location: ../vista/intranet.php?vista=persona/personal');			
		break;
		default:
			header('location: ../vista/intranet.php?vista=persona/personal');
		break;
	}

?>