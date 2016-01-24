<?php

	require_once('../nucleo/ModeloConect.php');
	class clsItem extends ModeloConect
	{
		private $lcIditem;
		private $lcNombre;
		private $lcDescripcion;
		private $lcTipo;
		private $lcEstatus;
		private $lcValor;

		function set_Item($pcIdItem)
		{
			$this->lcIditem=$pcIdItem;
		}

		function set_Nombre($pcNombre)
		{
			$this->lcNombre=$pcNombre;
		}

		function set_Descripcion($pcDescripcion)
		{
			$this->lcDescripcion=$pcDescripcion;
		}

		function set_Valor($pcValor)
		{
			$this->lcValor=$pcValor;
		}

		function set_Estatus($pcEstatus)
		{
			$this->lcEstatus=$pcEstatus;
		}

		function set_Tipo($pcTipo)
		{
			$this->lcTipo=$pcTipo;
		}


		function consultar_item()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT * FROM `titem` WHERE `iditem`='$this->lcIditem'";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[0]=$laRow['iditem'];
					$Fila[1]=$laRow['nombreite'];
					$Fila[2]=$laRow['tipoite'];
					$Fila[3]=$laRow['estatusite'];
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_dependencia()
		{
			$this->conectar();
			$dependencia=false;			
				$sql="SELECT * FROM tinstrumento_item WHERE titem_iditem='$this->lcIditem'";
				$pcsql=$this->filtro($sql);
				if($laRow=$this->proximo($pcsql))
				{
					$dependencia=true;
				}
			
			$this->desconectar();
			return $dependencia;
		}

		function consultar_items()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT * FROM `titem`";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['iditem'];
					$Fila[$cont][1]=$laRow['nombreite'];
					$Fila[$cont][2]=$laRow['tipoite'];
					$Fila[$cont][3]=$laRow['estatusite'];
					$Fila[$cont][4]=$laRow['descripcionite'];
					$Fila[$cont][5]=array();
					$sql="SELECT * FROM `tvalor_item` WHERE titem_iditem='".$laRow['iditem']."' ORDER BY idvalor_item ASC";
					$pcsql2=$this->filtro($sql);
					while($laRow2=$this->proximo($pcsql2))
					{
						array_push($Fila[$cont][5],$laRow2['valorval']);
					}
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_items_inactivas()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT * FROM `titem`";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['iditem'];
					$Fila[$cont][1]=$laRow['nombreite'];
					$Fila[$cont][2]=$laRow['tipoite'];
					$Fila[$cont][3]=$laRow['descripcionite'];
					$Fila[$cont][4]=$laRow['estatusite'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_item_valor()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT * FROM `tvalor_item` WHERE titem_iditem='$this->lcIditem' ORDER BY idvalor_item ASC";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['idvalor_item'];
					$Fila[$cont][1]=$laRow['valorval'];
					$Fila[$cont][2]=$laRow['estatusval'];
					$Fila[$cont][3]=$laRow['titem_iditem'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_item_bitacora()
		{
			$this->conectar();
				$sql="SELECT * FROM `titem` WHERE `iditem`='$this->lcIditem'";
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

		function registrar_item()
		{
			$this->conectar();
			$this->begin();
			$sql="INSERT INTO `titem`(`nombreite`, descripcionite,`tipoite`, `estatusite`) 
			VALUES (UPPER('$this->lcNombre'),UPPER('$this->lcDescripcion'),'$this->lcTipo','1')";
			$lnHecho=$this->ejecutar($sql);
			if(count($this->lcValor)>0)
			{
				$sql="SELECT MAX(iditem)as maximo FROM titem";
				$pcsql=$this->filtro($sql);
				if($laRow=$this->proximo($pcsql))
				{
					$this->lcIditem=$laRow['maximo'];
				}
				for ($i=0; $i<count($this->lcValor) ; $i++) 
				{ 
					$valor=$this->lcValor[$i];
					$sql="INSERT INTO `tvalor_item`(valorval, titem_iditem ,estatusval) 
					VALUES (UPPER('$valor'),'$this->lcIditem','1')";
					$lnHecho=$this->ejecutar($sql);
				}
			}
			if($lnHecho)
				$this->commit();
			else
				$this->rollback();

			$this->desconectar();
			return $lnHecho;
		}

		function eliminar_item()
		{
			$this->conectar();
			$sql="UPDATE titem SET estatusite='0' WHERE iditem='$this->lcIditem' ";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function restaurar_item()
		{
			$this->conectar();
			$sql="UPDATE titem SET estatusite='1' WHERE iditem='$this->lcIditem' ";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}
		
		function editar_item()
		{
			$this->conectar();
			$this->begin();
			$sql="UPDATE `titem` SET `nombreite`=UPPER('$this->lcNombre'), `descripcionite`=UPPER('$this->lcDescripcion'),`tipoite`='$this->lcTipo' WHERE iditem='$this->lcIditem'";
			$lnHecho=$this->ejecutar($sql);
			if(count($this->lcValor)>0)
			{
				$sql="DELETE FROM `tvalor_item` WHERE titem_iditem='$this->lcIditem'";
				$lnHecho=$this->ejecutar($sql);
				for ($i=0; $i<count($this->lcValor) ; $i++) 
				{ 
					$valor=$this->lcValor[$i];
					$sql="INSERT INTO `tvalor_item`(valorval, titem_iditem ,estatusval) 
					VALUES (UPPER('$valor'),'$this->lcIditem','1')";
					$lnHecho=$this->ejecutar($sql);
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