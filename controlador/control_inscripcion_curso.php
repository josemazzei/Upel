<?php
	session_start();
	require_once("../clases/clase_curso_participante.php");
	require_once("../clases/clase_bitacora.php");
    require_once('../libreria/utilidades.php');
	$lobjCursoParticipante=new clsGrupoParticipante;
	$lobjBitacora=new clsBitacora;
	$lobjUtil=new clsUtil;


	$idcurso = $_POST['idcurso'];
	$motivo = $_POST['motivo'];
	$fecha = $_POST['fecha'];
	$idresponsable = $_POST['idresponsable'];
	$lobjCursoParticipante->set_Idcurso($idcurso);
	$lobjCursoParticipante->set_IdResponsable($idresponsable);

	$lcReal_ip=$lobjUtil->get_real_ip();
    $ldFecha=date('Y-m-d h:m');
	$operacion=$_POST['operacion'];

	switch ($operacion) 
	{
		case 'inscribir_curso':
			
			$participantes = $_POST['participante_inscribir'];
			for($i=0;$i<count($participantes);$i++)
			{
				$lobjCursoParticipante->set_Idparticipante($participantes[$i]);
				$lobjCursoParticipante->set_Fecha($fecha[$i]);
				$hecho = $lobjCursoParticipante->registrar_inscripcion();
			}

			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Registrar','Cargar datos','*','tcurso_tparticipante','','',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha inscrito exitosamente.';
			}
			else
			{	
				$_SESSION['msj']='Error en la Inscripción';
			}
				header('location: ../vista/intranet.php?vista=inscripcion/listado_cursos_inscribir');
		break;
		case 'desincorporar_curso':
			$participantes = $_POST['participante_desincorporar'];

			for($i=0;$i<count($participantes);$i++)
			{
				$lobjCursoParticipante->set_Idparticipante($participantes[$i]);
				$lobjCursoParticipante->set_Motivo($motivo[$i]);
				$lobjCursoParticipante->set_Fecha($fecha[$i]);
				$hecho = $lobjCursoParticipante->editar_inscripcion();
			}

			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Registrar','Cargar datos','*','tcurso_tparticipante','','',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha desincorporado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='Error en la Desincorporar';
			}
			header('location: ../vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar');

		break;
	}

?>