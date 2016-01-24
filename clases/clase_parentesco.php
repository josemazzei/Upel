<?php
	require_once('../nucleo/ModeloConect.php');
	class clsParentesco extends ModeloConect
	{
		private $lcIdParentesco;
		private $lcNombre;
		private $lcEstatus;

		function set_Parentesco($pcIdParentesco)
		{
			$this->lcIdParentesco=$pcIdParentesco;
		}

		function set_Nombre($pcNombre)
		{
			$this->lcNombre=$pcNombre;
		}

		function set_Estatus($pcEstatus)
		{
			$this->lcEstatus=$pcEstatus;
		}

		function consultar_parentescos()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT * FROM tparentesco WHERE estatuspar='1'";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['idparentesco'];
					$Fila[$cont][1]=$laRow['descripcionpar'];
					$Fila[$cont][2]=$laRow['estatuspar'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_parentescos_inactivos()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT * FROM tparentesco ";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['idparentesco'];
					$Fila[$cont][1]=$laRow['descripcionpar'];
					$Fila[$cont][2]=$laRow['estatuspar'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_parentesco()
		{
			$this->conectar();
				$sql="SELECT * FROM tparentesco WHERE idparentesco='$this->lcIdParentesco'";
				$pcsql=$this->filtro($sql);
				
				if($laRow=$this->proximo($pcsql))
				{
					$Fila[0]=$laRow['idparentesco'];
					$Fila[1]=$laRow['descripcionpar'];
					$Fila[2]=$laRow['estatuspar'];
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_dependencia()
		{
			$this->conectar();
			$dependencia=false;			
				$sql="SELECT * FROM participante_familiar WHERE idparentesco='$this->lcIdParentesco'";
				$pcsql=$this->filtro($sql);
				if($laRow=$this->proximo($pcsql))
				{
					$dependencia=true;
				}
			
			$this->desconectar();
			return $dependencia;
		}

		function consultar_parentesco_bitacora()
		{
			$this->conectar();
				$sql="SELECT * FROM tparentesco WHERE idparentesco='$this->lcIdParentesco'";
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

		function registrar_parentesco()
		{
			$this->conectar();
			$sql="INSERT INTO tparentesco (descripcionpar)VALUES(UPPER('$this->lcNombre'))";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function eliminar_parentesco()
		{
			$this->conectar();
			$sql="UPDATE tparentesco SET estatuspar='0' WHERE idparentesco='$this->lcIdParentesco' ";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function restaurar_parentesco()
		{
			$this->conectar();
			$sql="UPDATE tparentesco SET estatuspar='1' WHERE idparentesco='$this->lcIdParentesco' ";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function editar_parentesco()
		{
			$this->conectar();
			$sql="UPDATE tparentesco SET descripcionpar=UPPER('$this->lcNombre') WHERE idparentesco='$this->lcIdParentesco' ";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}
	}
?>