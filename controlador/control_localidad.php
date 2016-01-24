<?php
	session_start();
	require_once("../clases/clase_localidad.php");
	require_once("../clases/clase_bitacora.php");
    require_once('../libreria/utilidades.php');
	$lobjLocalidad=new clsLocalidad;
	$lobjBitacora=new clsBitacora;
	$lobjUtil=new clsUtil;

	$lobjLocalidad->set_Localidad($_POST['idlocalidad']);
	$lobjLocalidad->set_Descripcion($_POST['descripcionloc']);
	$lobjLocalidad->set_Estatus($_POST['estatusloc']);
	$lobjLocalidad->set_Municipio($_POST['tmunicipio_municipio']);

	$lcReal_ip=$lobjUtil->get_real_ip();
    $ldFecha=date('Y-m-d h:m');
	$operacion=$_POST['operacion'];

	switch ($operacion) 
	{
		case 'verificar':
			if($lobjLocalidad->verificar())
			{
				echo '1';
			}
				
		break;
		case 'registrar_localidad':
			$hecho=$lobjLocalidad->registrar_localidad();
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Registrar','Cargar datos','*','tlocalidad','','',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha registrado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='Error en el registro';
			}
			header('location: ../vista/intranet.php?vista=archivo/localidad');
		break;
		case 'editar_localidad':
			$lobjLocalidad->set_Localidad($_POST['idlocalidad']);
			$laLocalidadAnterior=$lobjLocalidad->consultar_localidad_bitacora();

			$laValorNuevo=$laValorAnterior=$laCampo=array();

			$hecho=$lobjLocalidad->editar_localidad();
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
					$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Modificar','Error en los datos',$laCampo[$i],'tlocalidad',$laValorAnterior[$i],$laValorNuevo[$i],$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
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
			header('location: ../vista/intranet.php?vista=archivo/localidad');
		break;
		case 'eliminar_localidad':
			$hecho=$lobjLocalidad->eliminar_localidad();
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Eliminar','No sé utiliza','estatusloc','tlocalidad','1','0',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha desactivado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='Error al eliminar';
			}
			header('location: ../vista/intranet.php?vista=archivo/localidad');
		break;
		case 'restaurar_localidad':
			$hecho=$lobjLocalidad->restaurar_localidad();
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Restaurar','No sé utiliza','estatusloc','tlocalidad','0','1',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha restaurado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='No se pudo restaurar el localidad';
			}

			header('location: ../vista/intranet.php?vista=archivo/localidad');
		break;
	}

?>