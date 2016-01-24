<?php
	require_once('../nucleo/ModeloConect.php');
	class clsFamiliar extends ModeloConect
	{
		private $lcIdFamiiar;
		private $lcNacionalidadfam;
		private $lcIdParticipante;
		private $lcNombreuno;
		private $lcNombredos;
		private $lcApellidouno;
		private $lcApellidodos;
		private $lcSexo;
		private $lcFecha;
		private $lcDireccion;
		private $lcTelefono;
		private $lcOcupacion;
		private $lcGradoInstuccion;
		private $lcNumHijos;
		private $lcIngreso;
		private $lcEstatus;
		private $lcDiagnostico;
		private $lcLocalidad;
		private $lcIdParentesco;
		private $lcRepresentante;

		function set_Familiar($pcIdFamiliar)
		{
			$this->lcIdFamiliar=$pcIdFamiliar;
		}

		function set_Participante($pcIdParticipante)
		{
			$this->lcIdParticipante=$pcIdParticipante;
		}

		function set_Nacionalidadfam($pcNacionalidadfam)
		{
			$this->lcNacionalidadfam=$pcNacionalidadfam;
		}

		function set_Parentesco($pcIdParentesco)
		{
			$this->lcIdParentesco=$pcIdParentesco;
		}

		function set_Representante($pcRepresentante)
		{
			$this->lcRepresentante=$pcRepresentante;
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

		function set_Ocupacion($pcOcupacion)
		{
			$this->lcOcupacion=$pcOcupacion;
		}

		function set_GradoInstuccion($pcGradoInstuccion)
		{
			$this->lcGradoInstuccion=$pcGradoInstuccion;
		}

		function set_NumHijos($pcNumHijos)
		{
			$this->lcNumHijos=$pcNumHijos;
		}

		function set_Ingreso($pcIngreso)
		{
			$this->lcIngreso=$pcIngreso;
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

		function consultar_familiares()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT *,date_format(fechanacimientofam,'%d-%m-%Y') AS fechanacimientofam FROM tfamiliar WHERE estatusfam='1'";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['idfamiliar'];
					$Fila[$cont][1]=$laRow['nombreunofam'];
					$Fila[$cont][2]=$laRow['nombredosfam'];
					$Fila[$cont][3]=$laRow['apellidounofam'];
					$Fila[$cont][4]=$laRow['apellidodosfam'];
					$Fila[$cont][5]=$laRow['sexofam'];
					$Fila[$cont][6]=$laRow['fechanacimientofam'];
					$Fila[$cont][7]=$laRow['direccionfam'];
					$Fila[$cont][8]=$laRow['telefonofam'];
					$Fila[$cont][9]=$laRow['titulofam'];
					$Fila[$cont][10]=$laRow['tipofam'];
					$Fila[$cont][11]=$laRow['estatusfam'];
					$Fila[$cont][12]=$laRow['tdiagnostico_iddiagnostico'];
					$Fila[$cont][13]=$laRow['tlocalidad_idlocalidad'];
					$Fila[$cont][14]=$laRow['nacionalidadfam'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_familiares_inactivos()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT *,date_format(fechanacimientofam,'%d-%m-%Y') AS fechanacimientofam FROM tfamiliar ";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['idfamiliar'];
					$Fila[$cont][1]=$laRow['nombreunofam'];
					$Fila[$cont][2]=$laRow['nombredosfam'];
					$Fila[$cont][3]=$laRow['apellidounofam'];
					$Fila[$cont][4]=$laRow['apellidodosfam'];
					$Fila[$cont][5]=$laRow['sexofam'];
					$Fila[$cont][6]=$laRow['fechanacimientofam'];
					$Fila[$cont][7]=$laRow['direccionfam'];
					$Fila[$cont][8]=$laRow['telefonofam'];
					$Fila[$cont][9]=$laRow['titulofam'];
					$Fila[$cont][10]=$laRow['tipofam'];
					$Fila[$cont][11]=$laRow['estatusfam'];
					$Fila[$cont][12]=$laRow['tdiagnostico_iddiagnostico'];
					$Fila[$cont][13]=$laRow['tlocalidad_idlocalidad'];
					$Fila[$cont][14]=$laRow['nacionalidadfam'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_familiar()
		{
			$this->conectar();
				$sql="SELECT *,date_format(fechanacimientofam,'%d-%m-%Y') AS fechanacimientofam FROM tfamiliar WHERE idfamiliar='$this->lcIdFamiliar'";
				$pcsql=$this->filtro($sql);
				
				if($laRow=$this->proximo($pcsql))
				{
					$Fila[0]=$laRow['idfamiliar'];
					$Fila[1]=$laRow['nombreunofam'];
					$Fila[2]=$laRow['nombredosfam'];
					$Fila[3]=$laRow['apellidounofam'];
					$Fila[4]=$laRow['apellidodosfam'];
					$Fila[5]=$laRow['sexofam'];
					$Fila[6]=$laRow['fechanacimientofam'];
					$Fila[7]=$laRow['direccionfam'];
					$Fila[8]=$laRow['telefonofam'];
					$Fila[9]=$laRow['titulofam'];
					$Fila[10]=$laRow['tipofam'];
					$Fila[11]=$laRow['estatusfam'];
					$Fila[12]=$laRow['tdiagnostico_iddiagnostico'];
					$Fila[13]=$laRow['tlocalidad_idlocalidad'];
					$Fila[14]=$laRow['nacionalidadfam'];
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_familiar_bitacora()
		{
			$this->conectar();
				$sql="SELECT *,tfamiliar_idfamiliar,apellidounofam,nombreunofam FROM participante_familiar,tfamiliar WHERE tparticipante_idparticipante='$this->lcIdParticipante' AND tfamiliar_idfamiliar=idfamiliar ";
				$pcsql=$this->filtro($sql);
				$cont=0;
				while($laRow=$this->proximo($pcsql))
				{
					foreach ($laRow as $key => $value)
					{
						$Fila[$cont][$key]=$value;
					}
					$cont++;
				}
			$this->desconectar();
			return $Fila;
		}

		function consultar_familiar_2()
		{
			$this->conectar();
				$sql="SELECT *,date_format(fechanacimientofam,'%d-%m-%Y')as fechanacimientofam FROM tfamiliar WHERE idfamiliar='$this->lcIdFamiliar'";
				$pcsql=$this->filtro($sql);
				$cont=0;
				if($laRow=$this->proximo($pcsql))
				{
					$Fila=$laRow;
				}
			$this->desconectar();
			return $Fila;
		}


		function consultar_participante_familiar()
		{
			$this->conectar();
				$sql="SELECT *,tfamiliar_idfamiliar,apellidounofam,nombreunofam FROM participante_familiar,tfamiliar WHERE tparticipante_idparticipante='$this->lcIdParticipante' AND tfamiliar_idfamiliar=idfamiliar ";
				$pcsql=$this->filtro($sql);
				$cont=0;
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont]['idfamiliar']=$laRow['tfamiliar_idfamiliar'];
					$Fila[$cont]['nombrefam']=$laRow['apellidounofam'].' '.$laRow['nombreunofam'];
					$Fila[$cont]['idparentesco']=$laRow['idparentesco'];
					$Fila[$cont]['representante']=$laRow['representante'];
					$cont++;
				}
			$this->desconectar();
			return $Fila;
		}

		function registrar_familiar()
		{
			$this->conectar();
			$sql="INSERT INTO 
				`tfamiliar`(nacionalidadfam, `idfamiliar`, `nombreunofam`, `nombredosfam`, `apellidounofam`, `apellidodosfam`, `sexofam`, `fechanacimientofam`, `direccionfam`, `telefonofam`, `ocupacionfam`, `gradoinstrucfam`,numhijofam,ingresofam, `estatusfam`, `tdiagnostico_iddiagnostico`,tlocalidad_idlocalidad) 
				VALUES 
				('$this->lcNacionalidadfam', '$this->lcIdFamiliar',UPPER('$this->lcNombreuno'),UPPER('$this->lcNombredos')
					,UPPER('$this->lcApellidouno'),UPPER('$this->lcApellidodos'),'$this->lcSexo'
					,'$this->lcFecha',UPPER('$this->lcDireccion'),'$this->lcTelefono'
					,UPPER('$this->lcOcupacion'),UPPER('$this->lcGradoInstuccion'),
					'$this->lcNumHijos','$this->lcIngreso','1','$this->lcDiagnostico','$this->lcLocalidad')";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function registrar_participante_familiar()
		{
			$this->conectar();
			$sql="INSERT INTO `participante_familiar`(`tparticipante_idparticipante`, `tfamiliar_idfamiliar`, `idparentesco`, `representante`) VALUES ('$this->lcIdParticipante','$this->lcIdFamiliar','$this->lcIdParentesco','$this->lcRepresentante')";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function suprimir_participante_familiar()
		{
			$this->conectar();
			$sql="DELETE FROM participante_familiar WHERE `tparticipante_idparticipante`='$this->lcIdParticipante'";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function eliminar_participante_familiar()
		{
			$this->conectar();
			$sql="UPDATE participante_familiar SET estatus='0' WHERE `tparticipante_idparticipante`='$this->lcIdParticipante'";
			echo $sql;
			
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function restaurar_participante_familiar()
		{
			$this->conectar();
			$sql="UPDATE participante_familiar SET estatus='1' WHERE `tparticipante_idparticipante`='$this->lcIdParticipante'";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function eliminar_familiar()
		{
			$this->conectar();
			$sql="UPDATE tfamiliar SET estatusfam='0' WHERE idfamiliar='$this->lcIdFamiliar' ";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function restaurar_familiar()
		{
			$this->conectar();
			$sql="UPDATE tfamiliar SET estatusfam='1' WHERE idfamiliar='$this->lcIdFamiliar' ";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function editar_familiar()
		{
			$this->conectar();
			$sql="UPDATE `tfamiliar` 
				SET nacionalidadfam='$this->lcNacionalidadfam', `nombreunofam`=UPPER('$this->lcNombreuno'),`nombredosfam`=UPPER('$this->lcNombredos')
				,`apellidounofam`=UPPER('$this->lcApellidouno')
				,`apellidodosfam`=UPPER('$this->lcApellidodos'),`sexofam`='$this->lcSexo'
				,`fechanacimientofam`='$this->lcFecha'
				,`direccionfam`=UPPER('$this->lcDireccion'),`telefonofam`='$this->lcTelefono'
				,`ocupacionfam`=UPPER('$this->lcOcupacion'),`gradoinstrucfam`=UPPER('$this->lcGradoInstuccion'),`numhijofam`='$this->lcNumHijos',`ingresofam`='$this->lcIngreso'
				,`tdiagnostico_iddiagnostico`='$this->lcDiagnostico',tlocalidad_idlocalidad='$this->lcLocalidad' WHERE idfamiliar='$this->lcIdFamiliar'";
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