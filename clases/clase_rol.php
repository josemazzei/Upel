<?php

	require_once('../nucleo/ModeloConect.php');
	class clsRol extends ModeloConect
	{
		private $lcIdRol;
		private $lcNombre;
		private $lcModulo;
		private $lcOrden;
		private $lcServicio;

		function set_Rol($pcIdRol)
		{
			$this->lcIdRol=$pcIdRol;
		}

		function set_Nombre($pcNombre)
		{
			$this->lcNombre=$pcNombre;
		}

		function set_Modulo($pcModulo)
		{
			$this->lcModulo=$pcModulo;
		}

			function set_Orden($pcOrden)
		{
			$this->lcOrden=$pcOrden;
		}

		function set_Servicio($pcServicio)
		{
			$this->lcServicio=$pcServicio;
		}

		function consultar_roles()
		{
			$this->conectar();
			$cont=0;
			$sql="SELECT * FROM trol ";
			$pcsql=$this->filtro($sql);
			while($laRow=$this->proximo($pcsql))
			{
				$Fila[$cont][0]=$laRow['idrol'];
				$Fila[$cont][1]=$laRow['nombrerol'];
				$Fila[$cont][2]=$laRow['estatusrol'];
				$cont++;
			}
			$this->desconectar();
			return $Fila;
		}

		function consultar_dependencia()
		{
			$this->conectar();
			$dependencia=false;			
				$sql="SELECT * FROM tusuario,tmodulo_trol,tservicio_trol WHERE tusuario.trol_idrol='$this->lcIdRol' OR tmodulo_trol.idrol='$this->lcIdRol' OR tservicio_trol.idrol='$this->lcIdRol'";
				$pcsql=$this->filtro($sql);
				if($laRow=$this->proximo($pcsql))
				{
					$dependencia=true;
				}
			
			$this->desconectar();
			return $dependencia;
		}

		function consultar_modulos()
		{
			$this->conectar();
			$cont=0;
			$sql="SELECT tmodulo_trol.idmodulo,nombremod,orden FROM tmodulo,tmodulo_trol WHERE tmodulo_trol.idrol='$this->lcIdRol' AND tmodulo_trol.idmodulo=tmodulo.idmodulo AND estatusmod='1'";
			$pcsql=$this->filtro($sql);
			while($laRow=$this->proximo($pcsql))
			{
				$Fila[$cont][0]=$laRow['idmodulo'];
				$Fila[$cont][1]=$laRow['nombremod'];
				$Fila[$cont][2]=$laRow['orden'];
				$cont++;
			}
			$this->desconectar();
			return $Fila;
		}

		function consultar_modulos_menu()
		{
			$this->conectar();
			$cont=0;
			$sql="SELECT tmodulo_trol.idmodulo,nombremod,orden FROM tmodulo,tmodulo_trol WHERE tmodulo_trol.idrol='$this->lcIdRol' AND tmodulo_trol.idmodulo=tmodulo.idmodulo ORDER BY orden ASC";
			$pcsql=$this->filtro($sql);
			while($laRow=$this->proximo($pcsql))
			{
				$Fila[$cont][0]=$laRow['idmodulo'];
				$Fila[$cont][1]=$laRow['nombremod'];
				$Fila[$cont][2]=$laRow['orden'];
				$cont++;
			}
			$this->desconectar();
			return $Fila;
		}

		function consultar_servicios_menu($IdModulo)
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT tservicio_trol.idservicio,nombreser,enlaceser,visibleser,orden FROM tservicio_trol,tservicio WHERE idrol='$this->lcIdRol' AND idmodulo='$IdModulo' AND tservicio_trol.idservicio=tservicio.idservicio ORDER BY orden ASC";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['idservicio'];
					$Fila[$cont][1]=$laRow['nombreser'];
					$Fila[$cont][2]=$laRow['enlaceser'];
					$Fila[$cont][3]=$laRow['visibleser'];
					$Fila[$cont][4]=$laRow['orden'];

					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_servicios($IdModulo)
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT tservicio_trol.idservicio,nombreser,enlaceser,visibleser,orden FROM tservicio_trol,tservicio WHERE idrol='$this->lcIdRol' AND idmodulo='$IdModulo' AND tservicio_trol.idservicio=tservicio.idservicio ORDER BY visibleser DESC";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['idservicio'];
					$Fila[$cont][1]=$laRow['nombreser'];
					$Fila[$cont][2]=$laRow['enlaceser'];
					$Fila[$cont][3]=$laRow['visibleser'];
					$Fila[$cont][4]=$laRow['orden'];

					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

	
		function consultar_rol()
		{
			$this->conectar();
			$sql="SELECT * FROM trol WHERE idrol='$this->lcIdRol'";
			$pcsql=$this->filtro($sql);
			if($laRow=$this->proximo($pcsql))
			{
				$Fila[0]=$laRow['idrol'];
				$Fila[1]=$laRow['nombrerol'];
			}
			$this->desconectar();
			return $Fila;
		}

		function validar_repetido()
		{
			$this->conectar();
			$repetido=false;
			$sql="SELECT * FROM trol WHERE UPPER(nombrerol)=UPPER('$this->lcNombre')";
			$pcsql=$this->filtro($sql);
			if($laRow=$this->proximo($pcsql))
			{
				$repetido=true;
			}
			$this->desconectar();
			return $repetido;
		}



		function registrar_rol()
		{
			$this->conectar();
			$sql="INSERT INTO trol (nombrerol)VALUES(UPPER('$this->lcNombre'))";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function eliminar_rol()
		{
			$this->conectar();
			$sql="UPDATE trol SET estatusrol='0' WHERE idrol='$this->lcIdRol' ";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function restaurar_rol()
		{
			$this->conectar();
			$sql="UPDATE trol SET estatusrol='1' WHERE idrol='$this->lcIdRol' ";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function editar_rol()
		{
			$this->conectar();
			$sql="UPDATE trol SET nombrerol=UPPER('$this->lcNombre') WHERE idrol='$this->lcIdRol' ";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function asignar_modulo()
		{
			$this->conectar();
			$this->begin();
			$sql="DELETE FROM tmodulo_trol WHERE idrol='$this->lcIdRol' ";
			$this->ejecutar($sql);
			for($i=0;$i<count($this->lcModulo);$i++) 
			{
				$idModulo=$this->lcModulo[$i];
				$Orden=$this->lcOrden[$i];
				$sql="INSERT INTO tmodulo_trol (idrol,idmodulo,orden)VALUES('$this->lcIdRol','$idModulo','$Orden')";
				$lnHecho=$this->ejecutar($sql);
				if(!$lnHecho)
				{
					$this->rollback();
					break;
				}
			}
			if($lnHecho)
			{
				$this->commit();
			}
			$this->desconectar();
			return $lnHecho;
		}

		function quitar_servicios()
		{
			$this->conectar();
			$sql="DELETE FROM tservicio_trol WHERE idrol='$this->lcIdRol' ";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function asignar_servicio()
		{
			$this->conectar();
			$this->begin();
			for($i=0;$i<count($this->lcServicio);$i++) 
			{
				$idservicio=$this->lcServicio[$i];
				$Orden=$this->lcOrden[$i];
				$sql="INSERT INTO tservicio_trol (idrol,idservicio,orden)VALUES('$this->lcIdRol','$idservicio','$Orden')";
				$lnHecho=$this->ejecutar($sql);
				if(!$lnHecho)
				{
					$this->rollback();
					break;
				}
			}
			if($lnHecho)
			{
				$this->commit();
			}
			$this->desconectar();
			return $lnHecho;
		}
	}
?>