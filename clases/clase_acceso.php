<?php

	require_once('../nucleo/ModeloConect.php');
	class clsAcceso extends ModeloConect
	{
		
		private $lcIdAcceso;
		private $lcIp;
		private $lcExito;
		private $lcUsuario;

		function set_IdAcceso($pcIdAcceso)
		{
			$this->lcIdAcceso=$pcIdAcceso;
		}


		function set_Exito($pcExito)
		{
			$this->lcExito=$pcExito;
		}

		function set_Ip($pcIp)
		{
			$this->lcIp=$pcIp;
		}

		function set_Usuario($pcUsuario)
		{
			$this->lcUsuario=$pcUsuario;
		}

		function registrar_acceso()
		{
			$this->conectar();
			$sql="INSERT INTO `tacceso`(`ipacc`, `exitoacc`, `idusuario`,estatusacc) VALUES ('$this->lcIp','$this->lcExito','$this->lcUsuario','$this->lcExito')";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function registrar_salida()
		{
			$this->conectar();
			$sql="UPDATE `tacceso` SET `fecha_salidaacc`=NOW(),estatusacc='0' WHERE idacceso='$this->lcIdAcceso' AND idusuario='$this->lcUsuario' AND estatusacc='1'";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}


		function consultar_acceso()
		{
			$llHecho=true;
			$this->conectar();
			$sql="SELECT * FROM tacceso WHERE idusuario='$this->lcUsuario' AND exitoacc='1' AND estatusacc='1' ";
			$pcsql=$this->filtro($sql);
			while($laRow=$this->proximo($pcsql))
			{
				$idacceso =$laRow['idacceso'];
			}		
			$this->desconectar();
			return $idacceso;
		}

		function consultar_acceso_activo()
		{
			$fila['acceso']=true;
			$this->conectar();
			$sql="SELECT * FROM tacceso,tusuario WHERE tacceso.idusuario='$this->lcUsuario' AND tacceso.idusuario=tusuario.idusuario AND estatusacc='1' AND (SELECT tiempoconexion FROM tsistema)>TIMESTAMPDIFF(MINUTE,ultima_actividadacc,NOW())";
			$pcsql=$this->filtro($sql);
			if($laRow=$this->proximo($pcsql))
			{
				$fila['ipacc']=$laRow['ipacc'];
				$fila['acceso']=false;
			}
			$this->desconectar();
			return $fila;
		}

		function listado_accesos()
		{
			$cont=0;
			$this->conectar();
			$sql="SELECT *,TIMEDIFF(fecha_salidaacc,fechaacc)as tiempo,date_format(fechaacc,'%d-%m-%Y %h:%i %p')as fechaacc,date_format(fecha_salidaacc,'%d-%m-%Y %h:%i %p')as fecha_salidaacc FROM tacceso WHERE idusuario='$this->lcUsuario'";
			$pcsql=$this->filtro($sql);
			while($laRow=$this->proximo($pcsql))
			{
				$fila[$cont]['idacceso'] =$laRow['idacceso'];
				$fila[$cont]['fechaacc'] =$laRow['fechaacc'];
				if(!$laRow['fecha_salidaacc'] && $laRow['exitoacc']=='1')
					$fila[$cont]['fecha_salidaacc'] ='La sesión sigue activa';
				elseif(!$laRow['fecha_salidaacc'] && $laRow['exitoacc']=='0')
					$fila[$cont]['fecha_salidaacc'] ='El usuario no inició sesión';
				elseif($laRow['fecha_salidaacc'])
					$fila[$cont]['fecha_salidaacc'] =$laRow['fecha_salidaacc'];
				$fila[$cont]['exitoacc'] =($laRow['exitoacc']=='1')?'Si':'No';
				$fila[$cont]['ipacc'] =$laRow['ipacc'];
				$fila[$cont]['tiempo'] =($laRow['tiempo'])?$laRow['tiempo']:'El usuario no inició sesión';;
				$cont++;
			}		
			$this->desconectar();
			return $fila;
		}
	}
?>