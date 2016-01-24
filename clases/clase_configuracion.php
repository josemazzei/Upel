<?php
	require_once('../nucleo/ModeloConect.php');
	class clsConfiguracion extends ModeloConect
	{
		private $lcIdconfiguracion;
		private $lcIntroducion;
		private $lcMision;
		private $lcVision;
		private $lcHistoria;
		private $lcObjetivos;
		private $lcDireccion;
		private $lcNropreguntas;
		private $lcClavepredeterminada;
		private $lcNrointentos;
		private $lcTiempocaducida;
		private $lcTiempolapso;
		private $lcTiempoconexion;

		function set_Idconfiguracion($pcIdconfiguracion)
		{
			$this->lcIdconfiguracion=$pcIdconfiguracion;
		}

		function set_Introduccion($pcIntroduccion)
		{
			$this->lcIntroducion=$pcIntroduccion;
		}

		function set_Mision($pcMision)
		{
			$this->lcMision=$pcMision;
		}

		function set_Vision($pcVision)
		{
			$this->lcVision=$pcVision;
		}
	
		function set_Historia($pcHistoria)
		{
			$this->lcHistoria=$pcHistoria;
		}

		function set_Objetivos($pcObjetivos)
		{
			$this->lcObjetivos=$pcObjetivos;
		}

		function set_Direccion($pcDireccion)
		{
			$this->lcDireccion=$pcDireccion;
		}

		function set_Nropreguntas($pcNropreguntas)
		{
			$this->lcNropreguntas=$pcNropreguntas;
		}

		function set_Clavepredeterminada($pcClavepredeterminada)
		{
			$this->lcClavepredeterminada=$pcClavepredeterminada;
		}

		function set_Nrointentos($pcNrointentos)
		{
			$this->lcNrointentos=$pcNrointentos;
		}

		function set_Tiempocaducidad($pcTiempocaducidad)
		{
			$this->lcTiempocaducida=$pcTiempocaducidad;
		}
		function set_Tiempolapso($pcTiempolapso)
		{
			$this->lcTiempolapso=$pcTiempolapso;
		}
		function set_Tiempoconexion($pcTiempoconexion)
		{
			$this->lcTiempoconexion=$pcTiempoconexion;
		}
		
		function consultar_configuracion()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT `introducion`, `mision`, `vision`, `historia`,
					 `objetivos`, `direccion`, `nropreguntas`, `clavepredeterminada`, 
					 `nrointentos`, `tiempocaducida`,tiempolapso,tiempoconexion FROM `tsistema` ";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[0]=$laRow['introducion'];
					$Fila[1]=$laRow['mision'];
					$Fila[2]=$laRow['vision'];
					$Fila[3]=$laRow['historia'];
					$Fila[4]=$laRow['objetivos'];
					$Fila[5]=$laRow['direccion'];
					$Fila[6]=$laRow['nropreguntas'];
					$Fila[7]=$laRow['clavepredeterminada'];
					$Fila[8]=$laRow['nrointentos'];
					$Fila[9]=$laRow['tiempocaducida'];
					$Fila[10]=$laRow['tiempolapso'];
					$Fila[11]=$laRow['tiempoconexion'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_configuracion_bitacora()
		{
			$this->conectar();
				$sql="SELECT `idconfiguracion`,`introducion`, `mision`, `vision`, `historia`,
					 `objetivos`, `direccion`, `nropreguntas`, `clavepredeterminada`, 
					 `nrointentos`, `tiempocaducida`, `tiempolapso`,tiempoconexion FROM `tsistema`";
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

		function registrar_configuracion()
		{
			$this->conectar();
			$sql="INSERT INTO `tsistema`(`introducion`, `mision`, `vision`, `historia`, `objetivos`, `direccion`, `nropreguntas`, `clavepredeterminada`, `nrointentos`, `tiempocaducida`,tiempolapso,tiempoconexion)
			 VALUES ('$this->lcIntroducion','$this->lcMision','$this->lcVision','$this->lcHistoria','$this->lcObjetivos','$this->lcDireccion','$this->lcNropreguntas','$this->lcClavepredeterminada','$this->lcNrointentos','$this->lcTiempocaducida','$this->lcTiempolapso','$this->lcTiempoconexion')";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function editar_configuracion()
		{
			$this->conectar();
			$sql="UPDATE `tsistema` 
				SET `introducion`='$this->lcIntroducion',`mision`='$this->lcMision',`vision`='$this->lcVision',`historia`='$this->lcHistoria'
				,`objetivos`='$this->lcObjetivos',`direccion`='$this->lcDireccion',`nropreguntas`='$this->lcNropreguntas'
				,`clavepredeterminada`='$this->lcClavepredeterminada',`nrointentos`='$this->lcNrointentos',`tiempocaducida`='$this->lcTiempocaducida',`tiempolapso`='$this->lcTiempolapso',`tiempoconexion`='$this->lcTiempoconexion'
				WHERE idconfiguracion='$this->lcIdconfiguracion'";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}
	}
?>