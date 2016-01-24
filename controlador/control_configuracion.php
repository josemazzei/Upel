<?php
	session_start();
	require_once("../clases/clase_configuracion.php");
	require_once("../clases/clase_bitacora.php");
    require_once('../libreria/utilidades.php');
	$lobjConfiguracion=new clsConfiguracion;
	$lobjBitacora=new clsBitacora;
	$lobjUtil=new clsUtil;

	$lobjConfiguracion->set_Idconfiguracion($_POST['idconfiguracion']);
	$lobjConfiguracion->set_Introduccion($_POST['introducion']);
	$lobjConfiguracion->set_Mision($_POST['mision']);
	$lobjConfiguracion->set_Vision($_POST['vision']);
	$lobjConfiguracion->set_Historia($_POST['historia']);
	$lobjConfiguracion->set_Objetivos($_POST['objetivos']);
	$lobjConfiguracion->set_Direccion($_POST['direccion']);
	$lobjConfiguracion->set_Nropreguntas($_POST['nropreguntas']);
	$lobjConfiguracion->set_Clavepredeterminada($_POST['clavepredeterminada']);
	$lobjConfiguracion->set_Nrointentos($_POST['nrointentos']);
	$lobjConfiguracion->set_Tiempocaducidad($_POST['tiempocaducida']);
	$lobjConfiguracion->set_Tiempolapso($_POST['tiempolapso']);
	$lobjConfiguracion->set_Tiempoconexion($_POST['tiempoconexion']);

	$lcReal_ip=$lobjUtil->get_real_ip();
    $ldFecha=date('Y-m-d h:m');
	$operacion=$_POST['operacion'];

	switch ($operacion) 
	{
		case 'registrar_configuracion':
			$hecho=$lobjConfiguracion->registrar_configuracion();
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Registrar','Cargar datos','*','tsistema','','',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha Registrado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='Error en el registro';
			}
		break;
		case 'editar_configuracion':
			$lobjConfiguracion->set_Idconfiguracion($_POST['idconfiguracion']);
			$laConfiguracionAnterior=$lobjConfiguracion->consultar_configuracion_bitacora();

			$laValorNuevo=$laValorAnterior=$laCampo=array();

			$hecho=$lobjConfiguracion->editar_configuracion();
			if($hecho)
			{
				$cont=0;
				foreach ($laConfiguracionAnterior as $key2 => $value2) 
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
					$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Modificar','Error en los datos',$laCampo[$i],'tsistema',$laValorAnterior[$i],$laValorNuevo[$i],$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
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
		default:
			header('location: ../vista/intranet.php?vista=sistema/configurar');
		break;
	}

	header('location: ../vista/intranet.php?vista=sistema/configurar');
?>