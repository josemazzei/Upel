<?php

	require_once('../nucleo/ModeloConect.php');
	class clsInstrumento extends ModeloConect
	{
		private $lcIdInstrumento;
		private $lcNombre;
		private $lcAsignatura;
		private $lcItem;
		private $lcEspacio;
		private $lcEstatus;

		function set_Instrumento($pcIdInstrumento)
		{
			$this->lcIdInstrumento=$pcIdInstrumento;
		}

		function set_Nombre($pcNombre)
		{
			$this->lcNombre=$pcNombre;
		}

		function set_Asignatura($pcAsignatura)
		{
			$this->lcAsignatura=$pcAsignatura;
		}

		function set_Item($pcItem)
		{
			$this->lcItem=$pcItem;
		}

		function set_Espacio($pcEspacio)
		{
			$this->lcEspacio=$pcEspacio;
		}

		function set_Estatus($pcEstatus)
		{
			$this->lcEstatus=$pcEstatus;
		}



		function consultar_instrumento()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT * FROM `tinstrumento`,tasignatura WHERE `idinstrumento`='$this->lcIdInstrumento' AND tasignatura_idasignatura=idasignatura";
				$pcsql=$this->filtro($sql);
				if($laRow=$this->proximo($pcsql))
				{
					$Fila[0]=$laRow['idinstrumento'];
					$Fila[1]=$laRow['nombreins'];
					$Fila[2]=$laRow['nombreasi'];
					$Fila[3]=$laRow['estatusins'];
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_dependencia()
		{
			$this->conectar();
			$dependencia=false;			
				$sql="SELECT * FROM tevaluacion WHERE tinstrumento_idinstrumento='$this->lcIdInstrumento'";
				$pcsql=$this->filtro($sql);
				if($laRow=$this->proximo($pcsql))
				{
					$dependencia=true;
				}
			
			$this->desconectar();
			return $dependencia;
		}

		function consultar_instrumentos()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT * FROM `tinstrumento`,tasignatura WHERE tasignatura_idasignatura=idasignatura AND estatusins='1'";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$i][0]=$laRow['idinstrumento'];
					$Fila[$i][1]=$laRow['nombreins'];
					$Fila[$i][2]=$laRow['nombreasi'];
					$Fila[$i][3]=$laRow['estatusins'];
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_instrumentos_inactivas()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT * FROM `tinstrumento`,tasignatura WHERE tasignatura_idasignatura=idasignatura";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['idinstrumento'];
					$Fila[$cont][1]=$laRow['nombreins'];
					$Fila[$cont][2]=$laRow['nombreasi'];
					$Fila[$cont][3]=$laRow['estatusins'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_items()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT * FROM tinstrumento_item WHERE tinstrumento_idinstrumento='$this->lcIdInstrumento'";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['tinstrumento_idinstrumento'];
					$Fila[$cont][1]=$laRow['titem_iditem'];
					$Fila[$cont][2]=$laRow['espacio'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_items_instrumento()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT * FROM tinstrumento,tinstrumento_item,`titem` WHERE idinstrumento='$this->lcIdInstrumento' AND tinstrumento_idinstrumento=idinstrumento AND titem_iditem=iditem";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['iditem'];
					$Fila[$cont][1]=$laRow['nombreite'];
					$Fila[$cont][2]=$laRow['tipoite'];
					$Fila[$cont][3]=$laRow['estatusite'];
					$Fila[$cont][4]=$laRow['descripcionite'];
					$Fila[$cont][6]=$laRow['espacio'];
					$Fila[$cont][5]=array();
					$sql="SELECT * FROM `tvalor_item` WHERE titem_iditem='".$laRow['iditem']."' ORDER BY idvalor_item ASC";
					$pcsql2=$this->filtro($sql);
					$cont2=0;
					while($laRow2=$this->proximo($pcsql2))
					{
						$Fila[$cont][5][$cont2]=$laRow2['valorval'];
						$cont2++;
					}
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_instrumento_bitacora()
		{
			$this->conectar();
				$sql="SELECT * FROM `tinstrumento`,tasignatura WHERE `idinstrumento`='$this->lcIdInstrumento' AND tasignatura_idasignatura=idasignatura";

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

		function registrar_instrumento()
		{
			$this->conectar();
			$this->begin();
			$sql="INSERT INTO `tinstrumento`(`nombreins`, tasignatura_idasignatura,`estatusins`) 
			VALUES (UPPER('$this->lcNombre'),'$this->lcAsignatura','1')";
			$lnHecho=$this->ejecutar($sql);
			if((count($this->lcItem)>0)&&($lnHecho))
			{

				$sql="SELECT MAX(idinstrumento)as maximo FROM tinstrumento";
				$pcsql=$this->filtro($sql);
				if($laRow=$this->proximo($pcsql))
				{
					$this->lcIdInstrumento=$laRow['maximo'];
				}
				for ($i=0; $i<count($this->lcItem) ; $i++) 
				{ 
					$idtem=$this->lcItem[$i];
					$espacio=$this->lcEspacio[$i];
					$sql="INSERT INTO `tinstrumento_item`(tinstrumento_idinstrumento, titem_iditem ,espacio) 
					VALUES ('$this->lcIdInstrumento','$idtem','$espacio')";
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

		function eliminar_instrumento()
		{
			$this->conectar();
			$sql="UPDATE tinstrumento SET estatusins='0' WHERE idinstrumento='$this->lcIdInstrumento' ";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function restaurar_instrumento()
		{
			$this->conectar();
			$sql="UPDATE tinstrumento SET estatusins='1' WHERE idinstrumento='$this->lcIdInstrumento' ";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}
		
		function editar_instrumento()
		{
			$this->conectar();
			$this->begin();
			$sql="UPDATE `tinstrumento` SET `nombreins`=UPPER('$this->lcNombre'), `tasignatura_idasignatura`=UPPER('$this->lcAsignatura') WHERE idinstrumento='$this->lcIdInstrumento'";
			$lnHecho=$this->ejecutar($sql);
			if(count($this->lcItem)>0)
			{
				$sql="DELETE FROM `tinstrumento_item` WHERE tinstrumento_idinstrumento='$this->lcIdInstrumento'";
				$lnHecho=$this->ejecutar($sql);
				for ($i=0; $i<count($this->lcItem) ; $i++) 
				{ 
					$iditem=$this->lcItem[$i];
					$espacio=$this->lcEspacio[$i];					
					$sql="INSERT INTO `tinstrumento_item`(tinstrumento_idinstrumento, titem_iditem ,espacio) 
					VALUES ('$this->lcIdInstrumento','$iditem','$espacio')";
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