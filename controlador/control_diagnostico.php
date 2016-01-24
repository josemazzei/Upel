<?php
	session_start();
	require_once("../clases/clase_diagnostico.php");
	require_once("../clases/clase_bitacora.php");
    require_once('../libreria/utilidades.php');
	$lobjDiagnostico=new clsDiagnostico;
	$lobjBitacora=new clsBitacora;
	$lobjUtil=new clsUtil;

	$lobjDiagnostico->set_Diagnostico($_POST['iddiagnostico']);
	$lobjDiagnostico->set_Nombre($_POST['descripciondia']);
	$lobjDiagnostico->set_Estatus($_POST['estatusdia']);

	$lcReal_ip=$lobjUtil->get_real_ip();
    $ldFecha=date('Y-m-d h:m');
	$operacion=$_POST['operacion'];

	switch ($operacion) 
	{
		case 'registrar_diagnostico':
			$hecho=$lobjDiagnostico->registrar_diagnostico();
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Registrar','Cargar datos','*','tdiagnostico','','',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha registrado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='Error en el registro';
			}
			header('location: ../vista/intranet.php?vista=archivo/diagnostico');
		break;
		case 'editar_diagnostico':
			$lobjDiagnostico->set_Diagnostico($_POST['iddiagnostico']);
			$laDiagnosticoAnterior=$lobjDiagnostico->consultar_diagnostico_bitacora();

			$laValorNuevo=$laValorAnterior=$laCampo=array();

			$hecho=$lobjDiagnostico->editar_diagnostico();
			if($hecho)
			{
				$cont=0;
				foreach ($laDiagnosticoAnterior as $key2 => $value2) 
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
					$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Modificar','Error en los datos',$laCampo[$i],'tdiagnostico',$laValorAnterior[$i],$laValorNuevo[$i],$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
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
			header('location: ../vista/intranet.php?vista=archivo/diagnostico');
		break;
		case 'eliminar_diagnostico':
			$hecho=$lobjDiagnostico->eliminar_diagnostico();
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Eliminar','No sé utiliza','estatusdia','tdiagnostico','1','0',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha desactivado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='Error al eliminar';
			}
			header('location: ../vista/intranet.php?vista=archivo/diagnostico');
		break;
		case 'restaurar_diagnostico':
			$hecho=$lobjDiagnostico->restaurar_diagnostico();
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Restaurar','No sé utiliza','estatusdia','tdiagnostico','0','1',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha restaurado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='No se pudo restaurar el diagnostico';
			}

			header('location: ../vista/intranet.php?vista=archivo/diagnostico');
		break;
		default:
			header('location: ../vista/intranet.php?vista=archivo/diagnostico');
		break;
	}

?>