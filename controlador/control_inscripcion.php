<?php
	session_start();
	require_once("../clases/clase_participante.php");
	require_once("../clases/clase_familiar.php");
	require_once("../clases/clase_inscripcion.php");
	require_once("../clases/clase_bitacora.php");
    require_once('../libreria/utilidades.php');
	$lobjParticipante=new clsParticipante;
	$lobjInscripcion=new clsInscripcion;
	$lobjFamiliar=new clsFamiliar;
	$lobjBitacora=new clsBitacora;
	$lobjUtil=new clsUtil;

	$lobjParticipante->set_Idparticipante($_POST['idparticipante']);
	$lobjParticipante->set_Cedulapar($_POST['cedulapar']);
	$lobjParticipante->set_Nombreunopar($_POST['nombreunopar']);
	$lobjParticipante->set_Nacionalidadpar($_POST['nacionalidadpar']);

	$lobjParticipante->set_Etniapar($_POST['etniapar']);
	$lobjParticipante->set_Nombredospar($_POST['nombredospar']);
	$lobjParticipante->set_Apellidounopar($_POST['apellidounopar']);
	$lobjParticipante->set_Apellidodospar($_POST['apellidodospar']);
	$lobjParticipante->set_Sexopar($_POST['sexopar']);
	$lobjParticipante->set_Telefonopar($_POST['telefonopar']);
	$lobjParticipante->set_Correopar($_POST['correopar']);
	$lobjParticipante->set_Lugarnacimiento($_POST['tlocalidad_idlugarnacimiento']);
	$lobjParticipante->set_Fechanacimientopar($_POST['fechanacimientopar']);
	$lobjParticipante->set_Direccionpar($_POST['direccionpar']);
	$lobjParticipante->set_Numhijopar($_POST['numhijopar']);
	$lobjParticipante->set_Numerohermanospar($_POST['numerohermanospar']);	
	$lobjParticipante->set_Viviendapar($_POST['viviendapar']);
	$lobjParticipante->set_Medioviviendapar($_POST['medioviviendapar']);
	$lobjParticipante->set_Tipoconstruccionpar($_POST['tipoconstruccionpar']);
	$lobjParticipante->set_Braillepar($_POST['braillepar']);
	$lobjParticipante->set_Estatuspar($_POST['estatuspar']);
	$lobjParticipante->set_IdDiagnostico($_POST['tdiagnostico_iddiagnostico']);
	$lobjParticipante->set_IdLocalidad($_POST['tlocalidad_idlocalidad']);
	$lobjParticipante->set_IdInstitucion($_POST['tinstitucion_idinstitucion']);

	$lobjInscripcion->set_Idparticipante($_POST['idparticipante']);
	$lobjInscripcion->set_Idinscripcion($_POST['idinscripcion']);
	$lobjInscripcion->set_Gradoins($_POST['gradoins']);
	$lobjInscripcion->set_Seccionins($_POST['seccionins']);
	$lobjInscripcion->set_Disponibilidadins($_POST['disponibilidadins']);
	$lobjInscripcion->set_Observacionins($_POST['observacionins']);
	$lobjInscripcion->set_Partidanacimientoins($_POST['partidanacimientoins']);
	$lobjInscripcion->set_Copiacedulains($_POST['copiacedulains']);
	$lobjInscripcion->set_Informemedico($_POST['informemedico']);
	$lobjInscripcion->set_Repitienteins($_POST['repitienteins']);
	$lobjInscripcion->set_Motivocambioins($_POST['motivocambioins']);
	$lobjInscripcion->set_Resumendiagnosticoins($_POST['resumendiagnosticoins']);
	$lobjInscripcion->set_Estatusins($_POST['estatusins']);
	$lobjInscripcion->set_IdInstitucion($_POST['idinstitucion']);
	$lobjInscripcion->set_EstudiaActualmente($_POST['estudia_actualmente']);
	$lobjInscripcion->set_GradoInstruccion($_POST['grado_instruccion']);
	$lobjInscripcion->set_Turno($_POST['turno']);
	$lobjInscripcion->set_DocenteGrado($_POST['docente_grado']);
	$lobjInscripcion->set_TelefonoDocenteGrado($_POST['telefono_docente_grado']);
	$lobjInscripcion->set_DocenteAulaIntegrada($_POST['docente_aula_integrada']);
	$lobjInscripcion->set_TelefonoDocenteAulaIntegrada($_POST['telefono_docente_aula_integrada']);
	$lobjInscripcion->set_DirectorInstitucion($_POST['director_institucion']);
	$lobjInscripcion->set_TelefonoDirectorInstitucion($_POST['telefono_director_institucion']);

	$lobjInscripcion->set_Ingresomensual($_POST['ingresomensual']);
	$lobjInscripcion->set_Otroingreso($_POST['otroingreso']);
	$lobjInscripcion->set_Noingreso($_POST['noingreso']);
	$lobjInscripcion->set_Colaborarcaidv($_POST['colaborarcaidv']);
	$lobjInscripcion->set_Aprenderbraille($_POST['aprenderbraille']);
	$lobjInscripcion->set_Tiempo($_POST['tiempo']);

	$lobjFamiliar->set_Participante($_POST['idparticipante']);

	$lcReal_ip=$lobjUtil->get_real_ip();
    $ldFecha=date('Y-m-d h:m');
	$operacion=$_POST['operacion'];

	switch ($operacion) 
	{
		case 'verificar':
			if($lobjParticipante->verificar())
			{
				echo '1';
			}
				
		break;
		case 'registrar_inscripcion':
			$hecho=$lobjParticipante->registrar_participante();
			if($hecho)
			{
				$row_participante=$lobjParticipante->consultar_participante_ultimo();
				$idparticipante=$row_participante[0];
				$lobjInscripcion->set_Idparticipante($idparticipante);
				$ladiasasistencia=$_POST['diasasistenciains'];
				for ($i=0; $i <count($ladiasasistencia); $i++)
				{
					$diasasistencia.=$ladiasasistencia[$i].',';
				}
				$diasasistencia = substr($diasasistencia, 0, -1);

				$lobjInscripcion->set_Diasasistenciains($diasasistencia);

				$lobjFamiliar->set_Participante($idparticipante);

				$hecho=$lobjInscripcion->registrar_inscripcion();
				if($hecho)
				{
					$cedulafam=$_POST['cedulafam'];
					$parentescofam=$_POST['parentescofam'];
					$representantefam=$_POST['representantefam'];
					for ($i=0; $i <count($cedulafam); $i++) 
					{
						$lobjFamiliar->set_Familiar($cedulafam[$i]);
						$lobjFamiliar->set_Parentesco($parentescofam[$i]);
						$representante=0;
						if($representantefam[0]==$cedulafam[$i])
						{
							$representante=1;
						}
						$lobjFamiliar->set_Representante($representante);

						$hecho=$lobjFamiliar->registrar_participante_familiar();						
					}
					if($hecho)
					{
						$target_path = "../media/img/participantes/";
						$arrayextension=explode('/', $_FILES['fotoins']['type']);
						$extension=$arrayextension[1];
						$target_path = $target_path .$_POST['cedulapar'].'.'.$extension; 
						$lobjInscripcion->set_Fotoins($_POST['cedulapar'].'.'.$extension);
						move_uploaded_file($_FILES['fotoins']['tmp_name'], $target_path);

						$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Registrar','Cargar datos','*','tinscripcion','','',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
		   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
						$_SESSION['msj']='Se ha registrado exitosamente.';
					}
					else
					{	
						$_SESSION['msj']='Error en el registro';
					}
				}
				else
				{	
					$_SESSION['msj']='Error en el registro';
				}
			}
			else
			{	
				$_SESSION['msj']='Error en el registro';
			}
			header('location: ../vista/intranet.php?vista=persona/participante');
			
		break;
		case 'editar_inscripcion':
		$ladiasasistencia=$_POST['diasasistenciains'];
				for ($i=0; $i <count($ladiasasistencia); $i++)
				{
					$diasasistencia.=$ladiasasistencia[$i].',';
				}
				$diasasistencia = substr($diasasistencia, 0, -1);

				$lobjInscripcion->set_Diasasistenciains($diasasistencia);

			$laParticipanteAnterior = $lobjParticipante->consultar_participante_bitacora();
			$laInscripcionAnterior = $lobjInscripcion->consultar_inscripcion_bitacora();
			$laFamiliarAnterior = $lobjFamiliar->consultar_familiar_bitacora();

			$laValorNuevo=$laValorAnterior=$laCampo=array();

			

			if($_FILES['fotoins']['tmp_name'])
			{
				$target_path = "../media/img/participantes/";
				$arrayextension=explode('/', $_FILES['fotoins']['type']);
				$extension=$arrayextension[1];
				$target_path = $target_path .$_POST['cedulapar'].'.'.$extension; 
				$lobjInscripcion->set_Fotoins($_POST['cedulapar'].'.'.$extension);
				move_uploaded_file($_FILES['fotoins']['tmp_name'], $target_path);
			}
			else
			{
				$lobjInscripcion->set_Fotoins($_POST['fotoins2']);
			}
			$hecho=$lobjParticipante->editar_participante();
			$hecho=$lobjFamiliar->suprimir_participante_familiar();
			
			$cedulafam=$_POST['cedulafam'];
			$parentescofam=$_POST['parentescofam'];
			$representantefam=$_POST['representantefam'];
			for ($i=0; $i <count($cedulafam); $i++) 
			{
				$lobjFamiliar->set_Familiar($cedulafam[$i]);
				$lobjFamiliar->set_Parentesco($parentescofam[$i]);
				$representante=0;
				if($representantefam[0]==$cedulafam[$i])
				{
					$representante=1;
					$idresponsable=$cedulafam[$i];
				}
				$lobjFamiliar->set_Representante($representante);
				$lobjInscripcion->set_Responsable($idresponsable);

				$hecho=$lobjFamiliar->registrar_participante_familiar();
			}
			$hecho=$lobjInscripcion->editar_inscripcion();			
			if($hecho)
			{
				$cont=0;
				foreach ($laParticipanteAnterior as $key2 => $value2) 
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
				foreach ($laInscripcionAnterior as $key2 => $value2) 
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
				foreach ($laFamiliarAnterior as $key2 => $value2) 
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
					$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Modificar','Error en los datos',$laCampo[$i],'tinscripcion',$laValorAnterior[$i],$laValorNuevo[$i],$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
					$lnHecho=$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
					if($lnHecho)
					{
						$_SESSION['msj']='Se ha modificado exitosamente';
					}
					else
					{	
						$_SESSION['msj']='No se realizarón cambios';
					}
				}
				$_SESSION['msj']='Se ha modificado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='No se realizarón cambios';
			}
			header('location: ../vista/intranet.php?vista=persona/participante');
		break;
		case 'eliminar_participante':
			$hecho=$lobjFamiliar->eliminar_participante_familiar();
			$hecho=$lobjParticipante->eliminar_participante();
			$hecho=$lobjInscripcion->eliminar_inscripcion();

			if($hecho)
			{
				$_SESSION['msj']='Se ha eliminado exitosamente';

				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Eliminar','No sé utiliza','estatus','participante_familiar','1','0',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
   				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Eliminar','No sé utiliza','estatuspar','tparticipante','1','0',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
   				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Eliminar','No sé utiliza','estatusins','tinscripcion','1','0',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
			}
			else
			{	
				$_SESSION['msj']='Error al eliminar';
			}
			header('location: ../vista/intranet.php?vista=persona/participante');
		break;
		case 'restaurar_participante':
			$hecho=$lobjFamiliar->restaurar_participante_familiar();
			$hecho=$lobjParticipante->restaurar_participante();
			$hecho=$lobjInscripcion->restaurar_inscripcion();

			if($hecho)
			{
				$_SESSION['msj']='Se ha restaurado exitosamente';
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Restaurar','No sé utiliza','estatus','participante_familiar','1','0',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
   				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Restaurar','No sé utiliza','estatuspar','tparticipante','1','0',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
   				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Restaurar','No sé utiliza','estatusins','tinscripcion','1','0',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.

			}
			else
			{	
				$_SESSION['msj']='No se pudo restaurar';
			}
			header('location: ../vista/intranet.php?vista=persona/participante');
		break;
		case 'inscripcion_individual':
			$laCurso=$_POST['idcurso'];
			$fecha=$_POST['fecha'];
			for($i=0;$i<count($laCurso);$i++)
			{
				$hecho=$lobjInscripcion->inscribir_curso($laCurso[$i],$_POST['idparticipante'],$fecha[$i],$_POST['idresponsable']);
			}
			if($hecho)
			{
				$_SESSION['msj']='Se ha inscrito al participante con exito en el/los curso/s.';
			}
			else
			{	
				$_SESSION['msj']='Error al inscribir al participante.';
			}
			header('location: ../vista/intranet.php?vista=inscripcion/listado_participantes_inscribir');
		break;
		case 'desincorporar_participante':
			$laCurso=$_POST['idcurso'];
			foreach($laCurso as $idcurso)
			{
				$hecho=$lobjInscripcion->desincorporar_curso($idcurso,$_POST['idparticipante']);
			}
			if($hecho)
			{
				$_SESSION['msj']='Se ha desincorporado al participante con exito de el/los curso/s.';
			}
			else
			{	
				$_SESSION['msj']='Error al desincorporar al participante.';
			}
			header('location: ../vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar');
		break;
	}

?>