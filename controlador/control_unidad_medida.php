<?php
	session_start();
	require_once("../clases/clase_unidad_medida.php");
	require_once("../clases/clase_bitacora.php");
    require_once('../libreria/utilidades.php');
	$lobjUnidad_Medida=new clsUnidad_Medida;
	$lobjBitacora=new clsBitacora;
	$lobjUtil=new clsUtil;

	$lobjUnidad_Medida->set_Unidad_Medida($_POST['idunidad_medida']);
	$lobjUnidad_Medida->set_Nombre($_POST['nombreunidad_medida']);
	$operacion=$_POST['operacion'];
	$lcReal_ip=$lobjUtil->get_real_ip();
    $ldFecha=date('Y-m-d h:m');


	switch ($operacion) 
	{
		case 'registrar_unidad_medida':
			$hecho=$lobjUnidad_Medida->registrar_unidad_medida();
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Registrar','Cargar datos','*','tunidad_medida','','',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha registrado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='Error en el registro';
			}
			header('location: ../vista/intranet.php?vista=archivo/unidad_medida');
		break;
		case 'editar_unidad_medida':
			$laValorNuevo=$laValorAnterior=$laCampo=array();

			$lobjUnidad_Medida->set_Unidad_Medida($_POST['idunidad_medida']);
			$laUnidad_MedidaAnterior=$lobjUnidad_Medida->consultar_unidad_medida();

			$hecho=$lobjUnidad_Medida->editar_unidad_medida();
			if($hecho)
			{
				$cont=0;
				if($_POST['nombreunidad_medida']!=$laUnidad_MedidaAnterior[1])
				{
					$laValorNuevo[]=$_POST['nombreunidad_medida'];
					$laValorAnterior[]=$laUnidad_MedidaAnterior[1];
					$laCampo[]='descripcionmun';
					$cont++;
				}

				for($i=0;$i<$cont;$i++)
				{
					$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Modificar','Error en los datos',$laCampo[$i],'tunidad_medida',$laValorAnterior[$i],$laValorNuevo[$i],$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
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
			header('location: ../vista/intranet.php?vista=archivo/unidad_medida');
		break;
		case 'eliminar_unidad_medida':
			$hecho=$lobjUnidad_Medida->eliminar_unidad_medida();
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Eliminar','No sé utiliza','estatusmun','tunidad_medida','1','0',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha desactivado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='Error al eliminar';
			}
			header('location: ../vista/intranet.php?vista=archivo/unidad_medida');
		break;
		case 'restaurar_unidad_medida':
			$hecho=$lobjUnidad_Medida->restaurar_unidad_medida();
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Restaurar','No sé utiliza','estatusmun','tunidad_medida','0','1',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha restaurado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='No se pudo restaurar la unidad de medida';
			}

			header('location: ../vista/intranet.php?vista=archivo/unidad_medida');
		break;
		default:
			header('location: ../vista/intranet.php');
		break;
	}

?>