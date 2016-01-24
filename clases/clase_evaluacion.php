<?php
	require_once('../nucleo/ModeloConect.php');
	class clsEvaluacion extends ModeloConect
	{

		private $lcIdEvaluacion;
		private $lcFecha;
		private $lcObservacion;
		private $lcIdParticipante;
		private $lcIdInstrumento;
		private $lcIdItem;
		private $lcValor;
		private $lcEstatus;
		private $lcIdCurso;

		function set_Evaluacion($pc)
		{
			$this->lcIdEvaluacion=$pc;
		}

		function set_Fecha($pc)
		{
			$this->lcFecha=$this->fecha_bd($pc);
		}

		function set_Observacion($pc)
		{
			$this->lcObservacion=$pc;
		}

		function set_Participante($pc)
		{
			$this->lcIdParticipante=$pc;
		}

		function set_Cruso($pc)
		{
			$this->lcIdCurso=$pc;
		}

		function set_Instrumento($pc)
		{
			$this->lcIdInstrumento=$pc;
		}

		function set_Item($pc)
		{
			$this->lcIdItem=$pc;
		}

		function set_Valor($pc)
		{
			$this->lcValor=$pc;
		}

		function set_Estatus($pc)
		{
			$this->lcEstatus=$pc;
		}

		function consultar_evaluacion()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT *,tparticipante.tinstitucion_idinstitucion as idinstitu,date_format(fechaeva,'%d-%m-%Y')as fechaeva,(YEAR(CURDATE())-YEAR(fechanacimientopar))-(RIGHT(CURDATE(),5)<RIGHT(fechanacimientopar,5))AS edad,date_format(fechanacimientopar,'%d-%m-%Y')as fechanacimientopar,(SELECT descripcioninst FROM tinstitucion WHERE idinstitu=idinstitucion)as institucion FROM `tevaluacion`,tparticipante,tinstrumento,tasignatura,tcurso_tparticipante,tcurso,tlocalidad,tdocente,tinscripcion,tlapso WHERE  idevaluacion='$this->lcIdEvaluacion' AND  tevaluacion.idcurso_idparticipante=tcurso_tparticipante.idcurso_participante AND tparticipante_idparticipante=tparticipante.idparticipante AND tcurso_idcurso=idcurso AND tinstrumento_idinstrumento=idinstrumento AND tinstrumento.tasignatura_idasignatura=idasignatura AND tlocalidad_idlugarnacimiento=idlocalidad AND tdocente_iddocente=iddocente AND tinscripcion.idparticipante=tparticipante.idparticipante AND tlapso_idlapso=idlapso";
				//$sql="SELECT *,tparticipante.tinstitucion_idinstitucion as idinstitu,(YEAR(CURDATE())-YEAR(fechanacimientopar))-(RIGHT(CURDATE(),5)<RIGHT(fechanacimientopar,5))AS edad,date_format(fechanacimientopar,'%d-%m-%Y')as fechanacimientopar,(SELECT descripcioninst FROM tinstitucion WHERE idinstitu=idinstitucion)as institucion FROM tparticipante,tcurso,tdocente,tinscripcion,tlocalidad,tlapso,tcurso_tparticipante WHERE idcurso='$this->lcIdCurso' AND idcurso=tcurso_idcurso AND idcurso_participante='$this->lcIdParticipante' AND tparticipante.idparticipante=tparticipante_idparticipante AND tdocente_iddocente=iddocente AND tparticipante.idparticipante=tinscripcion.idparticipante AND tlocalidad_idlugarnacimiento=idlocalidad AND tlapso_idlapso=idlapso";
				$pcsql=$this->filtro($sql);
				if($laRow=$this->proximo($pcsql))
				{
					$Fila=$laRow;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_evaluacion_vacia()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT *,tparticipante.tinstitucion_idinstitucion as idinstitu,(YEAR(CURDATE())-YEAR(fechanacimientopar))-(RIGHT(CURDATE(),5)<RIGHT(fechanacimientopar,5))AS edad,date_format(fechanacimientopar,'%d-%m-%Y')as fechanacimientopar,(SELECT descripcioninst FROM tinstitucion WHERE idinstitu=idinstitucion)as institucion FROM tparticipante,tcurso,tdocente,tinscripcion,tlocalidad,tlapso,tcurso_tparticipante WHERE idcurso='$this->lcIdCurso' AND idcurso=tcurso_idcurso AND idcurso_participante='$this->lcIdParticipante' AND tparticipante.idparticipante=tparticipante_idparticipante AND tdocente_iddocente=iddocente AND tparticipante.idparticipante=tinscripcion.idparticipante AND tlocalidad_idlugarnacimiento=idlocalidad AND tlapso_idlapso=idlapso";
				$pcsql=$this->filtro($sql);
				if($laRow=$this->proximo($pcsql))
				{
					$Fila=$laRow;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_items_evaluacion()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT * FROM tevaluacion_item,titem WHERE tevaluacion_idevaluacion='$this->lcIdEvaluacion' AND titem_iditem=iditem";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['titem_iditem'];
					$Fila[$cont][1]=$laRow['valor'];
					$Fila[$cont][2]=$laRow['nombreite'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_items_evaluacion_vacia()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT * FROM tinstrumento,tinstrumento_item,titem WHERE idinstrumento='$this->lcIdInstrumento' AND tinstrumento_idinstrumento=idinstrumento AND titem_iditem=iditem";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['titem_iditem'];
					$Fila[$cont][1]=$laRow['valor'];
					$Fila[$cont][2]=$laRow['nombreite'];
					$Fila[$cont][3]=$laRow['espacio'];


					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_dependencia()
		{
			$this->conectar();
			$dependencia=false;			
				$sql="SELECT * FROM tcurso WHERE tevaluacion_idevaluacion='$this->lcIdEvaluacion'";
				$pcsql=$this->filtro($sql);
				if($laRow=$this->proximo($pcsql))
				{
					$dependencia=true;
				}
			
			$this->desconectar();
			return $dependencia;
		}

		function consultar_evaluaciones()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT * FROM `tevaluacion`,tcurso,tcurso_tparticipante WHERE tevaluacion.idcurso_idparticipante=tcurso_tparticipante.idcurso_participante AND tcurso_idcurso=idcurso AND tlapso_idlapso=(SELECT idlapso FROM tlapso WHERE estatuslap='1') AND estatuseva='1'";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont]=$laRow['idevaluacion'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_evaluaciones_inactivas()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT *,date_format(fechaeva,'%d-%m-%Y')as fechaeva FROM `tevaluacion`,tparticipante,tinstrumento,tasignatura,tcurso_tparticipante,tcurso WHERE tevaluacion.idcurso_idparticipante=tcurso_tparticipante.idcurso_participante AND tparticipante_idparticipante=idparticipante AND tcurso_idcurso=idcurso AND tinstrumento_idinstrumento=idinstrumento AND tinstrumento.tasignatura_idasignatura=idasignatura";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont]=$laRow;
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_evaluaciones_participante($idlapso,$idcurso)
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT *,date_format(fechaeva,'%d-%m-%Y')as fechaeva FROM `tevaluacion`,tparticipante,tinstrumento,tasignatura,tcurso_tparticipante,tcurso,tlapso WHERE  idparticipante='$this->lcIdParticipante' AND tparticipante_idparticipante=idparticipante AND tevaluacion.idcurso_idparticipante=tcurso_tparticipante.idcurso_participante AND tcurso_idcurso=idcurso AND tcurso_idcurso='$idcurso' AND tinstrumento_idinstrumento=idinstrumento AND tinstrumento.tasignatura_idasignatura=idasignatura AND idlapso='$idlapso' AND tlapso_idlapso=idlapso";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont]=$laRow;
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}


		function registrar_evaluacion()
		{
			$this->conectar();
			$this->begin();
			$sql="INSERT INTO `tevaluacion`(`fechaeva`, `observacioneva`, `idcurso_idparticipante`, `tinstrumento_idinstrumento`, `estatuseva`) 
			VALUES ('$this->lcFecha',UPPER('$this->lcObservacion'),'$this->lcIdParticipante','$this->lcIdInstrumento','1')";
			if($lnHecho=$this->ejecutar($sql))
			{
				$sql="SELECT MAX(idevaluacion)as idevaluacion FROM `tevaluacion` LIMIT 1";
				$pcsql=$this->filtro($sql);
				if($laRow=$this->proximo($pcsql))
				{
					$idevaluacion=$laRow['idevaluacion'];
					for($i=0;$i<count($this->lcIdItem);$i++)
					{
						if(is_array($this->lcValor[$i]))
						{
							for($j=0;$j<count($this->lcValor[$i]);$j++)
							{
								$sql="INSERT INTO `tevaluacion_item`(`tevaluacion_idevaluacion`, `titem_iditem`,valor)VALUES ('$idevaluacion','".$this->lcIdItem[$i]."','".$this->lcValor[$i][$j]."')";
								if(!$lnHecho=$this->ejecutar($sql))
								{
									$this->rollback();
									break;
								}
							}
						}
						else
						{
							$sql="INSERT INTO `tevaluacion_item`(`tevaluacion_idevaluacion`, `titem_iditem`,valor)VALUES ('$idevaluacion','".$this->lcIdItem[$i]."','".$this->lcValor[$i][0]."')";
							if(!$lnHecho=$this->ejecutar($sql))
								{
									$this->rollback();
									break;
								}

						}
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

		function eliminar_evaluacion()
		{
			$this->conectar();
			$sql="UPDATE tevaluacion SET estatuseva='0' WHERE idevaluacion='$this->lcIdEvaluacion' ";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function restaurar_evaluacion()
		{
			$this->conectar();
			$sql="UPDATE tevaluacion SET estatuseva='1' WHERE idevaluacion='$this->lcIdEvaluacion' ";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function editar_evaluacion()
		{
			$this->conectar();
			$this->begin();
			$sql="UPDATE `tevaluacion` SET `fechaeva`='$this->lcFecha', `observacioneva`=UPPER('$this->lcObservacion'),`idcurso_idparticipante`='$this->lcIdParticipante',`tinstrumento_idinstrumento`='$this->lcIdInstrumento' WHERE idevaluacion='$this->lcIdEvaluacion'";
			$lnHecho=$this->ejecutar($sql);
			$sql="DELETE FROM tevaluacion_item WHERE tevaluacion_idevaluacion='$this->lcIdEvaluacion'";
			$lnHecho=$this->ejecutar($sql);
			for($i=0;$i<count($this->lcIdItem);$i++)
			{
				if(is_array($this->lcValor[$i]))
				{
					for($j=0;$j<count($this->lcValor[$i]);$j++)
					{
						$sql="INSERT INTO `tevaluacion_item`(`tevaluacion_idevaluacion`, `titem_iditem`,valor)VALUES ('$this->lcIdEvaluacion','".$this->lcIdItem[$i]."','".$this->lcValor[$i][$j]."')";
						if(!$lnHecho=$this->ejecutar($sql))
						{
							$this->rollback();
							break;
						}
					}
				}
				else
				{
					$sql="INSERT INTO `tevaluacion_item`(`tevaluacion_idevaluacion`, `titem_iditem`,valor)VALUES ('$this->lcIdEvaluacion','".$this->lcIdItem[$i]."','".$this->lcValor[$i]."')";
					if(!$lnHecho=$this->ejecutar($sql))
						{
							$this->rollback();
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


	}
?>