<?php
	require_once('../nucleo/ModeloConect.php');
	class clsDiagnostico extends ModeloConect
	{
		private $lcIdDiagnostico;
		private $lcNombre;
		private $lcEstatus;

		function set_Diagnostico($pcIdDiagnostico)
		{
			$this->lcIdDiagnostico=$pcIdDiagnostico;
		}

		function set_Nombre($pcNombre)
		{
			$this->lcNombre=$pcNombre;
		}

		function set_Estatus($pcEstatus)
		{
			$this->lcEstatus=$pcEstatus;
		}


		function consultar_diagnosticos()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT * FROM tdiagnostico WHERE estatusdia='1'";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['iddiagnostico'];
					$Fila[$cont][1]=$laRow['descripciondia'];
					$Fila[$cont][2]=$laRow['estatusdia'];

					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_diagnosticos_inactivos()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT * FROM tdiagnostico";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['iddiagnostico'];
					$Fila[$cont][1]=$laRow['descripciondia'];
					$Fila[$cont][2]=$laRow['estatusdia'];

					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_diagnostico()
		{
			$this->conectar();
				$sql="SELECT * FROM tdiagnostico WHERE iddiagnostico='$this->lcIdDiagnostico'";
				$pcsql=$this->filtro($sql);
				
				if($laRow=$this->proximo($pcsql))
				{
					$Fila[0]=$laRow['iddiagnostico'];
					$Fila[1]=$laRow['descripciondia'];
					$Fila[2]=$laRow['estatusdia'];
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_dependencia()
		{
			$this->conectar();
			$dependencia=false;			
				$sql="SELECT * FROM tparticipante,tpersonal,tdocente,tfamiliar WHERE tparticipante.tdiagnostico_iddiagnostico='$this->lcIdDiagnostico' OR tpersonal.tdiagnostico_iddiagnostico='$this->lcIdDiagnostico' OR tdocente.tdiagnostico_iddiagnostico='$this->lcIdDiagnostico' OR tfamiliar.tdiagnostico_iddiagnostico='$this->lcIdDiagnostico'";
				$pcsql=$this->filtro($sql);
				if($laRow=$this->proximo($pcsql))
				{
					$dependencia=true;
				}
			
			$this->desconectar();
			return $dependencia;
		}

		function consultar_diagnostico_bitacora()
		{
			$this->conectar();
				$sql="SELECT * FROM tdiagnostico WHERE iddiagnostico='$this->lcIdDiagnostico'";
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

		function registrar_diagnostico()
		{
			$this->conectar();
			$sql="INSERT INTO tdiagnostico (descripciondia)VALUES(UPPER('$this->lcNombre'))";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function eliminar_diagnostico()
		{
			$this->conectar();
			$sql="UPDATE tdiagnostico SET estatusdia='0' WHERE iddiagnostico='$this->lcIdDiagnostico' ";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function restaurar_diagnostico()
		{
			$this->conectar();
			$sql="UPDATE tdiagnostico SET estatusdia='1' WHERE iddiagnostico='$this->lcIdDiagnostico' ";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function editar_diagnostico()
		{
			$this->conectar();
			$sql="UPDATE tdiagnostico SET descripciondia=UPPER('$this->lcNombre') WHERE iddiagnostico='$this->lcIdDiagnostico' ";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}
	}
?>