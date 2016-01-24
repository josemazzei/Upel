<?php
	session_start();
	require_once("../clases/clase_asignatura.php");
	require_once("../clases/clase_bitacora.php");
    require_once('../libreria/utilidades.php');
	$lobjAsignatura=new clsAsignatura;
	$lobjBitacora=new clsBitacora;
	$lobjUtil=new clsUtil;

	$lobjAsignatura->set_Asignatura($_POST['idasignatura']);
	$lobjAsignatura->set_Area($_POST['tarea_idarea_conocimiento']);
	$lobjAsignatura->set_Nombre($_POST['nombreaasi']);
	$lobjAsignatura->set_Estatus($_POST['estatusasi']);
	$lobjAsignatura->set_HorasTeoricas($_POST['horasteoricas']);
	$lobjAsignatura->set_HorasPracticas($_POST['horaspracticas']);
	$lobjAsignatura->set_Unidades($_POST['unidad']);
	$lobjAsignatura->set_IdUnidades($_POST['idunidad']);
	$lobjAsignatura->set_Objetivos($_POST['objetivo']);
	$lobjAsignatura->set_Unidad_oculta($_POST['unidad_oculta']);
	$lobjAsignatura->set_Contenido($_POST['contenido']);

	$lcReal_ip=$lobjUtil->get_real_ip();
    $ldFecha=date('Y-m-d h:m');
	$operacion=$_POST['operacion'];

	switch ($operacion) 
	{
		case 'registrar_asignatura':
			$hecho=$lobjAsignatura->registrar_asignatura();
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Registrar','Cargar datos','*','tasignatura','','',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha registrado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='Error en el registro';
			}
			header('location: ../vista/intranet.php?vista=archivo/asignatura');
		break;
		case 'editar_asignatura':

			$hecho1=$lobjAsignatura->editar_asignatura();
			$lobjAsignatura->eliminar_unidad_objetivos();
			$hecho2=$lobjAsignatura->registrar_unidades_objetivos();
			if($hecho1 || $hecho2)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Modificar','Error en los datos',$laCampo[$i],'tasignatura',$laValorAnterior[$i],$laValorNuevo[$i],$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lnHecho=$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha modificado exitosamente';

			}
			else
			{	
				$_SESSION['msj']='No se realizarón cambios';
			}
			header('location: ../vista/intranet.php?vista=archivo/asignatura');
		break;
		case 'eliminar_asignatura':
			$hecho=$lobjAsignatura->eliminar_asignatura();
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Eliminar',$_POST['razondesactiva'],'estatusasi','tasignatura','1','0',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha desactivado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='Error al eliminar';
			}
			header('location: ../vista/intranet.php?vista=archivo/asignatura');
		break;
		case 'restaurar_asignatura':
			$hecho=$lobjAsignatura->restaurar_asignatura();
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Restaurar','No sé utiliza','estatusasi','tasignatura','0','1',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha restaurado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='No se pudo restaurar';
			}
			header('location: ../vista/intranet.php?vista=archivo/asignatura');
		break;
		case 'consular_objetivos':
			$laObjetivos=$lobjAsignatura->consultar_objetivos($_POST['idunidad']);
			if ($laObjetivos) 
			{

				for ($i=0; $i <count($laObjetivos); $i++) 
				{ 
					echo '<label><input onclick="activar_observacion('.$_POST['i'].')" type="checkbox" name="objetivo'.$_POST['i'].'[]" id="cam_objetivo'.$_POST['i'].'_'.$i.'" value="'.$laObjetivos[$i]['idobjetivo'].'"> '.$laObjetivos[$i]['nombreobj'].'</label>';
				}
			}
			else
				echo '0';
		break;
		default:
			header('location: ../vista/intranet.php?vista=archivo/asignatura');
		break;
	}

?>