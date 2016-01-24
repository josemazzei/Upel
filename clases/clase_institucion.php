<?php

	require_once('../nucleo/ModeloConect.php');
	class clsInstitucion extends ModeloConect
	{
		private $lcIdInstitucion;
		private $lcDescripcioninst;
		private $lcEstatusinst;
		private $lcLocalidad;
		private $lcDirectorins;
		private $lcDireccionins;

		function set_Institucion($pcIdInstitucion)
		{
			$this->lcIdInstitucion=$pcIdInstitucion;
		}

		function set_Descripcion($pcDescripcionins)
		{
			$this->lcDescripcioninst=$pcDescripcionins;
		}

		function set_Estatus($pcEstatus)
		{
			$this->lcEstatusinst=$pcEstatus;
		}

		function set_Localidad($pcLocalidad)
		{
			$this->lcLocalidad=$pcLocalidad;
		}

		function set_Director($pcDirector)
		{
			$this->lcDirectorins=$pcDirector;
		}

		function set_Direccion($pcDireccion)
		{
			$this->lcDireccionins=$pcDireccion;
		}

		function consultar_institucion()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT `idinstitucion`, `descripcioninst`, `direccioninst`, `directorinst`, `estatusinst`, `tlocalidad_idlocalidad` FROM `tinstitucion` WHERE idinstitucion='$this->lcIdInstitucion' AND estatusinst='1';";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[0]=$laRow['idinstitucion'];
					$Fila[1]=$laRow['descripcioninst'];
					$Fila[2]=$laRow['direccioninst'];
					$Fila[3]=$laRow['directorinst'];
					$Fila[4]=$laRow['estatusinst'];
					$Fila[5]=$laRow['tlocalidad_idlocalidad'];
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_instituciones()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT `idinstitucion`, `descripcioninst`, `direccioninst`, `directorinst`, `estatusinst`, `tlocalidad_idlocalidad` FROM `tinstitucion` ";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['idinstitucion'];
					$Fila[$cont][1]=$laRow['descripcioninst'];
					$Fila[$cont][2]=$laRow['direccioninst'];
					$Fila[$cont][3]=$laRow['directorinst'];
					$Fila[$cont][4]=$laRow['estatusinst'];
					$Fila[$cont][5]=$laRow['tlocalidad_idlocalidad'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_instituciones_activas()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT `idinstitucion`, `descripcioninst`, `direccioninst`, `directorinst`, `estatusinst`, `tlocalidad_idlocalidad` FROM `tinstitucion` WHERE  estatusinst='1';";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['idinstitucion'];
					$Fila[$cont][1]=$laRow['descripcioninst'];
					$Fila[$cont][2]=$laRow['direccioninst'];
					$Fila[$cont][3]=$laRow['directorinst'];
					$Fila[$cont][4]=$laRow['estatusinst'];
					$Fila[$cont][5]=$laRow['tlocalidad_idlocalidad'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_dependencia()
		{
			$this->conectar();
			$dependencia=false;			
				$sql="SELECT * FROM tparticipante,tinscripcion WHERE tinscripcion.tinstitucion_idinstitucion='$this->lcIdInstitucion' OR tparticipante.tinstitucion_idinstitucion='$this->lcIdInstitucion' ";
				$pcsql=$this->filtro($sql);
				if($laRow=$this->proximo($pcsql))
				{
					$dependencia=true;
				}
			
			$this->desconectar();
			return $dependencia;
		}

		function consultar_institucion_bitacora()
		{
			$this->conectar();
				$sql="SELECT `idinstitucion`, `descripcioninst`, `direccioninst`, `directorinst`, `estatusinst`, `tlocalidad_idlocalidad` FROM `tinstitucion` WHERE idinstitucion='$this->lcIdInstitucion'  AND estatusinst='1';";
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

		function registrar_institucion()
		{
			$this->conectar();
			$sql="INSERT INTO `tinstitucion`
			(`descripcioninst`, `direccioninst`, `directorinst`, `estatusinst`, `tlocalidad_idlocalidad`) 
			VALUES (UPPER('$this->lcDescripcioninst'),UPPER('$this->lcDireccionins'),UPPER('$this->lcDirectorins'),'1','$this->lcLocalidad')";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function eliminar_institucion()
		{
			$this->conectar();
			$sql="UPDATE tinstitucion SET estatusinst='0' WHERE idinstitucion='$this->lcIdInstitucion' ";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function restaurar_institucion()
		{
			$this->conectar();
			$sql="UPDATE tinstitucion SET estatusinst='1' WHERE idinstitucion='$this->lcIdInstitucion' ";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function editar_institucion()
		{
			$this->conectar();
			$sql="UPDATE `tinstitucion` 
				SET `descripcioninst`=UPPER('$this->lcDescripcioninst'),`direccioninst`=UPPER('$this->lcDireccionins'),`directorinst`=UPPER('$this->lcDirectorins'),`tlocalidad_idlocalidad`='$this->lcLocalidad' WHERE idinstitucion='$this->lcIdInstitucion'";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}
	}
?>