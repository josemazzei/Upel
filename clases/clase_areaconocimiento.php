<?php
	require_once('../nucleo/ModeloConect.php');
	class clsAreaconocimiento extends ModeloConect
	{
		private $lcIdarea;
		private $lcNombre;
		private $lcEstatus;

		function set_Area($pcIdArea)
		{
			$this->lcIdarea=$pcIdArea;
		}

		function set_Nombre($pcNombre)
		{
			$this->lcNombre=$pcNombre;
		}

		function set_Estatus($pcEstatus)
		{
			$this->lcEstatus=$pcEstatus;
		}

		function consultar_area()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT * FROM `tarea_conocimiento` WHERE `idarea_conocimiento`='$this->lcIdarea'";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[0]=$laRow['idarea_conocimiento'];
					$Fila[1]=$laRow['nombreare'];
					$Fila[2]=$laRow['estatusare'];
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_dependencia()
		{
			$this->conectar();
			$dependencia=false;			
				$sql="SELECT * FROM tasignatura WHERE tarea_idarea_conocimiento='$this->lcIdarea'";
				$pcsql=$this->filtro($sql);
				if($laRow=$this->proximo($pcsql))
				{
					$dependencia=true;
				}
			
			$this->desconectar();
			return $dependencia;
		}

		function consultar_areas()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT * FROM `tarea_conocimiento` WHERE  estatusare=1";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['idarea_conocimiento'];
					$Fila[$cont][1]=$laRow['nombreare'];
					$Fila[$cont][2]=$laRow['estatusare'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_areas_inactivas()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT * FROM `tarea_conocimiento`";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['idarea_conocimiento'];
					$Fila[$cont][1]=$laRow['nombreare'];
					$Fila[$cont][2]=$laRow['estatusare'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_area_bitacora()
		{
			$this->conectar();
				$sql="SELECT * FROM `tarea_conocimiento` WHERE `idarea_conocimiento`='$this->lcIdarea'";
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

		function registrar_area()
		{
			$this->conectar();
			$sql="INSERT INTO `tarea_conocimiento`( `nombreare`, `estatusare`) VALUES (UPPER('$this->lcNombre'),'1')";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function eliminar_area()
		{
			$this->conectar();
			$sql="UPDATE tarea_conocimiento SET estatusare='0' WHERE idarea_conocimiento='$this->lcIdarea' ";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function restaurar_area()
		{
			$this->conectar();
			$sql="UPDATE tarea_conocimiento SET estatusare='1' WHERE idarea_conocimiento='$this->lcIdarea' ";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function editar_area()
		{
			$this->conectar();
			$sql="UPDATE `tarea_conocimiento` SET `nombreare`=UPPER('$this->lcNombre') WHERE idarea_conocimiento='$this->lcIdarea'";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}
	}
?>