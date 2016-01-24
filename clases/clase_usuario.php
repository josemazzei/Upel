<?php

	require_once('../nucleo/ModeloConect.php');

	class clsUsuario extends ModeloConect
	{
		private $lcUsuario;
		private $lcClave;
		private $lnIdRol;
		private $lnIdPersona;
		private $lcNombre;


		function set_Usuario($pcUsuario)
		{
			$this->lcUsuario=$pcUsuario;
		}

		function set_Clave($pcClave)
		{
			$this->lcClave=$pcClave;
		}

		function set_Rol($pcIdRol)
		{
			$this->lnIdRol=$pcIdRol;
		}

		function set_Persona($pnIdPersona)
		{
			$this->lnIdPersona=$pnIdPersona;
		}

		function set_Nombre($pcNombre)
		{
			$this->lcNombre=$pcNombre;
		}

		function set_Email($pcEmail)
		{
			$this->lcEmail=$pcEmail;
		}

		function login()
		{
			$this->conectar();
			$Fila[0]=0;
			$sql="SELECT tusuario.idusuario as id,nombrerol,idrol,nombreusu,TO_DAYS(fechafincla)as fechafincla,TO_DAYS(NOW())as fechaactual,estatususu,(SELECT CONCAT_WS(' / ',DATE_FORMAT(fechaacc,'%d-%m-%Y %h-%i %p'),DATE_FORMAT(fecha_salidaacc,'%d-%m-%Y %h-%i %p')) FROM tacceso WHERE id=idusuario ORDER BY idacceso DESC LIMIT 1)as ultimo_acceso,(SELECT TIMEDIFF(fecha_salidaacc,fechaacc) FROM tacceso WHERE id=idusuario ORDER BY idacceso DESC LIMIT 1)as tiempo FROM tusuario,trol,tclave WHERE idusuario='".mysql_real_escape_string($this->lcUsuario)."' AND idusuario=tusuario_idusuario AND clavecla=sha1('".mysql_real_escape_string($this->lcClave)."') AND trol.idrol=trol_idrol AND estatuscla='1' ";
			$pcsql=$this->filtro($sql);
			if($laRow=$this->proximo($pcsql))
			{
				$Fila[0]=$laRow['id'];
				$Fila[1]=$laRow['nombrerol'];
				$Fila[2]=$laRow['idrol'];
				$Fila[3]=$laRow['nombreusu'];
				$Fila[4]=$laRow['fechafincla']-$laRow['fechaactual'];
				$Fila[5]=$laRow['estatususu'];
				$Fila[6]=$laRow['ultimo_acceso'];
				$Fila[7]=$laRow['tiempo'];
			}
			$this->desconectar();
			return $Fila;
		}

		function listado_usuarios()
		{
			$cont=0;
			$this->conectar();
			$sql="SELECT tusuario.idusuario as id,nombrerol,idrol,nombreusu,TO_DAYS(fechafincla)as fechafincla,TO_DAYS(NOW())as fechaactual,estatususu,(SELECT CONCAT_WS(' / ',DATE_FORMAT(fechaacc,'%d-%m-%Y %h-%i %p'),DATE_FORMAT(fecha_salidaacc,'%d-%m-%Y %h-%i %p')) FROM tacceso WHERE id=idusuario ORDER BY idacceso DESC LIMIT 1)as ultimo_acceso,emailusu,cedula FROM tusuario,trol,tclave WHERE tusuario.idusuario=tusuario_idusuario AND idrol=trol_idrol AND estatuscla='1'";
			$pcsql=$this->filtro($sql);
			while($laRow=$this->proximo($pcsql))
			{
				$Fila[$cont]['idusuario']=$laRow['id'];
				$Fila[$cont]['nombrerol']=$laRow['nombrerol'];
				$Fila[$cont]['nombreusu']=$laRow['nombreusu'];
				$Fila[$cont]['caduca_clave']=($laRow['fechafincla']-$laRow['fechaactual']>0)?$laRow['fechafincla']-$laRow['fechaactual']. ' Días':'Caducó';
				$Fila[$cont]['ultimo_acceso']=$laRow['ultimo_acceso'];
				$Fila[$cont]['emailusu']=$laRow['emailusu'];
				$Fila[$cont]['cedula']=$laRow['cedula'];
				$Fila[$cont]['estatususu']=$laRow['estatususu'];
				$cont++;
			}
			$this->desconectar();
			return $Fila;
		}

		function consultar_usuarios()
		{
			$cont=0;
			$this->conectar();
			$sql="SELECT * FROM tusuario";
			$pcsql=$this->filtro($sql);
			while($laRow=$this->proximo($pcsql))
			{
				$Fila[$cont]['idusuario']=$laRow['idusuario'];
				$Fila[$cont]['nombreusu']=$laRow['nombreusu'];
				$Fila[$cont]['emailusu']=$laRow['emailusu'];
				$Fila[$cont]['cedula']=$laRow['cedula'];
				$Fila[$cont]['estatususu']=$laRow['estatususu'];
				$cont++;
			}
			$this->desconectar();
			return $Fila;
		}

		function consultar_usuario()
		{
			$this->conectar();
			$sql="SELECT tusuario.idusuario,nombrerol,idrol FROM tusuario,trol,tclave WHERE idusuario='$this->lcUsuario' AND idusuario=tusuario_idusuario  AND trol.idrol=trol_idrol AND estatuscla='1' ";
			$pcsql=$this->filtro($sql);
			if($laRow=$this->proximo($pcsql))
			{
				$Fila[0]=$laRow['idusuario'];
				$Fila[1]=$laRow['nombrerol'];
				$Fila[2]=$laRow['idrol'];
			}
			$this->desconectar();
			return $Fila;
		}

		function consultar_datos_usuario()
		{
			$this->conectar();
			$sql="SELECT tusuario.idusuario as id,nombrerol,idrol,nombreusu,TO_DAYS(fechafincla)as fechafincla,TO_DAYS(NOW())as fechaactual,estatususu,(SELECT CONCAT_WS(' / ',DATE_FORMAT(fechaacc,'%d-%m-%Y %h:%i %p'),DATE_FORMAT(fecha_salidaacc,'%d-%m-%Y %h:%i %p')) FROM tacceso WHERE id=idusuario ORDER BY idacceso DESC LIMIT 1)as ultimo_acceso FROM tusuario,trol,tclave WHERE tusuario.idusuario='$this->lcUsuario' AND tusuario.idusuario=tusuario_idusuario AND idrol=trol_idrol AND estatuscla='1'";
			$pcsql=$this->filtro($sql);
			if($laRow=$this->proximo($pcsql))
			{
				$Fila['idusuario']=$laRow['id'];
				$Fila['nombrerol']=$laRow['nombrerol'];
				$Fila['nombreusu']=$laRow['nombreusu'];
				$Fila['caduca_clave']=($laRow['fechafincla']-$laRow['fechaactual']>0)?$laRow['fechafincla']-$laRow['fechaactual']. ' Días':'Caducó';
				$Fila['ultimo_acceso']=$laRow['ultimo_acceso'];
				$Fila['estatususu']=($laRow['estatususu'])?'Activo':'Bloqueado';
			}
			$this->desconectar();
			return $Fila;
		}

		function consultar_primer_acceso()
		{
			$llEncontro=true;
			$this->conectar();
			$sql="SELECT count(*) AS cantidad FROM tacceso WHERE idusuario='$this->lcUsuario'";
			$pcsql=$this->filtro($sql);
			if($laRow=$this->proximo($pcsql))
			{
				if($laRow['cantidad']>0)
				{
					$llEncontro=false;
				}
			}
			$this->desconectar();
			return $llEncontro;
		}

		function consultar_tiempo_conexion()
		{
			$llEncontro=true;
			$this->conectar();
			$sql="SELECT * FROM tusuario WHERE idusuario='$this->lcUsuario' AND (SELECT tiempoconexion FROM tsistema)<TIMESTAMPDIFF(MINUTE,ultima_actividadusu,NOW())";
			$pcsql=$this->filtro($sql);
			if($laRow=$this->proximo($pcsql))
			{	
				$llEncontro=false;
			}
			$this->desconectar();
			return $llEncontro;
		}

		
		function cerrar_accesos_activos()
		{
			$this->conectar();
			$sql="UPDATE `tacceso`,tusuario SET `fecha_salidaacc`=NOW(),estatusacc='0' WHERE tacceso.idusuario='$this->lcUsuario' AND tacceso.idusuario=tusuario.idusuario AND estatusacc='1' AND (SELECT tiempoconexion FROM tsistema)<TIMESTAMPDIFF(MINUTE,ultima_actividadusu,NOW())";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function actualizar_actividad($idacceso)
		{
			$this->conectar();
			$sql="UPDATE `tusuario`,tacceso SET `ultima_actividadusu`=NOW(),`ultima_actividadacc`=NOW() WHERE tusuario.idusuario='$this->lcUsuario' AND tusuario.idusuario=tacceso.idusuario AND idacceso='$idacceso' AND estatusacc='1'";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function registrar_usuario()
		{
			$this->conectar();
			$sql="INSERT INTO `tusuario`(`idusuario`, `nombreusu`, `emailusu`, `estatususu`, `trol_idrol`, `cedula`)
			 VALUES ('$this->lcUsuario',UPPER('$this->lcNombre'),UPPER('$this->lcEmail'),'1','$this->lnIdRol','$this->lnIdPersona')";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			$this->insertar_clave();
			return $lnHecho;
		}

		function insertar_clave()
		{
			$this->conectar();
			$sql=" INSERT INTO `tclave`(`clavecla`, `fechainiciocla`, `fechafincla`, `estatuscla`, `tusuario_idusuario`) 
			VALUES (sha1((SELECT clavepredeterminada FROM tsistema)),now(), ADDDATE(NOW(), (SELECT tiempocaducida FROM tsistema)),'1','$this->lcUsuario');";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();	
			return $lnHecho;
		}

		function editar_usuario()
		{
			$this->conectar();
			$sql="UPDATE `tusuario` SET 
				`idusuario`='$this->lcUsuario',`emailusu`=UPPER('$this->lcEmail'),`trol_idrol`='$this->lnIdRol',`cedula`='$this->lnIdPersona' WHERE idusuario='$this->lcUsuario'";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function bloquear_usuario()
		{
			$this->conectar();
			$sql="UPDATE `tusuario` SET 
				`estatususu`='0' WHERE idusuario='$this->lcUsuario'";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function cantidad_intentos()
		{
			$this->conectar();
			$sql="UPDATE `tusuario` SET 
				`intentos_fallidos`=intentos_fallidos+1 WHERE idusuario='$this->lcUsuario'";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function eliminar_accesos_fallidos()
		{
			$this->conectar();
			$sql="UPDATE `tusuario` SET 
				`intentos_fallidos`='0' WHERE idusuario='$this->lcUsuario'";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function consultar_accesos_fallidos()
		{
			$this->conectar();
			$sql="SELECT * FROM tusuario WHERE idusuario='$this->lcUsuario' ";
			$pcsql=$this->filtro($sql);
			if($laRow=$this->proximo($pcsql))
			{
				$intentos_fallidos=$laRow['intentos_fallidos'];
			}
			$this->desconectar();
			return $intentos_fallidos;
		}
		function consultar_bloqueados()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT * FROM `tusuario` WHERE  estatususu='0';";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['idusuario'];
					$Fila[$cont][1]=$laRow['nombreusu'];
					$Fila[$cont][2]=$laRow['emailusu'];
					$Fila[$cont][3]=$laRow['cedula'];
					$Fila[$cont][4]=$laRow['estatususu'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function listado_cambio_clave()
		{
			$cont=0;
			$this->conectar();
			$sql="SELECT *,TO_DAYS(fechafincla)as fechafincla_dias,TO_DAYS(NOW())as fechaactual FROM tusuario,tclave WHERE idusuario='$this->lcUsuario' AND idusuario=tusuario_idusuario";
			$pcsql=$this->filtro($sql);
			while($laRow=$this->proximo($pcsql))
			{
				$Fila[$cont]['idusuario']=$laRow['idusuario'];
				$Fila[$cont]['idclave']=$laRow['idclave'];
				$Fila[$cont]['fechainiciocla']=$laRow['fechainiciocla'];
				$Fila[$cont]['fechafincla']=$laRow['fechafincla'];
				$Fila[$cont]['estatuscla']=($laRow['estatuscla']==1)?'Activa':'Inactiva';
				$Fila[$cont]['caduca_clave']=($laRow['fechafincla_dias']-$laRow['fechaactual']>0)?$laRow['fechafincla_dias']-$laRow['fechaactual']. ' Días':'Caducó';
				$cont++;
			}
			$this->desconectar();
			return $Fila;
		}

	}
?>