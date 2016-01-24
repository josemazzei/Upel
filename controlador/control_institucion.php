<?php
	session_start();
	require_once("../clases/clase_institucion.php");
	require_once("../clases/clase_bitacora.php");
    require_once('../libreria/utilidades.php');
	$lobjInstitucion=new clsInstitucion;
	$lobjBitacora=new clsBitacora;
	$lobjUtil=new clsUtil;

	$lobjInstitucion->set_Institucion($_POST['idinstitucion']);
	$lobjInstitucion->set_Descripcion($_POST['descripcioninst']);
	$lobjInstitucion->set_Estatus($_POST['estatusinst']);
	$lobjInstitucion->set_Localidad($_POST['tlocalidad_idlocalidad']);
	$lobjInstitucion->set_Director($_POST['directorinst']);
	$lobjInstitucion->set_Direccion($_POST['direccioninst']);

	$lcReal_ip=$lobjUtil->get_real_ip();
    $ldFecha=date('Y-m-d h:m');
	$operacion=$_POST['operacion'];

	switch ($operacion) 
	{
		case 'registrar_institucion':
			$hecho=$lobjInstitucion->registrar_institucion();
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Registrar','Cargar datos','*','tinstitucion','','',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha registrado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='Error en el registro';
			}
			header('location: ../vista/intranet.php?vista=archivo/institucion');
		break;
		case 'editar_institucion':
			$laInstitucionAnterior=$lobjInstitucion->consultar_institucion_bitacora();

			$laValorNuevo=$laValorAnterior=$laCampo=array();

			$hecho=$lobjInstitucion->editar_institucion
			();
			if($hecho)
			{
				$cont=0;
				foreach ($laInstitucionAnterior as $key2 => $value2) 
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
					$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Modificar','Error en los datos',$laCampo[$i],'tinstitucion',$laValorAnterior[$i],$laValorNuevo[$i],$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
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
			header('location: ../vista/intranet.php?vista=archivo/institucion');
		break;
		case 'eliminar_institucion':
			$hecho=$lobjInstitucion->eliminar_institucion();
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Eliminar','No sé utiliza','estatusinst','tinstitucion','1','0',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha eliminado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='Error al eliminar';
			}
			header('location: ../vista/intranet.php?vista=archivo/institucion');
		break;
		case 'restaurar_institucion':
			$hecho=$lobjInstitucion->restaurar_institucion();
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Restaurar','No sé utiliza','estatusinst','tinstitucion','0','1',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha restaurado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='No se pudo restaurar el institucion';
			}

			header('location: ../vista/intranet.php?vista=archivo/institucion');
		break;
		default:
			header('location: ../vista/intranet.php?vista=archivo/institucion');
		break;
	}

?>