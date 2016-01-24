<?php
	session_start();
	require_once("../clases/clase_asistencia.php");
	$lobjAsistencia=new clsAsistencia;

	$lobjAsistencia->set_IdAsistencia($_POST['idasistencia']);
	$lobjAsistencia->set_Asistencia($_POST['asistencia']);
	$lobjAsistencia->set_IdCurso_participante($_POST['idcurso_participante']);
	$lobjAsistencia->set_IdUnidad($_POST['idunidad']);

	$lobjAsistencia->set_Fecha($_POST['fechaasi']);
	for($i=0;$i<count($_POST['idcurso_participante']);$i++) 
	{
		if($_POST['objetivo'.$i])
		{
			$objetivo=$_POST['objetivo'.$i];
			for($j=0;$j<count($_POST['objetivo'.$i]);$j++) 
			{
				$laObjetivo[$i][$j]=$objetivo[$j];
			}
		}
	}
	$lobjAsistencia->set_IdObjetivos($laObjetivo);
	$lobjAsistencia->set_Observacion($_POST['observacion']);

	$operacion=$_POST['operacion'];

	switch ($operacion) 
	{
		case 'registrar_asistencia':
			$hecho=$lobjAsistencia->registrar_asistencia();
			if($hecho)
			{
				$_SESSION['msj']='Se ha registrado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='Error en el registro';
			}
		header('location: ../vista/intranet.php?vista=curso/registrar_asistencia&id='.$_POST['idcurso']);

		break;
		case 'editar_asistencia':
			$hecho=$lobjAsistencia->editar_asistencia();
			if($hecho)
			{
				$_SESSION['msj']='Se ha modificado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='No se realizarón cambios';
			}
			header('location: ../vista/intranet.php?vista=curso/registrar_asistencia&id='.$_POST['idcurso']);
		break;
		case 'eliminar_asistencia':
			$hecho=$lobjAsistencia->eliminar_asistencia();
			if($hecho)
			{
				$_SESSION['msj']='Se ha desactivado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='Error al eliminar';
			}
		break;
		default:
			header('location: ../vista/intranet.php?vista=curso/asistencia');
		break;
	}

?>