<?php
	require_once('../nucleo/ModeloConect.php');
	class clsPersonal extends ModeloConect
	{

		private $lcIdPersonal;
		private $lcNacionalidad;
		private $lcNombreuno;
		private $lcNombredos;
		private $lcApellidouno;
		private $lcApellidodos;
		private $lcSexo;
		private $lcFecha;
		private $lcDireccion;
		private $lcTelefono;
		private $lcCargo;
		private $lcEstatus;
		private $lcDiagnostico;
		private $lcLocalidad;
		private $lcCorreo;

		function set_Personal($pcIdPersonal)
		{
			$this->lcIdPersonal=$pcIdPersonal;
		}

		function set_Nacionalidad($pcNacionalidad)
		{
			$this->lcNacionalidad=$pcNacionalidad;
		}

		function set_Nombreuno($pcNombreuno)
		{
			$this->lcNombreuno=$pcNombreuno;
		}

		function set_Nombredos($pcNombredos)
		{
			$this->lcNombredos=$pcNombredos;
		}

		function set_Apellidouno($pcApellidouno)
		{
			$this->lcApellidouno=$pcApellidouno;
		}

		function set_Apellidodos($pcApellidodos)
		{
			$this->lcApellidodos=$pcApellidodos;
		}

		function set_Sexo($pcSexo)
		{
			$this->lcSexo=$pcSexo;
		}

		function set_Fecha($pcFecha)
		{
			$this->lcFecha=$this->fecha_nacimiento($pcFecha);
		}

		function set_Direccion($pcDireccion)
		{
			$this->lcDireccion=$pcDireccion;
		}

		function set_Correo($pcCorreo)
		{
			$this->lcCorreo=$pcCorreo;
		}

		function set_Telefono($pcTelefono)
		{
			$this->lcTelefono=$pcTelefono;
		}

		function set_Cargo($pcCargo)
		{
			$this->lcCargo=$pcCargo;
		}

		function set_Estatus($pcEstatus)
		{
			$this->lcEstatusn=$pcEstatus;
		}

		function set_Diagnostico($pcDiagnostico)
		{
			$this->lcDiagnostico=$pcDiagnostico;
		}

		function set_Localidad($pcLocalidad)
		{
			$this->lcLocalidad=$pcLocalidad;
		}

		function consultar_personal()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT *,date_format(fechanacimientoper,'%d-%m-%Y') AS fechanacimientoper FROM `tpersonal`  WHERE estatusper='1'";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['idpersonal'];
					$Fila[$cont][1]=$laRow['nombreunoper'];
					$Fila[$cont][2]=$laRow['nombredosper'];
					$Fila[$cont][3]=$laRow['apellidounoper'];
					$Fila[$cont][4]=$laRow['apellidodosper'];
					$Fila[$cont][5]=$laRow['sexoper'];
					$Fila[$cont][6]=$laRow['fechanacimientoper'];
					$Fila[$cont][7]=$laRow['direccionper'];
					$Fila[$cont][8]=$laRow['telefonoper'];
					$Fila[$cont][9]=$laRow['cargoper'];
					$Fila[$cont][10]=$laRow['estatusper'];
					$Fila[$cont][11]=$laRow['tdiagnostico_iddiagnostico'];
					$Fila[$cont][12]=$laRow['correoper'];
					$Fila[$cont][13]=$laRow['tlocalidad_idlocalidad'];
					$Fila[$cont][14]=$laRow['nacionalidadper'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_personal_inactivos()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT *,date_format(fechanacimientoper,'%d-%m-%Y') AS fechanacimientoper FROM `tpersonal`  ";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['idpersonal'];
					$Fila[$cont][1]=$laRow['nombreunoper'];
					$Fila[$cont][2]=$laRow['nombredosper'];
					$Fila[$cont][3]=$laRow['apellidounoper'];
					$Fila[$cont][4]=$laRow['apellidodosper'];
					$Fila[$cont][5]=$laRow['sexoper'];
					$Fila[$cont][6]=$laRow['fechanacimientoper'];
					$Fila[$cont][7]=$laRow['direccionper'];
					$Fila[$cont][8]=$laRow['telefonoper'];
					$Fila[$cont][9]=$laRow['cargoper'];
					$Fila[$cont][10]=$laRow['estatusper'];
					$Fila[$cont][11]=$laRow['tdiagnostico_iddiagnostico'];
					$Fila[$cont][12]=$laRow['correoper'];
					$Fila[$cont][13]=$laRow['tlocalidad_idlocalidad'];
					$Fila[$cont][14]=$laRow['nacionalidadper'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_persona()
		{
			$this->conectar();
				$sql="SELECT *,date_format(fechanacimientoper,'%d-%m-%Y') AS fechanacimientoper FROM `tpersonal` WHERE idpersonal='$this->lcIdPersonal'";
				$pcsql=$this->filtro($sql);
				
				if($laRow=$this->proximo($pcsql))
				{
					$Fila[0]=$laRow['idpersonal'];
					$Fila[1]=$laRow['nombreunoper'];
					$Fila[2]=$laRow['nombredosper'];
					$Fila[3]=$laRow['apellidounoper'];
					$Fila[4]=$laRow['apellidodosper'];
					$Fila[5]=$laRow['sexoper'];
					$Fila[6]=$laRow['fechanacimientoper'];
					$Fila[7]=$laRow['direccionper'];
					$Fila[8]=$laRow['telefonoper'];
					$Fila[9]=$laRow['cargoper'];
					$Fila[10]=$laRow['estatusper'];
					$Fila[11]=$laRow['tdiagnostico_iddiagnostico'];
					$Fila[12]=$laRow['correoper'];
					$Fila[13]=$laRow['tlocalidad_idlocalidad'];
					$Fila[14]=$laRow['nacionalidadper'];
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_persona_bitacora()
		{
			$this->conectar();
				$sql="SELECT *,date_format(fechanacimientoper,'%d-%m-%Y') AS fechanacimientoper FROM tpersonal,tusuario WHERE idpersonal='$this->lcIdPersonal' AND idusuario='$this->lcIdPersonal'";
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

		function registrar_personal()
		{
			$this->conectar();
			$sql="INSERT INTO 
					`tpersonal`(nacionalidadper, `idpersonal`, `nombreunoper`, `nombredosper`, `apellidounoper`, `apellidodosper`, 
					`sexoper`, `fechanacimientoper`, `direccionper`, `telefonoper`, `cargoper`, `estatusper`, 
					`tdiagnostico_iddiagnostico`, `correoper`,tlocalidad_idlocalidad) 
				VALUES 
				('$this->lcNacionalidad', '$this->lcIdPersonal',UPPER('$this->lcNombreuno'),UPPER('$this->lcNombredos'),UPPER('$this->lcApellidouno'),UPPER('$this->lcApellidodos'),
					UPPER('$this->lcSexo'),'$this->lcFecha',UPPER('$this->lcDireccion'),'$this->lcTelefono',UPPER('$this->lcCargo'),'1',
					'$this->lcDiagnostico','$this->lcCorreo','$this->lcLocalidad')";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function eliminar_personal()
		{
			$this->conectar();
			$sql="UPDATE tpersonal SET estatusper='0' WHERE idpersonal='$this->lcIdPersonal' ";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function restaurar_personal()
		{
			$this->conectar();
			$sql="UPDATE tpersonal SET estatusper='1' WHERE idpersonal='$this->lcIdPersonal' ";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function editar_personal()
		{
			$this->conectar();
			$sql="UPDATE `tpersonal` 
					SET nacionalidadper='$this->lcNacionalidad', `nombreunoper`=UPPER('$this->lcNombreuno'),`nombredosper`=UPPER('$this->lcNombredos'),`apellidounoper`=UPPER('$this->lcApellidouno')
					,`apellidodosper`=UPPER('$this->lcApellidodos'),`sexoper`='$this->lcSexo',`fechanacimientoper`='$this->lcFecha'
					,`direccionper`=UPPER('$this->lcDireccion'),`telefonoper`='$this->lcTelefono',`cargoper`=UPPER('$this->lcCargo'), correoper='$this->lcCorreo'
					,`tdiagnostico_iddiagnostico`='$this->lcDiagnostico',tlocalidad_idlocalidad='$this->lcLocalidad' WHERE idpersonal='$this->lcIdPersonal'";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		protected function fecha_nacimiento($pcFecha)
		  {
		  	 $lcNow=date("Y-m-d");
		  	 if (strlen($pcFecha)==10)
		  	 {
		  	 	$lcDia=substr($pcFecha,0,2);
		  	 	$lcMes=substr($pcFecha,3,2);
		  	 	$lcAno=substr($pcFecha,6,4);
		  	 	$lcNow=$lcAno."-".$lcMes."-".$lcDia;
		  	 }
		  	 return $lcNow;
		  }
	}
?>