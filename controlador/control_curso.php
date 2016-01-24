<?php
	session_start();
	require_once("../clases/clase_curso.php");
	require_once("../clases/clase_bitacora.php");
    require_once('../libreria/utilidades.php');
	$lobjCurso=new clsCurso;
	$lobjBitacora=new clsBitacora;
	$lobjUtil=new clsUtil;



	$lobjCurso->set_Curso($_POST['idcurso']);
	$lcReal_ip=$lobjUtil->get_real_ip();
    $ldFecha=date('Y-m-d h:m');
	$operacion=$_POST['operacion'];
	$idlapso = $_POST['idlapso'];
	$lobjCurso->set_Lapso($idlapso);

	switch ($operacion) 
	{
		case 'registrar_curso':
			$grupos = $_POST['grupos'];
			$nombre_cursos 		= $_POST['nombre_curso'];
			$descripcion_cursos 	= $_POST['descripcion_curso'];
			$capacidad_cursos 	= $_POST['capacidad_curso'];
			$asignatura_cursos 	= $_POST['asignatura_curso'];
			$aula_cursos 		= $_POST['aula_curso'];
			$docente_cursos 		= $_POST['docente_curso'];
			for($i=0;$i<count($grupos);$i++)
			{

					$lobjCurso->set_Nombrecur($nombre_cursos[$i]);
					$lobjCurso->set_Descripcioncur($descripcion_cursos[$i]);
					$lobjCurso->set_Capacidadcur($capacidad_cursos[$i]);
					$lobjCurso->set_Asignatura($asignatura_cursos[$i]);
					$lobjCurso->set_Grupo($grupos[$i]);
					$lobjCurso->set_Aula($aula_cursos[$i]);
					$lobjCurso->set_Docente($docente_cursos[$i]);
					$hecho=$lobjCurso->registrar_curso();
			}

			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Registrar','Cargar datos','*','tcurso','','',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha registrado exitosamente.';
			}
			else
			{	
				$_SESSION['msj']='Error en el registro';
			}
	header('location: ../vista/intranet.php?vista=curso/curso');

		break;
		case 'cerrar_curso':

			$hecho=$lobjCurso->cerrar_curso($_POST['idcurso_nuevo']);
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Eliminar',$_POST['razondesactiva'],'estatuscur','tcurso','1','0',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha cerrado el curso exitosamente';
			}
			else
			{	
				$_SESSION['msj']='Error al cerrar el curso';
			}
			header('location: ../vista/intranet.php?vista=curso/curso');
		break;
		case 'consultar_cursos_iguales':
			$laCurso=$lobjCurso->consultar_cursos_iguales();
			if ($laCurso) 
			{
				for ($i=0; $i <count($laCurso); $i++) 
				{ 
					echo '<option value="'.$laCurso[$i][0].'">'.$laCurso[$i][1].'</option>';
				}
			}
			else
				echo '0';
		break;
		case 'consultar_participantes_curso':
			$laparticipante=$lobjCurso->consultar_participantes();
			if ($laparticipante) 
			{
				echo '<option></option>';
				for ($i=0; $i <count($laparticipante); $i++) 
				{ 
                    echo '<option value="'.$laparticipante[$i][8].'">'.$laparticipante[$i][4].' / '.$laparticipante[$i][0].' '.$laparticipante[$i][2].'</option>';
				}
			}
			else
				echo '0';
		break;
		case 'consultar_intrumentos_curso':
			$lainstrumento=$lobjCurso->consultar_instrumentos();
			if ($lainstrumento) 
			{
				echo '<option></option>';
				for ($i=0; $i <count($lainstrumento); $i++) 
				{ 
                    echo '<option value="'.$lainstrumento[$i][0].'">'.$lainstrumento[$i][1].'</option>';
				}
			}
			else
				echo '0';
		break;
		case 'consultar_cursos_lapso':
			$laCurso=$lobjCurso->consultar_cursos_lapso_participante($_POST['idparticipante']);
			if ($laCurso) 
			{
				echo '<option></option>';
				for ($i=0; $i <count($laCurso); $i++) 
				{ 
                    echo '<option value="'.$laCurso[$i][0].'">'.$laCurso[$i][1].'</option>';
				}
			}
			else
				echo '0';
		break;
		default:
			header('location: ../vista/intranet.php?vista=curso/curso');
		break;
	}

?>