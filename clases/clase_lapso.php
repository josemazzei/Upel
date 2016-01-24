<?php
	require_once('../nucleo/ModeloConect.php');
	class clsLapso extends ModeloConect
	{
		
		private $lcIdlapso;
		private $lcNombrelap;
		private $lcFechainilap;
		private $lcFechafinlap;
		private $lcEstadolap;
		private $lcEstatuslap;

		function set_Lapso($pcIdLapso)
		{
			$this->lcIdlapso=$pcIdLapso;
		}

		function set_Nombrelap($pcNombrelap)
		{
			$this->lcNombrelap=$pcNombrelap;
		}

		function set_Fechainicio($pcFechainicio)
		{
			$this->lcFechainilap=$this->fecha_bd($pcFechainicio);
		}

		function set_Fechafin($pcFechafin)
		{
			$this->lcFechafinlap=$this->fecha_bd($pcFechafin);
		}

		function set_Estadolap($pcEstadolap)
		{
			$this->lcEstadolap=$pcEstadolap;
		}

		function set_Estatuslap($pcEstatuslap)
		{
			$this->lcEstatuslap=$pcEstatuslap;
		}

		function consultar_lapso()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT *,date_format(fechainilap,'%d-%m-%Y') AS fechainilap,date_format(fechafinlap,'%d-%m-%Y') AS fechafinlap   FROM tlapso WHERE idlapso='$this->lcIdlapso' AND estatuslap='1'";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[0]=$laRow['idlapso'];
					$Fila[1]=$laRow['nombrelap'];
					$Fila[2]=$laRow['fechainilap'];
					$Fila[3]=$laRow['fechafinlap'];
					$Fila[4]=$laRow['estadolap'];
					$Fila[5]=$laRow['estatuslap'];
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_dependencia()
		{
			$this->conectar();
			$dependencia=false;			
				$sql="SELECT * FROM tcurso WHERE tlapso_idlapso='$this->lcIdlapso'";
				$pcsql=$this->filtro($sql);
				if($laRow=$this->proximo($pcsql))
				{
					$dependencia=true;
				}
			
			$this->desconectar();
			return $dependencia;
		}

		function consultar_lapsos()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT *,date_format(fechainilap,'%d-%m-%Y') AS fechainilap,date_format(fechafinlap,'%d-%m-%Y') AS fechafinlap FROM tlapso";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['idlapso'];
					$Fila[$cont][1]=$laRow['nombrelap'];
					$Fila[$cont][2]=$laRow['fechainilap'];
					$Fila[$cont][3]=$laRow['fechafinlap'];
					$Fila[$cont][4]=$laRow['estadolap'];
					$Fila[$cont][5]=$laRow['estatuslap'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_lapsos_participante($idparticipante)
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT *,date_format(fechainilap,'%d-%m-%Y') AS fechainilap,date_format(fechafinlap,'%d-%m-%Y') AS fechafinlap FROM tlapso,tcurso,tcurso_tparticipante WHERE tparticipante_idparticipante='$idparticipante' AND tcurso_idcurso=idcurso AND tlapso_idlapso=idlapso GROUP BY idlapso";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['idlapso'];
					$Fila[$cont][1]=$laRow['nombrelap'];
					$Fila[$cont][2]=$laRow['fechainilap'];
					$Fila[$cont][3]=$laRow['fechafinlap'];
					$Fila[$cont][4]=$laRow['estadolap'];
					$Fila[$cont][5]=$laRow['estatuslap'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_lapsos_activo()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT *,date_format(fechainilap,'%d-%m-%Y') AS fechainilap,date_format(fechafinlap,'%d-%m-%Y') AS fechafinlap FROM tlapso WHERE  estatuslap='1' AND estadolap='APERTURADO'";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['idlapso'];
					$Fila[$cont][1]=$laRow['nombrelap'];
					$Fila[$cont][2]=$laRow['fechainilap'];
					$Fila[$cont][3]=$laRow['fechafinlap'];
					$Fila[$cont][4]=$laRow['estadolap'];
					$Fila[$cont][5]=$laRow['estatuslap'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}


		function consultar_activo()
		{
			$Activo = false;
			$this->conectar();
			$cont=0;
				$sql="SELECT *,date_format(fechainilap,'%d-%m-%Y') AS fechainilap,date_format(fechafinlap,'%d-%m-%Y') AS fechafinlap FROM tlapso WHERE  estadolap='APERTURADO'";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Activo = true;
				}
			
			$this->desconectar();
			return $Activo;
		}

		function consultar_rango()
		{
			$Activo = false;
			$this->conectar();
			$cont=0;
				$sql="SELECT date_format(fechainilap,'%d-%m-%Y') AS fechainilap,date_format(fechafinlap,'%d-%m-%Y') AS fechafinlap
					 FROM tlapso 
					 WHERE 
					  fechainilap BETWEEN '$this->lcFechainilap' AND '$this->lcFechainilap' 
					  OR fechafinlap BETWEEN '$this->lcFechainilap' AND '$this->lcFechafinlap'";
				$pcsql=$this->filtro($sql);
				if($laRow=$this->proximo($pcsql))
				{
					$Activo = true;
				}
			
			$this->desconectar();
			return $Activo;
		}

		function consultar_ultima_fecha()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT date_format(fechainilap,'%d-%m-%Y') AS fechainilap,date_format(fechafinlap,'%d-%m-%Y') AS fechafinlap
					 FROM tlapso 
					 ORDER BY date(fechafinlap) DESC";
				$pcsql=$this->filtro($sql);
				if($laRow=$this->proximo($pcsql))
				{
					$Fecha = $laRow['fechafinlap'];
				}
			
			$this->desconectar();
			return $Fecha;
		}

		function consultar_cantidad_dias()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT tiempolapso
					 FROM tsistema 
					 ";
				$pcsql=$this->filtro($sql);
				if($laRow=$this->proximo($pcsql))
				{
					$Fecha = $laRow['tiempolapso'];
				}
			
			$this->desconectar();
			return $Fecha;
		}

		function consultar_apertura()
		{
			$fecha = date('Y-m-d');
			$Activo = false;
			$this->conectar();
			$cont=0;
				$sql="SELECT *,date_format(fechainilap,'%d-%m-%Y') AS fechainilap,date_format(fechafinlap,'%d-%m-%Y') AS fechafinlap
					 FROM tlapso 
					 WHERE 
					  fechainilap <='$fecha' AND estadolap='PROGRAMADO'";
				$pcsql=$this->filtro($sql);
				if($laRow=$this->proximo($pcsql))
				{
					$Activo = true;
					$this->lcIdlapso=$laRow['idlapso'];
				}
			
			$this->desconectar();
			return $Activo;
		}

		function consultar_cierre()
		{
			$fecha = date('Y-m-d');
			$Activo = false;
			$this->conectar();
			$cont=0;
				$sql="SELECT *,date_format(fechainilap,'%d-%m-%Y') AS fechainilap,date_format(fechafinlap,'%d-%m-%Y') AS fechafinlap
					 FROM tlapso 
					 WHERE 
					  fechafinlap <='$fecha' AND estadolap='APERTURADO'";
				$pcsql=$this->filtro($sql);
				if($laRow=$this->proximo($pcsql))
				{
					$Activo = true;
					$this->lcIdlapso=$laRow['idlapso'];

				}
			
			$this->desconectar();
			return $Activo;
		}

		function consultar_lapso_bitacora()
		{
			$this->conectar();
				$sql="SELECT *,date_format(fechainilap,'%d-%m-%Y') AS fechainilap,date_format(fechafinlap,'%d-%m-%Y') AS fechafinlap FROM `tlapso` WHERE idlapso='$this->lcIdlapso'";
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

		function registrar_lapso()
		{
			$this->conectar();
			$sql="INSERT INTO `tlapso`(`nombrelap`, `fechainilap`, `fechafinlap`, `estadolap`, `estatuslap`)
				 VALUES (UPPER('$this->lcNombrelap'),'$this->lcFechainilap','$this->lcFechafinlap',UPPER('$this->lcEstadolap'),'1')";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function eliminar_lapso()
		{
			$this->conectar();
			$sql="UPDATE tlapso SET estatuslap='0' WHERE idlapso='$this->lcIdlapso'";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function editar_lapso()
		{
			$this->conectar();
			$sql="UPDATE `tlapso` SET `nombrelap`=UPPER('$this->lcNombrelap'),`fechainilap`='$this->lcFechainilap',`fechafinlap`='$this->lcFechafinlap',`estadolap`=UPPER('$this->lcEstadolap') WHERE idlapso='$this->lcIdlapso'";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function editar_estado()
		{
			$this->conectar();
			$sql="UPDATE `tlapso` SET`estadolap`=UPPER('$this->lcEstadolap') WHERE idlapso='$this->lcIdlapso'";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function restaurar_lapso()
		{
			$this->conectar();
			$sql="UPDATE tlapso SET estatuslap='1' WHERE idlapso='$this->lcIdlapso' ";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function cerrar_lapso()
		{
			$this->conectar();
			$sql="UPDATE `tcurso` SET`estatuscur`='2' WHERE tlapso_idlapso='$this->lcIdlapso'";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		protected function fecha_bd($pcFecha)
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

		function historial_lapso()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT count(*) AS cantidad_cursos, 
				(SELECT count(idcurso_participante) FROM tcurso_tparticipante WHERE tcurso_idcurso 
					IN (SELECT tc.idcurso FROM tcurso AS tc WHERE tc.tlapso_idlapso='$this->lcIdlapso')) AS cantidad_participantes

					FROM tcurso WHERE tlapso_idlapso='$this->lcIdlapso'";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila['cantidad_cursos']=$laRow['cantidad_cursos'];
					$Fila['cantidad_participantes']=$laRow['cantidad_participantes'];
					$Fila[2]=$laRow['nombreasi'];
					$Fila[3]=$laRow['nombreaul'];
					$Fila[4]=$laRow['nombregru'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_lapsos_nombre()
		{
			$Fila=false;
			$this->conectar();
			$cont=0;
				$sql="SELECT * FROM tlapso WHERE nombrelap=UPPER('$this->lcNombrelap')";
				$pcsql=$this->filtro($sql);
				if($laRow=$this->proximo($pcsql))
				{
					$Fila=true;
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}
	}
?>