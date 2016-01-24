<?php

	require_once('../nucleo/ModeloConect.php');
	class clsAsignatura extends ModeloConect
	{
		private $lcIdasignatura;
		private $lcNombre;
		private $lcEstatus;
		private $lcArea;
		private $lcHorasTeoricas;
		private $lcHorasPracticas;
		private $lcUnidades;
		private $lcIdUnidades;
		private $lcObjetivos;
		private $lnUnidad_oculta;
		private $lcContenido;

		function set_Area($pcIdArea)
		{
			$this->lcArea=$pcIdArea;
		}

		function set_Asignatura($pcIdAsignatura)
		{
			$this->lcIdasignatura=$pcIdAsignatura;
		}

		function set_Contenido($pcContenido)
		{
			$this->lcContenido=$pcContenido;
		}

		function set_Unidad_oculta($pcUnidad_oculta)
		{
			$this->lnUnidad_oculta=$pcUnidad_oculta;
		}

		function set_Unidades($pcUnidades)
		{
			$this->lcUnidades=$pcUnidades;
		}
		function set_IdUnidades($pcIdUnidades)
		{
			$this->lcIdUnidades=$pcIdUnidades;
		}

		function set_Objetivos($pcObjetivos)
		{
			$this->lcObjetivos=$pcObjetivos;
		}

		function set_Nombre($pcNombre)
		{
			$this->lcNombre=$pcNombre;
		}

		function set_Estatus($pcEstatus)
		{
			$this->lcEstatus=$pcEstatus;
		}

		function set_HorasTeoricas($pcHorasTeoricas)
		{
			$this->lcHorasTeoricas=$pcHorasTeoricas;
		}

		function set_HorasPracticas($pcHorasPracticas)
		{
			$this->lcHorasPracticas=$pcHorasPracticas;
		}

		function consultar_asignatura()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT * FROM `tasignatura` WHERE `idasignatura`='$this->lcIdasignatura'";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[0]=$laRow['idasignatura'];
					$Fila[1]=$laRow['nombreasi'];
					$Fila[2]=$laRow['tarea_idarea_conocimiento'];
					$Fila[3]=$laRow['estatusasi'];
					$Fila[4]=$laRow['horasteoricas'];
					$Fila[5]=$laRow['horaspracticas'];
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_dependencia()
		{
			$this->conectar();
			$dependencia=false;			
				$sql="SELECT * FROM tcurso WHERE tasignatura_idasignatura='$this->lcIdasignatura'";
				$pcsql=$this->filtro($sql);
				if($laRow=$this->proximo($pcsql))
				{
					$dependencia=true;
				}
			
			$this->desconectar();
			return $dependencia;
		}

		function consultar_asignaturas()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT *, nombreare FROM `tasignatura` LEFT JOIN tarea_conocimiento ON (tarea_idarea_conocimiento=idarea_conocimiento) WHERE  estatusasi=1";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['idasignatura'];
					$Fila[$cont][1]=$laRow['nombreasi'];
					$Fila[$cont][2]=$laRow['tarea_idarea_conocimiento'];
					$Fila[$cont][3]=$laRow['estatusasi'];
					$Fila[$cont][4]=$laRow['nombreare'];
					$Fila[$cont][5]=$laRow['horasteoricas'];
					$Fila[$cont][6]=$laRow['horaspracticas'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_asignaturas_inactivas()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT *,nombreare FROM `tasignatura`,tarea_conocimiento WHERE tarea_idarea_conocimiento=idarea_conocimiento ";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['idasignatura'];
					$Fila[$cont][1]=$laRow['nombreasi'];
					$Fila[$cont][2]=$laRow['tarea_idarea_conocimiento'];
					$Fila[$cont][3]=$laRow['estatusasi'];
					$Fila[$cont][4]=$laRow['horasteoricas'];
					$Fila[$cont][5]=$laRow['horaspracticas'];
					$Fila[$cont][6]=$laRow['nombreare'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_unidades()
		{
			$this->conectar();
			$cont=0;
			$sql="SELECT *,idunidad as id,(SELECT COUNT(*) FROM tobjetivo WHERE tunidad_idunidad=id)as objetivos FROM `tunidad` WHERE tasignatura_idasignatura='$this->lcIdasignatura'";
			$pcsql=$this->filtro($sql);
			while($laRow=$this->proximo($pcsql))
			{
				$Fila[$cont]['idunidad']=$laRow['id'];
				$Fila[$cont]['nombreuni']=$laRow['nombreuni'];
				$Fila[$cont]['estatusuni']=$laRow['estatusuni'];
				$Fila[$cont]['objetivos']=$laRow['objetivos'];
				$cont++;
			}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_objetivos($idunidad)
		{
			$this->conectar();
			$cont=0;
			$sql="SELECT * FROM tobjetivo WHERE tunidad_idunidad='$idunidad'";
			$pcsql=$this->filtro($sql);
			while($laRow=$this->proximo($pcsql))
			{
				$Fila[$cont]['idobjetivo']=$laRow['idobjetivo'];
				$Fila[$cont]['nombreobj']=$laRow['nombreobj'];
				$Fila[$cont]['contenidoobj']=$laRow['contenidoobj'];
				$Fila[$cont]['estatusobj']=$laRow['estatusobj'];
				$cont++;
			}			
			$this->desconectar();
			return $Fila;
		}

		function consultar_asignatura_bitacora()
		{
			$this->conectar();
				$sql="SELECT * FROM `tasignatura` WHERE `idasignatura`='$this->lcIdasignatura'";
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

		function registrar_asignatura()
		{
			$this->conectar();
			$llHecho=false;
			$this->begin();
			$sql="INSERT INTO `tasignatura`(`nombreasi`, `tarea_idarea_conocimiento`, `estatusasi`, `horasteoricas`, `horaspracticas`) 
			VALUES (UPPER('$this->lcNombre'),'$this->lcArea','1', '$this->lcHorasTeoricas', '$this->lcHorasPracticas')";
			if($llHecho=$this->ejecutar($sql))
			{
				$sql="SELECT MAX(idasignatura)as idasignatura FROM tasignatura";
				$pcsql=$this->filtro($sql);
				if($laRow=$this->proximo($pcsql))
				{
					$idasignatura=$laRow['idasignatura'];
					$this->cierrafiltro($pcsql);
					for($i=0;$i<count($this->lcUnidades);$i++)
					{
						$sql="INSERT INTO tunidad (nombreuni,tasignatura_idasignatura)VALUES(UPPER('".$this->lcUnidades[$i]."'),'$idasignatura')";
						$llHecho=$this->ejecutar($sql);
						if(!$llHecho)
						{
							$this->rollback();
							break;
						}
						$sql="SELECT MAX(idunidad)as idunidad FROM tunidad";
						$pcsql=$this->filtro($sql);
						if($laRow=$this->proximo($pcsql))
						{
							$idunidad=$laRow['idunidad'];
							$this->cierrafiltro($pcsql);
						}
						if($llHecho)
						{
							for ($j=0; $j <count($this->lcObjetivos); $j++) 
							{
								if($i==$this->lnUnidad_oculta[$j])
								{
									$sql="INSERT INTO tobjetivo (nombreobj,contenidoobj,tunidad_idunidad)VALUES(UPPER('".$this->lcObjetivos[$j]."'),UPPER('".$this->lcContenido[$j]."'),'$idunidad')";
									$llHecho=$this->ejecutar($sql);
									if(!$llHecho)
									{
										$this->rollback();
										break;
									}
								}
							}
						}
					}
					
				}

			}
			if($llHecho)
				$this->commit();
			else
				$this->rollback();

			$this->desconectar();
			return $llHecho;
		}

		function registrar_unidades_objetivos()
		{
			$this->conectar();
			$llHecho=false;
			$this->begin();
			$idasignatura=$laRow['idasignatura'];
			$this->cierrafiltro($pcsql);
			for($i=0;$i<count($this->lcUnidades);$i++)
			{
				$sql="INSERT INTO tunidad (nombreuni,tasignatura_idasignatura)VALUES('".$this->lcUnidades[$i]."','$this->lcIdasignatura')";
				$llHecho=$this->ejecutar($sql);
				if(!$llHecho)
				{
					$this->rollback();
					break;
				}
				$sql="SELECT MAX(idunidad)as idunidad FROM tunidad";
				$pcsql=$this->filtro($sql);
				if($laRow=$this->proximo($pcsql))
				{
					$idunidad=$laRow['idunidad'];
					$this->cierrafiltro($pcsql);
				}
				if($llHecho)
				{
					for ($j=0; $j <count($this->lcObjetivos); $j++) 
					{
						if($i==$this->lnUnidad_oculta[$j])
						{
							$sql="INSERT INTO tobjetivo (nombreobj,contenidoobj,tunidad_idunidad)VALUES('".$this->lcObjetivos[$j]."','".$this->lcContenido[$j]."','$idunidad')";
							$llHecho=$this->ejecutar($sql);
							if(!$llHecho)
							{
								$this->rollback();
								break;
							}
						}
					}
				}
			}					

			if($llHecho)
				$this->commit();
			else
				$this->rollback();

			$this->desconectar();
			return $llHecho;
		}

		function eliminar_asignatura()
		{
			$this->conectar();
			$sql="UPDATE tasignatura SET estatusasi='0' WHERE idasignatura='$this->lcIdasignatura' ";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function eliminar_unidad_objetivos()
		{
			$this->conectar();
			$this->begin();
			$sql="DELETE FROM tunidad WHERE tasignatura_idasignatura='$this->lcIdasignatura' ";
			if($lnHecho=$this->ejecutar($sql))
				$this->commit();
			else
				$this->rollback();	

			$this->desconectar();
			return $lnHecho;
		}

		function restaurar_asignatura()
		{
			$this->conectar();
			$sql="UPDATE tasignatura SET estatusasi='1' WHERE idasignatura='$this->lcIdasignatura' ";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}
		
		function editar_asignatura()
		{
			$this->conectar();
			$sql="UPDATE `tasignatura` SET `nombreasi`=UPPER('$this->lcNombre'),
			 `tarea_idarea_conocimiento`='$this->lcArea', horasteoricas='$this->lcHorasTeoricas', horaspracticas='$this->lcHorasPracticas' WHERE idasignatura='$this->lcIdasignatura'";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}
	}
?>