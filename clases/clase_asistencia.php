<?php
	require_once('../nucleo/ModeloConect.php');
	class clsAsistencia extends ModeloConect
	{
		private $lcIdAsistencia;
		private $lbAsistencia;
		private $lnIdCurso_participante;
		private $lnIdUnidad;
		private $laIdObjetivos;
		private $lcObservacion;
		private $ldFecha;
		private $lcIdcurso;

		function set_IdAsistencia($pcIdAsistencia)
		{
			$this->lcIdAsistencia=$pcIdAsistencia;
		}

		function set_Curso($pcIdCurso)
		{
			$this->lcIdcurso=$pcIdCurso;
		}
		
		function set_Asistencia($pcAsistencia)
		{
			$this->lbAsistencia=$pcAsistencia;
		}

		function set_IdCurso_participante($pcIdCurso_participante)
		{
			$this->lnIdCurso_participante=$pcIdCurso_participante;
		}

		function set_IdUnidad($pcIdUnidad)
		{
			$this->lnIdUnidad=$pcIdUnidad;
		}

		function set_IdObjetivos($pcIdObjetivos)
		{
			$this->laIdObjetivos=$pcIdObjetivos;
		}

		function set_Observacion($pcObservacion)
		{
			$this->lcObservacion=$pcObservacion;
		}

		function set_Fecha($pcFecha)
		{
			$this->ldFecha=$this->fecha_bd($pcFecha);
		}


		function consultar_dependencia()
		{
			$this->conectar();
			$dependencia=false;			
				$sql="SELECT * FROM tasignatura WHERE tasistencia_idasistencia='$this->lcIdAsistencia'";
				$pcsql=$this->filtro($sql);
				if($laRow=$this->proximo($pcsql))
				{
					$dependencia=true;
				}
			
			$this->desconectar();
			return $dependencia;
		}

		function consultar_asistencia($fecha)
		{
			$fecha=$this->fecha_bd($fecha);
			$this->conectar();
			$cont=0;
				$sql="SELECT  idcurso_participante as id,nombreunopar, nombredospar, apellidounopar, apellidodospar, cedulapar, tparticipante.idparticipante,fotoins,(YEAR(CURDATE())-YEAR(tparticipante.fechanacimientopar)) - (RIGHT(CURDATE(),5)<RIGHT(tparticipante.fechanacimientopar,5)) as edad,(SELECT asistenciaasi FROM tasistencia WHERE id=idcurso_idparticipante AND fechaasi='$fecha')as asistencia,(SELECT idasistencia FROM tasistencia WHERE id=idcurso_idparticipante AND fechaasi='$fecha')as idasistencia,(SELECT observacionasi FROM tasistencia WHERE id=idcurso_idparticipante AND fechaasi='$fecha')as observacionasi,estatus,nombrecur
					FROM  tparticipante,tcurso_tparticipante,tinscripcion,tcurso
					WHERE tparticipante.idparticipante=tinscripcion.idparticipante AND tparticipante_idparticipante=tparticipante.idparticipante AND tcurso_idcurso='$this->lcIdcurso' AND tcurso_idcurso=idcurso ";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['nombreunopar'];
					$Fila[$cont][1]=$laRow['nombredospar'];
					$Fila[$cont][2]=$laRow['apellidounopar'];
					$Fila[$cont][3]=$laRow['apellidodospar'];
					$Fila[$cont][4]=$laRow['cedulapar'];
					$Fila[$cont][5]=$laRow['idparticipante'];
					$Fila[$cont][6]=$laRow['fotoins'];
					$Fila[$cont][7]=$laRow['edad'];
					$Fila[$cont][8]=$laRow['id'];
					$Fila[$cont][9]=$laRow['asistencia'];
					$Fila[$cont][10]=$idasistencia=$laRow['idasistencia'];
					$Fila[$cont][13]=$laRow['observacionasi'];
					$Fila[$cont][14]=$laRow['estatus'];
					$Fila[$cont][15]=$laRow['nombrecur'];
					$sql="SELECT idunidad,nombreuni FROM  tasistencia_unidad,tunidad WHERE tasistencia_idasistencia='$idasistencia' AND tunidad_idunidad=idunidad ";
					$pcsql2=$this->filtro($sql);
					$cont2=0;
					while($laRow2=$this->proximo($pcsql2))
					{
						$Fila[$cont][11][$cont2][0]=$laRow2['idunidad'];
						$Fila[$cont][11][$cont2][1]=$laRow2['nombreuni'];
						$cont2++;
					}
					$sql="SELECT idobjetivo,nombreobj FROM  tasistencia_objetivo,tobjetivo WHERE tasistencia_idasistencia='$idasistencia' AND tobjetivo_idobjetivo=idobjetivo ";
					$pcsql2=$this->filtro($sql);
					$cont2=0;
					while($laRow2=$this->proximo($pcsql2))
					{
						$Fila[$cont][12][$cont2][0]=$laRow2['idobjetivo'];
						$Fila[$cont][12][$cont2][1]=$laRow2['nombreobj'];
						$cont2++;
					}

					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_asistencia_curso_participante($idparticipante)
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT *,date_format(fechaasi,'%d-%m-%Y')as fechaasi FROM tasistencia,tcurso_tparticipante,tcurso WHERE idcurso='$this->lcIdcurso' AND idcurso=tcurso_idcurso AND tparticipante_idparticipante='$idparticipante' AND tcurso_tparticipante.idcurso_participante=tasistencia.idcurso_idparticipante ";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$idasistencia=$laRow['idasistencia'];
					$Fila[$cont][1]=$laRow['fechaasi'];
					$Fila[$cont][2]=$laRow['asistenciaasi'];
					$Fila[$cont][3]=$laRow['observacionasi'];

					$sql="SELECT idunidad,nombreuni FROM  tasistencia_unidad,tunidad WHERE tasistencia_idasistencia='$idasistencia' AND tunidad_idunidad=idunidad ";
					$pcsql2=$this->filtro($sql);
					$cont2=0;
					while($laRow2=$this->proximo($pcsql2))
					{
						$Fila[$cont][4][$cont2][0]=$laRow2['idunidad'];
						$Fila[$cont][4][$cont2][1]=$laRow2['nombreuni'];
						$cont2++;
					}
					$sql="SELECT idobjetivo,nombreobj FROM  tasistencia_objetivo,tobjetivo WHERE tasistencia_idasistencia='$idasistencia' AND tobjetivo_idobjetivo=idobjetivo ";
					$pcsql2=$this->filtro($sql);
					$cont2=0;
					while($laRow2=$this->proximo($pcsql2))
					{
						$Fila[$cont][5][$cont2][0]=$laRow2['idobjetivo'];
						$Fila[$cont][5][$cont2][1]=$laRow2['nombreobj'];
						$cont2++;
					}

					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_asistencia_participante()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT *,date_format(fechaasi,'%d-%m-%Y')as fechaasi FROM tasistencia,tcurso_tparticipante,tcurso WHERE idasistencia='$this->lcIdAsistencia'";
				$pcsql=$this->filtro($sql);
				if($laRow=$this->proximo($pcsql))
				{
					$Fila[0]=$idasistencia=$laRow['idasistencia'];
					$Fila[1]=$laRow['fechaasi'];
					$Fila[2]=($laRow['asistenciaasi']=='1')?'SI':'NO';
					$Fila[3]=$laRow['observacionasi'];

					$sql="SELECT idunidad,nombreuni FROM  tasistencia_unidad,tunidad WHERE tasistencia_idasistencia='$idasistencia' AND tunidad_idunidad=idunidad ";
					$pcsql2=$this->filtro($sql);
					$cont2=0;
					while($laRow2=$this->proximo($pcsql2))
					{
						$Fila[4][$cont2][0]=$laRow2['idunidad'];
						$Fila[4][$cont2][1]=$laRow2['nombreuni'];
						$cont2++;
					}
					$sql="SELECT idobjetivo,nombreobj FROM  tasistencia_objetivo,tobjetivo WHERE tasistencia_idasistencia='$idasistencia' AND tobjetivo_idobjetivo=idobjetivo ";
					$pcsql2=$this->filtro($sql);
					$cont2=0;
					while($laRow2=$this->proximo($pcsql2))
					{
						$Fila[5][$cont2][0]=$laRow2['idobjetivo'];
						$Fila[5][$cont2][1]=$laRow2['nombreobj'];
						$cont2++;
					}

					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}



		function consultar_dia_asistencias()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT fechaasi,(SELECT fechainilap FROM tlapso WHERE  estadolap='APERTURADO')as fechainilap FROM  tparticipante,tcurso_tparticipante,tinscripcion,tasistencia
					WHERE tparticipante.idparticipante=tinscripcion.idparticipante AND tparticipante_idparticipante=tparticipante.idparticipante AND tcurso_idcurso='$this->lcIdcurso' AND idcurso_participante=idcurso_idparticipante AND estatus='1' GROUP BY fechaasi";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['fechaasi'];

					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_asistencias_inactivas()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT * FROM `tasistencia`";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['idasistencia'];
					$Fila[$cont][1]=$laRow['nombreare'];
					$Fila[$cont][2]=$laRow['estatusare'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_asistencia_bitacora()
		{
			$this->conectar();
				$sql="SELECT * FROM `tasistencia` WHERE `idasistencia`='$this->lcIdAsistencia'";
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

		function registrar_asistencia()
		{
			$this->conectar();
			$this->begin();
			for($i=0;$i<count($this->lnIdCurso_participante);$i++)
			{
				$idCurso_participante=$this->lnIdCurso_participante[$i];
				$asistencia=($this->lbAsistencia[$i]=='1')?'1':'0';
				$observacion=$this->lcObservacion[$i];

				$sql="INSERT INTO `tasistencia`(`idcurso_idparticipante`, `fechaasi`, `asistenciaasi`, `observacionasi`) VALUES ('$idCurso_participante','$this->ldFecha','$asistencia',UPPER('$observacion'))";
				if(($lnHecho=$this->ejecutar($sql))&&($asistencia=='1'))
				{
					$sql="SELECT MAX(idasistencia)as idasistencia FROM tasistencia ORDER BY idasistencia DESC LIMIT 1";
					$pcsql=$this->filtro($sql);
					if($laRow=$this->proximo($pcsql))
					{
						$idasistencia=$laRow['idasistencia'];
						$idunidad=$this->lnIdUnidad[$i];
						$sql="INSERT INTO `tasistencia_unidad`(`tasistencia_idasistencia`, `tunidad_idunidad`) VALUES ('$idasistencia','$idunidad')";
						if($lnHecho=$this->ejecutar($sql))
						{
							for ($j=0;$j<count($this->laIdObjetivos[$i]);$j++) 
							{ 
								$idobjetivo=$this->laIdObjetivos[$i][$j];
								$sql="INSERT INTO `tasistencia_objetivo`(`tasistencia_idasistencia`, `tobjetivo_idobjetivo`) VALUES ('$idasistencia','$idobjetivo')";
								if(!$lnHecho=$this->ejecutar($sql))
								{
									break;
								}
							}
						}
						else
							break;
					}
				}
			}
			if($lnHecho)
				$this->commit();
			else
				$this->rollback();

			$this->desconectar();
			return $lnHecho;
		}

		function editar_asistencia()
		{
			$this->conectar();
			$this->begin();
			for($i=0;$i<count($this->lnIdCurso_participante);$i++)
			{
				$idCurso_participante=$this->lnIdCurso_participante[$i];
				$asistencia=($this->lbAsistencia[$i]=='1')?'1':'0';
				$observacion=$this->lcObservacion[$i];
					$sql="UPDATE `tasistencia` SET `asistenciaasi`='$asistencia', `observacionasi`=UPPER('$observacion') WHERE idasistencia='".$this->lcIdAsistencia[$i]."'";
					if($lnHecho=$this->ejecutar($sql))
					{
						$idunidad=$this->lnIdUnidad[$i];						
						if($asistencia=='1')
						{
							$sql="DELETE FROM `tasistencia_unidad` WHERE tasistencia_idasistencia='".$this->lcIdAsistencia[$i]."'";
							$lnHecho=$this->ejecutar($sql);	

							$sql="INSERT INTO `tasistencia_unidad`(`tasistencia_idasistencia`, `tunidad_idunidad`) VALUES ('".$this->lcIdAsistencia[$i]."','$idunidad')";
							if($lnHecho=$this->ejecutar($sql))
							{
								for ($j=0;$j<count($this->laIdObjetivos[$i]);$j++) 
								{ 
									$idobjetivo=$this->laIdObjetivos[$i][$j];
									$sql="DELETE FROM `tasistencia_objetivo` WHERE tasistencia_idasistencia='".$this->lcIdAsistencia[$i]."'";
									$lnHecho=$this->ejecutar($sql);
									$sql="INSERT INTO `tasistencia_objetivo`(`tasistencia_idasistencia`, `tobjetivo_idobjetivo`) VALUES ('".$this->lcIdAsistencia[$i]."','$idobjetivo')";
									if(!$lnHecho=$this->ejecutar($sql))
									{
										break;
									}
								}
							}
							else
								break;
						}
						elseif($asistencia=='0')
						{
							$sql="DELETE FROM `tasistencia_unidad` WHERE tasistencia_idasistencia='".$this->lcIdAsistencia[$i]."'";
							$lnHecho=$this->ejecutar($sql);

							$sql="DELETE FROM `tasistencia_objetivo` WHERE tasistencia_idasistencia='".$this->lcIdAsistencia[$i]."'";
							$lnHecho=$this->ejecutar($sql);
						}
					}
			}
			if($lnHecho)
				$this->commit();
			else
				$this->rollback();

			$this->desconectar();
			return $lnHecho;
		}

		function eliminar_asistencia()
		{
			$this->conectar();
			$sql="UPDATE tasistencia SET estatusare='0' WHERE idasistencia='$this->lcIdAsistencia' ";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function restaurar_asistencia()
		{
			$this->conectar();
			$sql="UPDATE tasistencia SET estatusare='1' WHERE idasistencia='$this->lcIdAsistencia' ";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

	}
?>