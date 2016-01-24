<?php
	require_once('../nucleo/ModeloConect.php');
	class clsAula extends ModeloConect
	{

		private $lcIdaula;
		private $lcNombre;
		private $lcTipo;
		private $lcCapacidad;
		private $lcEstatus;

		function set_Aula($pcIdAula)
		{
			$this->lcIdaula=$pcIdAula;
		}

		function set_Nombre($pcNombre)
		{
			$this->lcNombre=$pcNombre;
		}

		function set_Tipo($pcTipo)
		{
			$this->lcTipo=$pcTipo;
		}

		function set_Capacidad($pcCapacidad)
		{
			$this->lcCapacidad=$pcCapacidad;
		}

		function set_Estatus($pcEstatus)
		{
			$this->lcEstatus=$pcEstatus;
		}

		function consultar_aula()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT * FROM `taula` WHERE `idaula`='$this->lcIdaula'";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[0]=$laRow['idaula'];
					$Fila[1]=$laRow['nombreaul'];
					$Fila[2]=$laRow['tipoaul'];
					$Fila[3]=$laRow['capacidadaul'];
					$Fila[4]=$laRow['estatusaul'];
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_dependencia()
		{
			$this->conectar();
			$dependencia=false;			
				$sql="SELECT * FROM tcurso WHERE taula_idaula='$this->lcIdaula'";
				$pcsql=$this->filtro($sql);
				if($laRow=$this->proximo($pcsql))
				{
					$dependencia=true;
				}
			
			$this->desconectar();
			return $dependencia;
		}

		function consultar_aulas()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT * FROM `taula` WHERE estatusaul='1'";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['idaula'];
					$Fila[$cont][1]=$laRow['nombreaul'];
					$Fila[$cont][2]=$laRow['tipoaul'];
					$Fila[$cont][3]=$laRow['capacidadaul'];
					$Fila[$cont][4]=$laRow['estatusaul'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_aulas_inactivas()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT * FROM `taula`";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['idaula'];
					$Fila[$cont][1]=$laRow['nombreaul'];
					$Fila[$cont][2]=$laRow['tipoaul'];
					$Fila[$cont][3]=$laRow['capacidadaul'];
					$Fila[$cont][4]=$laRow['estatusaul'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_aula_bitacora()
		{
			$this->conectar();
				$sql="SELECT * FROM `taula` WHERE `idaula`='$this->lcIdaula'";
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

		function registrar_aula()
		{
			$this->conectar();
			$sql="INSERT INTO `taula`(`nombreaul`, `tipoaul`, `capacidadaul`, `estatusaul`) 
			VALUES (UPPER('$this->lcNombre'),UPPER('$this->lcTipo'),'$this->lcCapacidad','1')";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function eliminar_aula()
		{
			$this->conectar();
			$sql="UPDATE taula SET estatusaul='0' WHERE idaula='$this->lcIdaula' ";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function restaurar_aula()
		{
			$this->conectar();
			$sql="UPDATE taula SET estatusaul='1' WHERE idaula='$this->lcIdaula' ";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function editar_aula()
		{
			$this->conectar();
			$sql="UPDATE `taula` SET `nombreaul`=UPPER('$this->lcNombre'), `tipoaul`=UPPER('$this->lcTipo'),`capacidadaul`='$this->lcCapacidad' WHERE idaula='$this->lcIdaula]'";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}
	}
?>