<?php
	session_start();
	require_once("../clases/clase_municipio.php");
	require_once("../clases/clase_bitacora.php");
    require_once('../libreria/utilidades.php');
	$lobjMunicipio=new clsMunicipio;
	$lobjBitacora=new clsBitacora;
	$lobjUtil=new clsUtil;

	$lobjMunicipio->set_Municipio($_POST['idmunicipio']);
	$lobjMunicipio->set_Nombre($_POST['nombremunicipio']);
	$operacion=$_POST['operacion'];
	$lcReal_ip=$lobjUtil->get_real_ip();
    $ldFecha=date('Y-m-d h:m');


	switch ($operacion) 
	{
		case 'registrar_municipio':
			$hecho=$lobjMunicipio->registrar_municipio();
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Registrar','Cargar datos','*','tmunicipio','','',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha registrado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='Error en el registro';
			}
			header('location: ../vista/intranet.php?vista=archivo/municipio');
		break;
		case 'editar_municipio':
			$laValorNuevo=$laValorAnterior=$laCampo=array();

			$lobjMunicipio->set_Municipio($_POST['idmunicipio']);
			$laMunicipioAnterior=$lobjMunicipio->consultar_municipio();

			$hecho=$lobjMunicipio->editar_municipio();
			if($hecho)
			{
				$cont=0;
				if($_POST['nombremunicipio']!=$laMunicipioAnterior[1])
				{
					$laValorNuevo[]=$_POST['nombremunicipio'];
					$laValorAnterior[]=$laMunicipioAnterior[1];
					$laCampo[]='descripcionmun';
					$cont++;
				}

				for($i=0;$i<$cont;$i++)
				{
					$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Modificar','Error en los datos',$laCampo[$i],'tmunicipio',$laValorAnterior[$i],$laValorNuevo[$i],$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
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
			header('location: ../vista/intranet.php?vista=archivo/municipio');
		break;
		case 'eliminar_municipio':
			$hecho=$lobjMunicipio->eliminar_municipio();
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Eliminar','No sé utiliza','estatusmun','tmunicipio','1','0',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha desactivado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='Error al eliminar';
			}
			header('location: ../vista/intranet.php?vista=archivo/municipio');
		break;
		case 'restaurar_municipio':
			$hecho=$lobjMunicipio->restaurar_municipio();
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Restaurar','No sé utiliza','estatusmun','tmunicipio','0','1',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha restaurado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='No se pudo restaurar el municipio';
			}

			header('location: ../vista/intranet.php?vista=archivo/municipio');
		break;
		default:
			header('location: ../vista/intranet.php');
		break;
	}

?>