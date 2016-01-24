<?php
	
	require_once('../nucleo/ModeloConect.php');
	class clsParticipante extends ModeloConect
	{
		private $lnIdparticipante;
		private $lnCedulapar;
		private $lcNombreunopar;
		private $lcNacionalidadpar;
		private $lcEtniapar;
		private $lcNombredospar;
		private $lcApellidounopar;
		private $lcApellidodospar;
		private $lcFechanacimientopar;
		private $lnTelefonopar;
		private $lcSexopar;
		private $lcDireccionpar;
		private $lnNumhijopar;
		private $lcViviendapar;
		private $lcMedioviviendapar;
		private $lcTipoconstruccionpar;
		private $lnBraillepar;
		private $lnIdDiagnostico;
		private $lnIdLocalidad;
		private $lnIdInstitución;
		private $lcEstatuspar;
		private $lcNumerohermanospar;
		private $lcCorreopar;
		private $lnLugarnacimiento;

		function set_Idparticipante($pcIdparticipante)
		{
			$this->lnIdparticipante=$pcIdparticipante;
		}
		function set_Correopar($pcCorreopar)
		{
			$this->lcCorreopar=$pcCorreopar;
		}

		function set_Lugarnacimiento($pcLugarnacimiento)
		{
			$this->lnLugarnacimiento=$pcLugarnacimiento;
		}

		function set_Numerohermanospar($pcNumerohermanospar)
		{
			$this->lcNumerohermanospar=$pcNumerohermanospar;
		}

		function set_Cedulapar($pcCedulapar)
		{
			$this->lnCedulapar=$pcCedulapar;
		}

		function set_Nombreunopar($pcNombreunopar)
		{
			$this->lcNombreunopar=$pcNombreunopar;
		}

		function set_Nacionalidadpar($pcNacionalidadpar)
		{
			$this->lcNacionalidadpar=$pcNacionalidadpar;
		}

		function set_Etniapar($pcEtniapar)
		{
			$this->lcEtniapar=$pcEtniapar;
		}

		function set_Nombredospar($pcNombredospar)
		{
			$this->lcNombredospar=$pcNombredospar;
		}


		function set_Apellidounopar($pcApellidounopar)
		{
			$this->lcApellidounopar=$pcApellidounopar;
		}

		function set_Apellidodospar($pcApellidodospar)
		{
			$this->lcApellidodospar=$pcApellidodospar;
		}

		function set_Sexopar($pcSexopar)
		{
			$this->lcSexopar=$pcSexopar;
		}

		function set_Fechanacimientopar($pcFechanacimientopar)
		{
			$this->lcFechanacimientopar=$this->fecha_nacimiento($pcFechanacimientopar);
		}

		function set_Telefonopar($pcTelefonopar)
		{
			$this->lnTelefonopar=$pcTelefonopar;
		}

		function set_Direccionpar($pcDireccionpar)
		{
			$this->lcDireccionpar=$pcDireccionpar;
		}

		function set_Numhijopar($pcNumhijopar)
		{
			$this->lnNumhijopar=$pcNumhijopar;
		}

		function set_Viviendapar($pcViviendapar)
		{
			$this->lcViviendapar=$pcViviendapar;
		}

		function set_Medioviviendapar($pcMedioviviendapar)
		{
			$this->lcMedioviviendapar=$pcMedioviviendapar;
		}

		function set_Tipoconstruccionpar($pcTipoconstruccionpar)
		{
			$this->lcTipoconstruccionpar=$pcTipoconstruccionpar;
		}

		function set_Braillepar($pcBraillepar)
		{
			$this->lnBraillepar=$pcBraillepar;
		}

		function set_IdDiagnostico($pcIdDiagnostico)
		{
			$this->lnIdDiagnostico=$pcIdDiagnostico;
		}
		function set_IdLocalidad($pcIdLocalidad)
		{
			$this->lnIdLocalidad=$pcIdLocalidad;
		}

		function set_IdInstitucion($pcIdInstitucion)
		{
			$this->lnIdInstitucion=$pcIdInstitucion;
		}

		function set_Estatuspar($pcEstatuspar)
		{
			$this->lcEstatuspar=$pcEstatuspar;
		}

		function verificar()
		{
			$this->conectar();
			$sql="SELECT cedulapar FROM `tparticipante` WHERE cedulapar='$this->lnCedulapar'";
			$pcsql=$this->filtro($sql);
			if($laRow=$this->proximo($pcsql))
			{
				$Fila[0]=$laRow['idparticipante'];
			}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_participante_ultimo()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT idparticipante FROM `tparticipante` ORDER BY idparticipante DESC LIMIT 1";
				$pcsql=$this->filtro($sql);
				if($laRow=$this->proximo($pcsql))
				{
					$Fila[0]=$laRow['idparticipante'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_participante()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT *,date_format(fechanacimientopar,'%d-%m-%Y')as fechanacimientopar FROM `tparticipante` WHERE idparticipante='$this->lnIdparticipante' OR idparticipante='$this->lnCedulapar'";
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
					$Fila[14]=$laRow['braillepar'];
					$Fila[15]=$laRow['tdiagnostico_iddiagnostico'];
					$Fila[16]=$laRow['tinstitucion_idinstitucion'];
					$Fila[17]=$laRow['estatuspar'];
					$Fila[18]=$laRow['tlocalidad_idlocalidad'];
					$Fila[19]=$laRow['etniapar'];
					$Fila[20]=$laRow['nacionalidadpar'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}



		function consultar_participantes()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT *,(YEAR(CURDATE())-YEAR(fechanacimientopar))-(RIGHT(CURDATE(),5)<RIGHT(fechanacimientopar,5))AS edad FROM `tparticipante`";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['idparticipante'];
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
					$Fila[$cont][18]=$laRow['tlocalidad_idlocalidad'];
					$Fila[$cont][19]=$laRow['etniapar'];
					$Fila[$cont][20]=$laRow['nacionalidadpar'];
					$Fila[$cont][21]=$laRow['edad'];
					
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function participantes_inscritos()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT *,tparticipante.idparticipante,(YEAR(CURDATE())-YEAR(fechanacimientopar))-(RIGHT(CURDATE(),5)<RIGHT(fechanacimientopar,5))AS edad,COUNT(*) as cantidad_cursos,fotoins FROM `tcurso_tparticipante`,tparticipante,tcurso,tinscripcion WHERE tparticipante.idparticipante=tinscripcion.idparticipante AND tparticipante_idparticipante=tparticipante.idparticipante AND idcurso=tcurso_idcurso AND estatus='1' AND estatuscur='1' GROUP BY tparticipante.idparticipante";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['idparticipante'];
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
					$Fila[$cont][18]=$laRow['edad'];
					$Fila[$cont][19]=$laRow['cantidad_cursos'];
					$Fila[$cont][20]=$laRow['etniapar'];

					$Fila[$cont][21]=$laRow['nacionalidadpar'];
					$Fila[$cont][22]=$laRow['fotoins'];
					
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_participante_bitacora()
		{
			$this->conectar();
				$sql="SELECT *,date_format(fechanacimientopar,'%d-%m-%Y')as fechanacimientopar FROM `tparticipante` WHERE idparticipante='$this->lnIdparticipante'";
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

		function registrar_participante()
		{
			$this->conectar();
			$sql="INSERT INTO `tparticipante`
			(nacionalidadpar, etniapar, `cedulapar`, `nombreunopar`, `nombredospar`, `apellidounopar`, `apellidodospar`, `sexopar`
				, `telefonopar`, `direccionpar`, `fechanacimientopar`, `numhijopar`, `medioviviendapar`
				, `viviendapar`, `tipoconstruccionpar`, `braillepar`, `tdiagnostico_iddiagnostico`
				, `tinstitucion_idinstitucion`,tlocalidad_idlocalidad,numerohermanospar,correopar,tlocalidad_idlugarnacimiento) VALUES
				 ('$this->lcNacionalidadpar', '$this->lcEtniapar',	'$this->lnCedulapar',UPPER('$this->lcNombreunopar'),UPPER('$this->lcNombredospar')
				 	,UPPER('$this->lcApellidounopar'),UPPER('$this->lcApellidodospar'),UPPER('$this->lcSexopar')
				 	,'$this->lnTelefonopar',UPPER('$this->lcDireccionpar'),'$this->lcFechanacimientopar'
				 	,'$this->lnNumhijopar','$this->lcMedioviviendapar',UPPER('$this->lcViviendapar')
				 	,'$this->lcTipoconstruccionpar','$this->lnBraillepar','$this->lnIdDiagnostico'
				 	,'$this->lnIdInstitucion','$this->lnIdLocalidad','$this->lcNumerohermanospar','$this->lcCorreopar','$this->lnLugarnacimiento')";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function editar_participante()
		{
			$this->conectar();
			$sql="UPDATE `tparticipante` 
				SET nacionalidadpar='$this->lcNacionalidadpar' ,numerohermanospar='$this->lcNumerohermanospar',correopar='$this->lcCorreopar',tlocalidad_idlugarnacimiento='$this->lnLugarnacimiento', etniapar='$this->lcEtniapar', `cedulapar`='$this->lnCedulapar',`nombreunopar`=UPPER('$this->lcNombreunopar'),`nombredospar`=UPPER('$this->lcNombredospar'),`apellidounopar`=UPPER('$this->lcApellidounopar'),`apellidodospar`=UPPER('$this->lcApellidodospar'),`sexopar`='$this->lcSexopar',`telefonopar`='$this->lnTelefonopar',`direccionpar`=UPPER('$this->lcDireccionpar'),`fechanacimientopar`='$this->lcFechanacimientopar',`numhijopar`='$this->lnNumhijopar',`medioviviendapar`='$this->lcMedioviviendapar',`viviendapar`='$this->lcViviendapar',`tipoconstruccionpar`='$this->lcTipoconstruccionpar',`braillepar`='$this->lnBraillepar',`tdiagnostico_iddiagnostico`='$this->lnIdDiagnostico',`tinstitucion_idinstitucion`='$this->lnIdInstitucion',tlocalidad_idlocalidad='$this->lnIdLocalidad' WHERE idparticipante='$this->lnIdparticipante'";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function eliminar_participante()
		{
			$this->conectar();
			$sql="UPDATE tparticipante SET estatuspar='0' WHERE idparticipante='$this->lnIdparticipante' ";
			$lnHecho=$this->ejecutar($sql);
			$this->desconectar();
			return $lnHecho;
		}

		function restaurar_participante()
		{
			$this->conectar();
			$sql="UPDATE tparticipante SET estatuspar='1' WHERE idparticipante='$this->lnIdparticipante' ";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		protected function fecha_nacimiento($pcFecha)
		  {
		  	 $lcNow=date("Y-m-d");
		  	 if (strlen($pcFecha)==10)
		  	 {
		  	 	$lcDia=substr($pcFecha,0,2);
		  	 	$lcMes=substr($pcFecha,3,2);
		  	 	$lcAno=substr($pcFecha,6,4);
		  	 	$lcNow=$lcAno."-".$lcMes."-".$lcDia;
		  	 }
		  	 return $lcNow;
		  }

		  function participantes_candidatos()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT *,fotoins,(YEAR(CURDATE())-YEAR(fechanacimientopar))-(RIGHT(CURDATE(),5)<RIGHT(fechanacimientopar,5))AS edad,(SELECT nombregru FROM tgrupo WHERE edad>=edadmin AND edad<=edadmax LIMIT 1)as nombregru FROM tparticipante,tinscripcion,tgrupo WHERE 
				tparticipante.idparticipante=tinscripcion.idparticipante 
				AND estatuspar=1 
				AND EXISTS(SELECT idcurso FROM tcurso, tgrupo WHERE idgrupo = tgrupo_idgrupo AND estatuscur='1'
				AND (YEAR(CURDATE())-YEAR(fechanacimientopar))-(RIGHT(CURDATE(),5)<RIGHT(fechanacimientopar,5))>=edadmin 
				AND (YEAR(CURDATE())-YEAR(fechanacimientopar))-(RIGHT(CURDATE(),5)<RIGHT(fechanacimientopar,5))<=edadmax 
				AND idcurso NOT IN(SELECT tcurso_idcurso FROM tcurso_tparticipante WHERE tparticipante_idparticipante=tparticipante.idparticipante AND estatus='1')) GROUP BY tparticipante.idparticipante";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['idparticipante'];
					$Fila[$cont][1]=$laRow['cedulapar'];
					$Fila[$cont][2]=$laRow['nombreunopar'];
					$Fila[$cont][3]=$laRow['nombredospar'];
					$Fila[$cont][4]=$laRow['apellidounopar'];
					$Fila[$cont][5]=$laRow['apellidodospar'];
					$Fila[$cont][6]=$laRow['sexopar'];
					$Fila[$cont][7]=$laRow['telefonopar'];
					$Fila[$cont][8]=$laRow['direccionpar'];
					$Fila[$cont][9]=$laRow['fechanacimientopar'];
					$Fila[$cont][10]=$laRow['estatuspar'];
					$Fila[$cont][11]=$laRow['edad'];
					$Fila[$cont][12]=$laRow['nombregru'];
					$Fila[$cont][13]=$laRow['fotoins'];
					
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function listado_participantes_etnia()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT *,(YEAR(CURDATE())-YEAR(fechanacimientopar))-(RIGHT(CURDATE(),5)<RIGHT(fechanacimientopar,5))AS edad,(SELECT nombregru FROM tgrupo WHERE edad>=edadmin AND edad<=edadmax)as nombregru FROM `tparticipante` WHERE etniapar='1'";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['idparticipante'];
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
					$Fila[$cont][18]=$laRow['tlocalidad_idlocalidad'];
					$Fila[$cont][19]=$laRow['etniapar'];
					$Fila[$cont][20]=$laRow['nacionalidadpar'];
					$Fila[$cont][21]=$laRow['edad'];
					$Fila[$cont][22]=$laRow['nombregru'];
					
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function listado_participantes_huerfanos()
		{
			$this->conectar();
			$cont=0;
			$sql="SELECT *,(YEAR(CURDATE())-YEAR(fechanacimientopar))-(RIGHT(CURDATE(),5)<RIGHT(fechanacimientopar,5))AS edad,(SELECT nombregru FROM tgrupo WHERE edad>=edadmin AND edad<=edadmax LIMIT 1)as nombregru FROM `tparticipante` WHERE idparticipante NOT IN(SELECT tparticipante_idparticipante FROM participante_familiar,tparentesco WHERE participante_familiar.idparentesco=tparentesco.idparentesco AND (descripcionpar='MADRE' OR descripcionpar='PADRE') GROUP BY tparticipante_idparticipante)";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['idparticipante'];
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
					$Fila[$cont][18]=$laRow['tlocalidad_idlocalidad'];
					$Fila[$cont][19]=$laRow['etniapar'];
					$Fila[$cont][20]=$laRow['nacionalidadpar'];
					$Fila[$cont][21]=$laRow['edad'];
					$Fila[$cont][22]=$laRow['nombregru'];
					
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}
	}
?>