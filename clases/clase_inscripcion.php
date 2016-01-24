<?php
	
	require_once('../nucleo/ModeloConect.php');
	class clsInscripcion extends ModeloConect
	{
		private $lnIdinscripcion;
		private $lnIdparticipante;
		private $lcGradoins;
		private $lcSeccionins;
		private $lcFechains;
		private $lcDisponibilidadins;
		private $lcDiasasistenciains;
		private $lcObservacionins;
		private $lcFotoins;
		private $lcPartidanacimientoins;
		private $lcCopiacedulains;
		private $lcInformemedico;
		private $lcEstatusins;
		private $lcRepitienteins;
		private $lcMotivocambioins;
		private $lcResumendiagnosticoins;
		private $lnIdInstitucion;
		private $lnEstudiaActualmente;
		private $lcGradoInstruccion;
		private $lcTurno;
		private $lcDocenteGrado;
		private $lnTelefonoDocenteGrado;
		private $lcDocenteAulaIntegrada;
		private $lnTelefonoDocenteAulaIntegrada;
		private $lcDirectorInstitucion;
		private $lnTelefonoDirectorInstitucion;
		private $lcIngresomensual;
		private $lcOtroingreso;
		private $lcNoingreso;
		private $lcColaborarcaidv;
		private $lcAprenderbraille;
		private $lcTiempo;
		private $lcResponsable;

		function set_Idinscripcion($pcIdinscripcion)
		{
			$this->lnIdinscripcion=$pcIdinscripcion;
		}

		function set_Ingresomensual($pcIngresomensual)
		{
			$this->lcIngresomensual=$pcIngresomensual;
		}

		function set_Otroingreso($pcOtroingreso)
		{
			$this->lcOtroingreso=$pcOtroingreso;
		}

		function set_Noingreso($pcNoingreso)
		{
			$this->lcNoingreso=$pcNoingreso;
		}

		function set_Colaborarcaidv($pcColaborarcaidv)
		{
			$this->lcColaborarcaidv=$pcColaborarcaidv;
		}

		function set_Aprenderbraille($pcAprenderbraille)
		{
			$this->lcAprenderbraille=$pcAprenderbraille;
		}

		function set_Tiempo($pcTiempo)
		{
			$this->lcTiempo=$pcTiempo;
		}

		function set_Turno($pcTurno)
		{
			$this->lcTurno=$pcTurno;
		}

		function set_DocenteGrado($pcDocenteGrado)
		{
			$this->lcDocenteGrado=$pcDocenteGrado;
		}
		function set_Responsable($pcResponsable)
		{
			$this->lcResponsable=$pcResponsable;
		}

		function set_TelefonoDocenteGrado($pcTelefonoDocenteGrado)
		{
			$this->lnTelefonoDocenteGrado=$pcTelefonoDocenteGrado;
		}

		function set_DocenteAulaIntegrada($pcDocenteAulaIntegrada)
		{
			$this->lcDocenteAulaIntegrada=$pcDocenteAulaIntegrada;
		}

		function set_TelefonoDocenteAulaIntegrada($pcTelefonoDocenteAulaIntegrada)
		{
			$this->lnTelefonoDocenteAulaIntegrada=$pcTelefonoDocenteAulaIntegrada;
		}


		function set_DirectorInstitucion($pcDirectorInstitucion)
		{
			$this->lcDirectorInstitucion=$pcDirectorInstitucion;
		}


		function set_TelefonoDirectorInstitucion($pcTelefonoDirectorInstitucion)
		{
			$this->lnTelefonoDirectorInstitucion=$pcTelefonoDirectorInstitucion;
		}

		function set_EstudiaActualmente($pcEstudiaActualmente)
		{
			$this->lnEstudiaActualmente=$pcEstudiaActualmente;
		}

		function set_GradoInstruccion($pcGradoInstruccion)
		{
			$this->lcGradoInstruccion=$pcGradoInstruccion;
		}

		function set_Idparticipante($pcIdparticipante)
		{
			$this->lnIdparticipante=$pcIdparticipante;
		}

		function set_Gradoins($pcGradoins)
		{
			$this->lcGradoins=$pcGradoins;
		}

		function set_Seccionins($pcSeccionins)
		{
			$this->lcSeccionins=$pcSeccionins;
		}

		function set_Fechains($pcFechains)
		{
			$this->lcFechains=$pcFechains;
		}


		function set_Disponibilidadins($pcDisponibilidadins)
		{
			$this->lcDisponibilidadins=$pcDisponibilidadins;
		}

		function set_Diasasistenciains($pcDiasasistenciains)
		{
			$this->lcDiasasistenciains=$pcDiasasistenciains;
		}

		function set_Observacionins($pcObservacionins)
		{
			$this->lcObservacionins=$pcObservacionins;
		}

		function set_Fotoins($pcFotoins)
		{
			$this->lcFotoins=$pcFotoins;
		}

		function set_Partidanacimientoins($pcPartidanacimientoins)
		{
			$this->lcPartidanacimientoins=$pcPartidanacimientoins;
		}

		function set_Copiacedulains($pcCopiacedulains)
		{
			$this->lcCopiacedulains=$pcCopiacedulains;
		}

		function set_Informemedico($pcInformemedico)
		{
			$this->lcInformemedico=$pcInformemedico;
		}

		function set_Estatusins($pcEstatusins)
		{
			$this->lcEstatusins=$pcEstatusins;
		}

		function set_Repitienteins($pcRepitienteins)
		{
			$this->lcRepitienteins=$pcRepitienteins;
		}

		function set_Motivocambioins($pcMotivocambioins)
		{
			$this->lcMotivocambioins=$pcMotivocambioins;
		}

		function set_Resumendiagnosticoins($pcResumendiagnosticoins)
		{
			$this->lcResumendiagnosticoins=$pcResumendiagnosticoins;
		}

		function set_IdInstitucion($pcIdInstitucion)
		{
			$this->lnIdInstitucion=$pcIdInstitucion;
		}

		function consultar_participante_inscripcion()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT *,(YEAR(CURDATE())-YEAR(fechanacimientopar))-(RIGHT(CURDATE(),5)<RIGHT(fechanacimientopar,5))AS edad,date_format(fechanacimientopar,'%d-%m-%Y')as fechanacimientopar FROM tparticipante LEFT JOIN tdiagnostico ON tdiagnostico_iddiagnostico=iddiagnostico LEFT JOIN tinstitucion ON tinstitucion_idinstitucion=idinstitucion WHERE idparticipante='$this->lnIdparticipante'";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[0]=$laRow['idparticipante'];
					$Fila[1]=$laRow['cedulapar'];
					$Fila[2]=$laRow['nombreunopar'];
					$Fila[3]=$laRow['nombredospar'];
					$Fila[4]=$laRow['apellidounopar'];
					$Fila[5]=$laRow['apellidodospar'];
					$Fila[6]=$laRow['sexopar'];
					$Fila[7]=$laRow['telefonopar'];
					$Fila[8]=$laRow['direccionpar'];
					$Fila[9]=$laRow['fechanacimientopar'];
					$Fila[10]=$laRow['numhijopar'];
					$Fila[11]=$laRow['medioviviendapar'];
					$Fila[12]=$laRow['viviendapar'];
					$Fila[13]=$laRow['tipoconstruccionpar'];
					$Fila[14]=($laRow['braillepar']==1)?'SI':'NO';
					$Fila[15]=$laRow['descripciondia'];
					$Fila[16]=($laRow['descripcionins'])?$laRow['descripcionins']:'-';
					$Fila[17]=$laRow['estatuspar'];
					$Fila[18]=$laRow['nacionalidadpar'];
					$Fila[19]=$laRow['etniapar'];
					$Fila[20]=$laRow['edad'];
					$Fila[21]=$laRow['correopar'];
					$Fila[23]=($laRow['numerohermanospar']>=1)?$laRow['numerohermanospar']:'Hijo Único';

					
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_inscripcion()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT *,date_format(fechains,'%d-%m-%Y')as fechains,(SELECT CONCAT_WS(' ',nombreunofam,apellidounofam) FROM tfamiliar WHERE tfamiliar_idresponsable=idfamiliar)as responsable FROM tinscripcion LEFT JOIN tinstitucion ON tinstitucion_idinstitucion=idinstitucion WHERE idparticipante='$this->lnIdparticipante'";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[0]=$laRow['idinscripcion'];
					$Fila[1]=$laRow['idparticipante'];
					$Fila[2]=$laRow['gradoins'];
					$Fila[3]=$laRow['seccionins'];
					$Fila[4]=$laRow['fechains'];
					$Fila[5]=$laRow['disponibilidadins'];
					$Fila[6]=$laRow['diasasistenciains'];
					$Fila[7]=$laRow['observacionins'];
					$Fila[8]=$laRow['fotoins'];
					$Fila[9]=($laRow['partidanacimientoins'])?'SI':'NO';
					$Fila[10]=($laRow['copiacedulains'])?'SI':'NO';
					$Fila[11]=($laRow['informemedico'])?'SI':'NO';
					$Fila[12]=$laRow['estatusins'];
					$Fila[13]=($laRow['repitienteins'])?'SI':'NO';
					$Fila[14]=$laRow['descripcionins'];
					$Fila[15]=$laRow['motivocambioins'];
					$Fila[16]=($laRow['estudia_actualmente'])?'SI':'NO';
					$Fila[17]=$laRow['grado_instruccion'];
					$Fila[18]=$laRow['turno'];
					$Fila[19]=$laRow['docente_grado'];
					$Fila[20]=$laRow['telefono_docente_grado'];
					$Fila[21]=$laRow['docente_aula_integrada'];
					$Fila[22]=$laRow['telefono_docente_aula_integrada'];
					$Fila[23]=$laRow['director_institucion'];
					$Fila[24]=$laRow['telefono_director_institucion'];
					$Fila[25]=$laRow['resumendiagnosticoins'];

					$Fila[26]=$laRow['responsable'];
					$Fila[27]=$laRow['ingresomensual'];
					$Fila[28]=$laRow['otroingreso'];
					$Fila[29]=$laRow['noingreso'];
					$Fila[30]=$laRow['colaborarcaidv'];
					$Fila[31]=($laRow['aprenderbraille'])?'SI':'NO';
					$Fila[32]=$laRow['tiempo'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_participante_familiar()
		{
			$this->conectar();
				$sql="SELECT *,tfamiliar_idfamiliar,apellidounofam,nombreunofam,descripcionpar,(YEAR(CURDATE())-YEAR(fechanacimientofam))-(RIGHT(CURDATE(),5)<RIGHT(fechanacimientofam,5))AS edad,date_format(fechanacimientofam,'%d-%m-%Y')as fechanacimientofam,descripciondia FROM participante_familiar,tfamiliar,tparentesco,tdiagnostico WHERE tparticipante_idparticipante='$this->lnIdparticipante' AND tfamiliar_idfamiliar=idfamiliar AND participante_familiar.idparentesco=tparentesco.idparentesco AND tdiagnostico_iddiagnostico=iddiagnostico";
				$pcsql=$this->filtro($sql);
				$cont=0;
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont]['idfamiliar']=number_format($laRow['tfamiliar_idfamiliar'],0,'','.');
					$Fila[$cont]['nombrefam']=$laRow['apellidounofam'].' '.$laRow['nombreunofam'];
					$Fila[$cont]['descripcionpar']=$laRow['descripcionpar'];
					$Fila[$cont]['representante']=$laRow['representante'];
					$Fila[$cont]['fechanacimientofam']=$laRow['fechanacimientofam'];
					$Fila[$cont]['edad']=$laRow['edad'];
					$Fila[$cont]['gradoinstrucfam']=$laRow['gradoinstrucfam'];
					$Fila[$cont]['ocupacionfam']=$laRow['ocupacionfam'];
					$Fila[$cont]['numhijofam']=$laRow['numhijofam'];
					$Fila[$cont]['descripciondia']=$laRow['descripciondia'];
					$Fila[$cont]['direccionfam']=$laRow['direccionfam'];
					$Fila[$cont]['telefonofam']=$laRow['telefonofam'];
					$Fila[$cont]['ingresofam']=$laRow['ingresofam'];
					$cont++;
				}
			$this->desconectar();
			return $Fila;
		}

		function consultar_familiar_participante($idfamiliar)
		{
			$this->conectar();
				$sql="SELECT *,tfamiliar_idfamiliar,apellidounopar,nombreunopar,descripcionpar
				FROM participante_familiar,tparticipante,tparentesco 
				WHERE tfamiliar_idfamiliar='$idfamiliar' 
				AND idparticipante=tparticipante_idparticipante 
				AND participante_familiar.idparentesco=tparentesco.idparentesco";
				$pcsql=$this->filtro($sql);
				$cont=0;
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont]['idfamiliar']=$laRow['tfamiliar_idfamiliar'];
					$Fila[$cont]['cedulapar']=$laRow['cedulapar'];
					$Fila[$cont]['nombrepar']=$laRow['apellidounopar'].' '.$laRow['nombreunopar'];
					$Fila[$cont]['descripcionpar']=$laRow['descripcionpar'];
					$cont++;
				}
			$this->desconectar();
			return $Fila;
		}

		function consultar_inscripciones()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT * FROM `tinscripcion` WHERE estatuspar=1";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['idinscripcion'];
					$Fila[$cont][1]=$laRow['cedulapar'];
					$Fila[$cont][2]=$laRow['nombreunopar'];
					$Fila[$cont][3]=$laRow['nombredospar'];
					$Fila[$cont][4]=$laRow['apellidounopar'];
					$Fila[$cont][5]=$laRow['apellidodospar'];
					$Fila[$cont][6]=$laRow['sexopar'];
					$Fila[$cont][7]=$laRow['telefonopar'];
					$Fila[$cont][8]=$laRow['direccionpar'];
					$Fila[$cont][9]=$laRow['fechanacimientopar'];
					$Fila[$cont][10]=$laRow['numhijopar'];
					$Fila[$cont][11]=$laRow['medioviviendapar'];
					$Fila[$cont][12]=$laRow['viviendapar'];
					$Fila[$cont][13]=$laRow['tipoconstruccionpar'];
					$Fila[$cont][14]=$laRow['braillepar'];
					$Fila[$cont][15]=$laRow['tdiagnostico_iddiagnostico'];
					$Fila[$cont][16]=$laRow['tinstitucion_idinstitucion'];
					$Fila[$cont][17]=$laRow['estatuspar'];
					
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_inscripcion_bitacora()
		{
			$this->conectar();
				$sql="SELECT *,date_format(fechains,'%d-%m-%Y')as fechains FROM `tinscripcion` WHERE idparticipante='$this->lnIdparticipante'";
				$pcsql=$this->filtro($sql);
				if($laRow=$this->proximo($pcsql))
				{
					foreach ($laRow as $key => $value)
					{
						$Fila[$key]=$value;
					}
				}
			$this->desconectar();
			return $Fila;
		}

		function registrar_inscripcion()
		{
			$this->conectar();
			$sql="INSERT INTO `tinscripcion`( `idparticipante`, `gradoins`, `seccionins`, `fechains`, `disponibilidadins`, `diasasistenciains`, `observacionins`, `fotoins`, `partidanacimientoins`, `copiacedulains`, `informemedico`, `estatusins`, `repitienteins`, `tinstitucion_idinstitucion`, `motivocambioins`, `resumendiagnosticoins`,estudia_actualmente,grado_instruccion,turno,docente_grado,telefono_docente_grado,docente_aula_integrada,telefono_docente_aula_integrada,director_institucion,telefono_director_institucion,ingresomensual,otroingreso,noingreso,colaborarcaidv,aprenderbraille,tiempo,tfamiliar_idresponsable) VALUES ('$this->lnIdparticipante',UPPER('$this->lcGradoins'),UPPER('$this->lcSeccionins'),CURDATE(),UPPER('$this->lcDisponibilidadins'),UPPER('$this->lcDiasasistenciains'),UPPER('$this->lcObservacionins'),'$this->lcFotoins','$this->lcPartidanacimientoins','$this->lcCopiacedulains','$this->lcInformemedico','1','$this->lcRepitienteins','$this->lnIdInstitucion',UPPER('$this->lcMotivocambioins'),UPPER('$this->lcResumendiagnosticoins'),'$this->lnEstudiaActualmente',UPPER('$this->lcGradoInstruccion'),UPPER('$this->lcTurno'),UPPER('$this->lcDocenteGrado'),'$this->lnTelefonoDocenteGrado',UPPER('$this->lcDocenteAulaIntegrada'),'$this->lnTelefonoDocenteAulaIntegrada',UPPER('$this->lcDirectorInstitucion'),'$this->lnTelefonoDirectorInstitucion','$this->lcIngresomensual','$this->lcOtroingreso','$this->lcNoingreso','$this->lcColaborarcaidv','$this->lcAprenderbraille','$this->lcTiempo','$this->lcResponsable')";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function editar_inscripcion()
		{
			$this->conectar();
			$sql="UPDATE `tinscripcion` SET `gradoins`=UPPER('$this->lcGradoins'),`seccionins`=UPPER('$this->lcSeccionins'),`disponibilidadins`=UPPER('$this->lcDisponibilidadins'),`diasasistenciains`=UPPER('$this->lcDiasasistenciains'),`observacionins`=UPPER('$this->lcObservacionins'),`fotoins`='$this->lcFotoins',`partidanacimientoins`='$this->lcPartidanacimientoins',`copiacedulains`='$this->lcCopiacedulains',`informemedico`='$this->lcInformemedico',`repitienteins`='$this->lcRepitienteins',`tinstitucion_idinstitucion`='$this->lnIdInstitucion',`motivocambioins`=UPPER('$this->lcMotivocambioins'),`resumendiagnosticoins`=UPPER('$this->lcResumendiagnosticoins'),estudia_actualmente='$this->lnEstudiaActualmente',grado_instruccion=UPPER('$this->lcGradoInstruccion'),turno=UPPER('$this->lcTurno'),docente_grado=UPPER('$this->lcDocenteGrado'),telefono_docente_grado='$this->lnTelefonoDocenteGrado',docente_aula_integrada=UPPER('$this->lcDocenteAulaIntegrada'),telefono_docente_aula_integrada='$this->lnTelefonoDocenteAulaIntegrada',director_institucion=UPPER('$this->lcDirectorInstitucion'),telefono_director_institucion='$this->lnTelefonoDirectorInstitucion',ingresomensual='$this->lcIngresomensual',otroingreso='$this->lcOtroingreso',noingreso='$this->lcNoingreso',colaborarcaidv='$this->lcColaborarcaidv',aprenderbraille='$this->lcAprenderbraille',tiempo='$this->lcTiempo',tfamiliar_idresponsable='$this->lcResponsable' WHERE idparticipante='$this->lnIdparticipante'";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function eliminar_inscripcion()
		{
			$this->conectar();
			$sql="UPDATE tinscripcion SET estatusins='0' WHERE idparticipante='$this->lnIdparticipante' ";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function restaurar_inscripcion()
		{
			$this->conectar();
			$sql="UPDATE tinscripcion SET estatusins='1' WHERE idparticipante='$this->lnIdparticipante' ";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function inscribir_curso($idcurso,$idparticipante,$fecha,$responsable)
		{
			$this->conectar();
			$fecha=$this->fecha_bd($fecha);
			$sql="INSERT INTO `tcurso_tparticipante`(`tcurso_idcurso`, `tparticipante_idparticipante`,fecha_inscripcion,idresponsable_ing) VALUES ('$idcurso','$idparticipante','$fecha','$responsable')";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function desincorporar_curso($idcurso,$idparticipante)
		{
			$this->conectar();
			$sql="UPDATE `tcurso_tparticipante` SET estatus='2' WHERE tcurso_idcurso='$idcurso' AND tparticipante_idparticipante='$idparticipante'";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}
	}
?>