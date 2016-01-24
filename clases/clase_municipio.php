<?php

	require_once('../nucleo/ModeloConect.php');
	class clsMunicipio extends ModeloConect
	{
		private $lcIdMunicipio;
		private $lcNombre;

		function set_Municipio($pcIdMunicipio)
		{
			$this->lcIdMunicipio=$pcIdMunicipio;
		}

		function set_Nombre($pcNombre)
		{
			$this->lcNombre=$pcNombre;
		}

		function consultar_municipios_inactivos()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT idmunicipio,descripcionmun,estatusmun FROM tmunicipio ";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['idmunicipio'];
					$Fila[$cont][1]=$laRow['descripcionmun'];
					$Fila[$cont][2]=$laRow['estatusmun'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_municipios()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT idmunicipio,descripcionmun,estatusmun FROM tmunicipio WHERE estatusmun='1' ";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['idmunicipio'];
					$Fila[$cont][1]=$laRow['descripcionmun'];
					$Fila[$cont][2]=$laRow['estatusmun'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_municipio()
		{
			$this->conectar();
				$sql="SELECT idmunicipio,descripcionmun FROM tmunicipio WHERE idmunicipio='$this->lcIdMunicipio'";
				$pcsql=$this->filtro($sql);
				if($laRow=$this->proximo($pcsql))
				{
					$Fila[0]=$laRow['idmunicipio'];
					$Fila[1]=$laRow['descripcionmun'];
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_dependencia()
		{
			$this->conectar();
			$dependencia=false;			
				$sql="SELECT * FROM tlocalidad WHERE tmunicipio_municipio='$this->lcIdMunicipio' ";
				$pcsql=$this->filtro($sql);
				if($laRow=$this->proximo($pcsql))
				{
					$dependencia=true;
				}
			
			$this->desconectar();
			return $dependencia;
		}

		function registrar_municipio()
		{
			$this->conectar();
			$sql="INSERT INTO tmunicipio (descripcionmun)VALUES(UPPER('$this->lcNombre'))";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function eliminar_municipio()
		{
			$this->conectar();
			$sql="UPDATE tmunicipio SET estatusmun='0' WHERE idmunicipio='$this->lcIdMunicipio' ";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function restaurar_municipio()
		{
			$this->conectar();
			$sql="UPDATE tmunicipio SET estatusmun='1' WHERE idmunicipio='$this->lcIdMunicipio' ";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}
		
		function editar_municipio()
		{
			$this->conectar();
			$sql="UPDATE tmunicipio SET descripcionmun=UPPER('$this->lcNombre') WHERE idmunicipio='$this->lcIdMunicipio' ";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}
	}
?>