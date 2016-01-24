<?php
	require_once('../nucleo/ModeloConect.php');
	class clsLocalidad extends ModeloConect
	{
		private $lcIdLocalidad;
		private $lcDescripcionloc;
		private $lcEstatusloc;
		private $lcMunicipio;

		function set_Localidad($pcIdLocalidad)
		{
			$this->lcIdLocalidad=$pcIdLocalidad;
		}

		function set_Descripcion($pcDescripcionloc)
		{
			$this->lcDescripcionloc=$pcDescripcionloc;
		}

		function set_Estatus($pcEstatus)
		{
			$this->lcEstatusloc=$pcEstatus;
		}

		function set_Municipio($pcMunicipio)
		{
			$this->lcMunicipio=$pcMunicipio;
		}

		function verificar()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT `idlocalidad`, `descripcionloc`, `estatusloc`, tlocalidad.`tmunicipio_municipio`, tmunicipio.descripcionmun FROM `tlocalidad`,tmunicipio WHERE descripcionloc='$this->lcDescripcionloc' AND tlocalidad.tmunicipio_municipio='$this->lcMunicipio'  AND tmunicipio.idmunicipio = tlocalidad.tmunicipio_municipio";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[0]=$laRow['idlocalidad'];
					$Fila[1]=$laRow['descripcionloc'];
					$Fila[2]=$laRow['estatusloc'];
					$Fila[3]=$laRow['tmunicipio_municipio'];
					$Fila[4]=$laRow['descripcionmun'];
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_localidad()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT `idlocalidad`, `descripcionloc`, `estatusloc`, tlocalidad.`tmunicipio_municipio`, tmunicipio.descripcionmun FROM `tlocalidad`,tmunicipio WHERE idlocalidad='$this->lcIdLocalidad' AND tmunicipio.idmunicipio = tlocalidad.tmunicipio_municipio";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[0]=$laRow['idlocalidad'];
					$Fila[1]=$laRow['descripcionloc'];
					$Fila[2]=$laRow['estatusloc'];
					$Fila[3]=$laRow['tmunicipio_municipio'];
					$Fila[4]=$laRow['descripcionmun'];
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_dependencia()
		{
			$this->conectar();
			$dependencia=false;			
				$sql="SELECT * FROM tinstitucion WHERE tinstitucion.tlocalidad_idlocalidad='$this->lcIdLocalidad' ";
				$pcsql=$this->filtro($sql);
				if($laRow=$this->proximo($pcsql))
				{
					$dependencia=true;
				}
				if(!$dependencia)
				{
					$sql="SELECT * FROM tdocente WHERE 
					 tdocente.tlocalidad_idlocalidad='$this->lcIdLocalidad' ";
					$pcsql=$this->filtro($sql);
					if($laRow=$this->proximo($pcsql))
					{
						$dependencia=true;
					}
				}

				if(!$dependencia)
				{
					$sql="SELECT * FROM tparticipante WHERE  tparticipante.tlocalidad_idlocalidad='$this->lcIdLocalidad' ";
					$pcsql=$this->filtro($sql);
					if($laRow=$this->proximo($pcsql))
					{
						$dependencia=true;
					}
				}

				if(!$dependencia)
				{
					$sql="SELECT * FROM tpersonal,tfamiliar WHERE  tpersonal.tlocalidad_idlocalidad='$this->lcIdLocalidad' ";
					$pcsql=$this->filtro($sql);
					if($laRow=$this->proximo($pcsql))
					{
						$dependencia=true;
					}
				}

				if(!$dependencia)
				{
					$sql="SELECT * FROM tfamiliar WHERE tfamiliar.tlocalidad_idlocalidad='$this->lcIdLocalidad'";
					$pcsql=$this->filtro($sql);
					if($laRow=$this->proximo($pcsql))
					{
						$dependencia=true;
					}
				}
			
			$this->desconectar();
			return $dependencia;
		}

		function consultar_localidades_inactivas()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT `idlocalidad`, `descripcionloc`, `estatusloc`, tlocalidad.`tmunicipio_municipio`, tmunicipio.descripcionmun FROM `tlocalidad`,tmunicipio WHERE tmunicipio.idmunicipio = tlocalidad.tmunicipio_municipio";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['idlocalidad'];
					$Fila[$cont][1]=$laRow['descripcionloc'];
					$Fila[$cont][2]=$laRow['estatusloc'];
					$Fila[$cont][3]=$laRow['tmunicipio_municipio'];
					$Fila[$cont][4]=$laRow['descripcionmun'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_localidades()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT `idlocalidad`, `descripcionloc`, `estatusloc`, tlocalidad.`tmunicipio_municipio`, tmunicipio.descripcionmun FROM `tlocalidad`,tmunicipio WHERE tmunicipio.idmunicipio = tlocalidad.tmunicipio_municipio AND estatusloc=1";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['idlocalidad'];
					$Fila[$cont][1]=$laRow['descripcionloc'];
					$Fila[$cont][2]=$laRow['estatusloc'];
					$Fila[$cont][3]=$laRow['tmunicipio_municipio'];
					$Fila[$cont][4]=$laRow['descripcionmun'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_localidad_bitacora()
		{
			$this->conectar();
				$sql="SELECT `idlocalidad`, `descripcionloc`, `estatusloc`, `tmunicipio_municipio` FROM `tlocalidad` WHERE idlocalidad='$this->lcIdLocalidad'";
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

		function registrar_localidad()
		{
			$this->conectar();
			$sql="INSERT INTO `tlocalidad`(`descripcionloc`, `estatusloc`, `tmunicipio_municipio`) 
			VALUES (UPPER('$this->lcDescripcionloc'),'1','$this->lcMunicipio')";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function eliminar_localidad()
		{
			$this->conectar();
			$sql="UPDATE tlocalidad SET estatusloc='0' WHERE idlocalidad='$this->lcIdLocalidad' ";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function restaurar_localidad()
		{
			$this->conectar();
			$sql="UPDATE tlocalidad SET estatusloc='1' WHERE idlocalidad='$this->lcIdLocalidad' ";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function editar_localidad()
		{
			$this->conectar();
			$sql="UPDATE `tlocalidad` SET `descripcionloc`=UPPER('$this->lcDescripcionloc'),`tmunicipio_municipio`='$this->lcMunicipio' WHERE idlocalidad='$this->lcIdLocalidad'";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}
	}
?>