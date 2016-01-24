<?php
	require_once('../nucleo/ModeloConect.php');
	class clsDocente extends ModeloConect
	{
		private $lcIdDocente;
		private $lcNombreuno;
		private $lcNacionalidad;
		private $lcNombredos;
		private $lcApellidouno;
		private $lcApellidodos;
		private $lcSexo;
		private $lcFecha;
		private $lcDireccion;
		private $lcTelefono;
		private $lcTitulo;
		private $lcTipo;
		private $lcEstatus;
		private $lcDiagnostico;
		private $lcLocalidad;

		function set_Docente($pcIdDocente)
		{
			$this->lcIdDocente=$pcIdDocente;
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

		function set_Telefono($pcTelefono)
		{
			$this->lcTelefono=$pcTelefono;
		}

		function set_Titulo($pcTitulo)
		{
			$this->lcTitulo=$pcTitulo;
		}

		function set_Tipo($pcTipo)
		{
			$this->lcTipo=$pcTipo;
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

		function consultar_docentes()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT *,date_format(fechanacimientodoc,'%d-%m-%Y') AS fechanacimientodoc FROM tdocente WHERE estatusdoc='1'";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['iddocente'];
					$Fila[$cont][1]=$laRow['nombreunodoc'];
					$Fila[$cont][2]=$laRow['nombredosdoc'];
					$Fila[$cont][3]=$laRow['apellidounodoc'];
					$Fila[$cont][4]=$laRow['apellidodosdoc'];
					$Fila[$cont][5]=$laRow['sexodoc'];
					$Fila[$cont][6]=$laRow['fechanacimientodoc'];
					$Fila[$cont][7]=$laRow['direcciondoc'];
					$Fila[$cont][8]=$laRow['telefonodoc'];
					$Fila[$cont][9]=$laRow['titulodoc'];
					$Fila[$cont][10]=$laRow['tipodoc'];
					$Fila[$cont][11]=$laRow['estatusdoc'];
					$Fila[$cont][12]=$laRow['tdiagnostico_iddiagnostico'];
					$Fila[$cont][13]=$laRow['tlocalidad_idlocalidad'];
					$Fila[$cont][14]=$laRow['nacionalidaddoc'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_docentes_inactivos()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT *,date_format(fechanacimientodoc,'%d-%m-%Y') AS fechanacimientodoc FROM tdocente";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['iddocente'];
					$Fila[$cont][1]=$laRow['nombreunodoc'];
					$Fila[$cont][2]=$laRow['nombredosdoc'];
					$Fila[$cont][3]=$laRow['apellidounodoc'];
					$Fila[$cont][4]=$laRow['apellidodosdoc'];
					$Fila[$cont][5]=$laRow['sexodoc'];
					$Fila[$cont][6]=$laRow['fechanacimientodoc'];
					$Fila[$cont][7]=$laRow['direcciondoc'];
					$Fila[$cont][8]=$laRow['telefonodoc'];
					$Fila[$cont][9]=$laRow['titulodoc'];
					$Fila[$cont][10]=$laRow['tipodoc'];
					$Fila[$cont][11]=$laRow['estatusdoc'];
					$Fila[$cont][12]=$laRow['tdiagnostico_iddiagnostico'];
					$Fila[$cont][13]=$laRow['tlocalidad_idlocalidad'];
					$Fila[$cont][14]=$laRow['nacionalidaddoc'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_docente()
		{
			$this->conectar();
				$sql="SELECT *,date_format(fechanacimientodoc,'%d-%m-%Y') AS fechanacimientodoc FROM tdocente WHERE iddocente='$this->lcIdDocente'";
				$pcsql=$this->filtro($sql);
				
				if($laRow=$this->proximo($pcsql))
				{
					$Fila[0]=$laRow['iddocente'];
					$Fila[1]=$laRow['nombreunodoc'];
					$Fila[2]=$laRow['nombredosdoc'];
					$Fila[3]=$laRow['apellidounodoc'];
					$Fila[4]=$laRow['apellidodosdoc'];
					$Fila[5]=$laRow['sexodoc'];
					$Fila[6]=$laRow['fechanacimientodoc'];
					$Fila[7]=$laRow['direcciondoc'];
					$Fila[8]=$laRow['telefonodoc'];
					$Fila[9]=$laRow['titulodoc'];
					$Fila[10]=$laRow['tipodoc'];
					$Fila[11]=$laRow['estatusdoc'];
					$Fila[12]=$laRow['tdiagnostico_iddiagnostico'];
					$Fila[13]=$laRow['tlocalidad_idlocalidad'];
					$Fila[14]=$laRow['nacionalidaddoc'];
				}
			
			$this->desconectar();
			return $Fila;
		}

		function listado_docente_diagnostico()
		{
			$cont=0;
			$this->conectar();
			$sql="SELECT *,date_format(fechanacimientodoc,'%d-%m-%Y') AS fechanacimientodoc,(YEAR(CURDATE())-YEAR(fechanacimientodoc))-(RIGHT(CURDATE(),5)<RIGHT(fechanacimientodoc,5))AS edad FROM tdocente WHERE tdiagnostico_iddiagnostico='$this->lcDiagnostico'";
			$pcsql=$this->filtro($sql);
			
			while($laRow=$this->proximo($pcsql))
			{
				$Fila[$cont][0]=$laRow['iddocente'];
				$Fila[$cont][1]=$laRow['nombreunodoc'];
				$Fila[$cont][2]=$laRow['nombredosdoc'];
				$Fila[$cont][3]=$laRow['apellidounodoc'];
				$Fila[$cont][4]=$laRow['apellidodosdoc'];
				$Fila[$cont][5]=$laRow['sexodoc'];
				$Fila[$cont][6]=$laRow['fechanacimientodoc'];
				$Fila[$cont][7]=$laRow['direcciondoc'];
				$Fila[$cont][8]=$laRow['telefonodoc'];
				$Fila[$cont][9]=$laRow['titulodoc'];
				$Fila[$cont][10]=$laRow['tipodoc'];
				$Fila[$cont][11]=$laRow['estatusdoc'];
				$Fila[$cont][12]=$laRow['tdiagnostico_iddiagnostico'];
				$Fila[$cont][13]=$laRow['tlocalidad_idlocalidad'];
				$Fila[$cont][14]=$laRow['nacionalidaddoc'];
				$Fila[$cont][15]=$laRow['edad'];
				$cont++;
			}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_docente_bitacora()
		{
			$this->conectar();
				$sql="SELECT *,date_format(fechanacimientodoc,'%d-%m-%Y') AS fechanacimientodoc FROM tdocente WHERE iddocente='$this->lcIdDocente'";
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

		function registrar_docente()
		{
			$this->conectar();
			$sql="INSERT INTO 
				`tdocente`(nacionalidaddoc, `iddocente`, `nombreunodoc`, `nombredosdoc`, `apellidounodoc`, `apellidodosdoc`, `sexodoc`, `fechanacimientodoc`, `direcciondoc`, `telefonodoc`, `titulodoc`, `tipodoc`, `estatusdoc`, `tdiagnostico_iddiagnostico`,tlocalidad_idlocalidad) 
				VALUES 
				('$this->lcNacionalidad',	'$this->lcIdDocente',UPPER('$this->lcNombreuno'),UPPER('$this->lcNombredos'),UPPER('$this->lcApellidouno'),
					UPPER('$this->lcApellidodos'),'$this->lcSexo','$this->lcFecha',UPPER('$this->lcDireccion')
					,'$this->lcTelefono',UPPER('$this->lcTitulo'),'$this->lcTipo','1','$this->lcDiagnostico','$this->lcLocalidad')";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function eliminar_docente()
		{
			$this->conectar();
			$sql="UPDATE tdocente SET estatusdoc='0' WHERE iddocente='$this->lcIdDocente' ";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function restaurar_docente()
		{
			$this->conectar();
			$sql="UPDATE tdocente SET estatusdoc='1' WHERE iddocente='$this->lcIdDocente' ";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function editar_docente()
		{
			$this->conectar();
			$sql="UPDATE `tdocente` 
				SET nacionalidaddoc='$this->lcNacionalidad', `nombreunodoc`=UPPER('$this->lcNombreuno'),`nombredosdoc`=UPPER('$this->lcNombredos'),`apellidounodoc`=UPPER('$this->lcApellidouno')
				,`apellidodosdoc`=UPPER('$this->lcApellidodos'),`sexodoc`='$this->lcSexo',`fechanacimientodoc`='$this->lcFecha'
				,`direcciondoc`=UPPER('$this->lcDireccion'),`telefonodoc`='$this->lcTelefono',`titulodoc`=UPPER('$this->lcTitulo'),`tipodoc`='$this->lcTipo'
				,`tdiagnostico_iddiagnostico`='$this->lcDiagnostico',tlocalidad_idlocalidad='$this->lcLocalidad' WHERE iddocente='$this->lcIdDocente'";
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