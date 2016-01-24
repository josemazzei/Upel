<?php

	require_once('../nucleo/ModeloConect.php');
	class clsUnidad_Medida extends ModeloConect
	{
		private $lcIdUnidad_Medida;
		private $lcNombre;

		function set_Unidad_Medida($pcIdUnidad_Medida)
		{
			$this->lcIdUnidad_Medida=$pcIdUnidad_Medida;
		}

		function set_Nombre($pcNombre)
		{
			$this->lcNombre=$pcNombre;
		}

		function consultar_unidad_medidas_inactivos()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT idTunidadMedida,Descripcion,Estatus FROM tunidadmedida ";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['idTunidadMedida'];
					$Fila[$cont][1]=$laRow['Descripcion'];
					$Fila[$cont][2]=$laRow['Estatus'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_unidad_medidas()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT idTunidadMedida,Descripcion,Estatus FROM tunidadmedida WHERE Estatus='1' ";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['idTunidadMedida'];
					$Fila[$cont][1]=$laRow['Descripcion'];
					$Fila[$cont][2]=$laRow['Estatus'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_unidad_medida()
		{
			$this->conectar();
				$sql="SELECT idTunidadMedida,Descripcion FROM tunidadmedida WHERE idTunidadMedida='$this->lcIdUnidad_Medida'";
				$pcsql=$this->filtro($sql);
				if($laRow=$this->proximo($pcsql))
				{
					$Fila[0]=$laRow['idTunidadMedida'];
					$Fila[1]=$laRow['Descripcion'];
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_dependencia()
		{
			$this->conectar();
			$dependencia=false;			
				$sql="SELECT * FROM tlocalidad WHERE tmunicipio_municipio='$this->lcIdUnidad_Medida' ";
				$pcsql=$this->filtro($sql);
				if($laRow=$this->proximo($pcsql))
				{
					$dependencia=true;
				}
			
			$this->desconectar();
			return $dependencia;
		}

		function registrar_unidad_medida()
		{
			$this->conectar();
			$sql="INSERT INTO tunidadmedida (Descripcion)VALUES(UPPER('$this->lcNombre'))";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function eliminar_unidad_medida()
		{
			$this->conectar();
			$sql="UPDATE tunidadmedida SET Estatus='0' WHERE idTunidadMedida='$this->lcIdUnidad_Medida' ";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function restaurar_unidad_medida()
		{
			$this->conectar();
			$sql="UPDATE tunidadmedida SET Estatus='1' WHERE idTunidadMedida='$this->lcIdUnidad_Medida' ";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}
		
		function editar_unidad_medida()
		{
			$this->conectar();
			$sql="UPDATE tunidadmedida SET Descripcion=UPPER('$this->lcNombre') WHERE idTunidadMedida='$this->lcIdUnidad_Medida' ";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}
	}
?>