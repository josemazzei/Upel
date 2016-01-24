<?php

	require_once('../nucleo/ModeloConect.php');
	class clsPregunta extends ModeloConect
	{
		
		private $lcIdPregunta;
		private $lcPregunta;
		private $lcRespuesta;
		private $lcUsuario;

		function set_IdPregunta($pcIdPregunta)
		{
			$this->lcIdPregunta=$pcIdPregunta;
		}

		function set_Pregunta($pcPregunta)
		{
			$this->lcPregunta=$pcPregunta;
		}

		function set_Respuesta($pcRespuesta)
		{
			$this->lcRespuesta=$pcRespuesta;
		}

		function set_Usuario($pcUsuario)
		{
			$this->lcUsuario=$pcUsuario;
		}

		function consultar_pregunta()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT `idpregunta`, `pregunta`, `respuesta`, `tusuario_idusuario` FROM `tpregunta` WHERE idpregunta='$this->lcIdPregunta' AND tusuario_idusuario='$this->lcUsuario'";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[0]=$laRow['idpregunta'];
					$Fila[1]=$laRow['pregunta'];
					$Fila[2]=$laRow['respuesta'];
					$Fila[3]=$laRow['tusuario_idusuario'];
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_pregunta_correo()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT `idpregunta`, `pregunta`, `respuesta`, `tusuario_idusuario` FROM `tpregunta` WHERE tusuario_idusuario IN (SELECT idusuario FROM tusuario WHERE UPPER(emailusu)=UPPER('$this->lcUsuario')) ORDER BY RAND() LIMIT 5;";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont]["idpregunta"]			=$laRow['idpregunta'];
					$Fila[$cont]["pregunta"]			=$laRow['pregunta'];
					$Fila[$cont]["respuesta"]			=$laRow['respuesta'];
					$Fila[$cont]["tusuario_idusuario"]	=$laRow['tusuario_idusuario'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_pregunta_rand()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT `idpregunta`, `pregunta`, `respuesta`, `tusuario_idusuario` FROM `tpregunta` WHERE tusuario_idusuario ='$this->lcUsuario' ORDER BY RAND() LIMIT 5;";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont]["idpregunta"]			=$laRow['idpregunta'];
					$Fila[$cont]["pregunta"]			=$laRow['pregunta'];
					$Fila[$cont]["respuesta"]			=$laRow['respuesta'];
					$Fila[$cont]["tusuario_idusuario"]	=$laRow['tusuario_idusuario'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_preguntas()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT `idpregunta`, `pregunta`, `respuesta`, `tusuario_idusuario` FROM `tpregunta` WHERE tusuario_idusuario='$this->lcUsuario'";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['idpregunta'];
					$Fila[$cont][1]=$laRow['pregunta'];
					$Fila[$cont][2]=$laRow['respuesta'];
					$Fila[$cont][3]=$laRow['tusuario_idusuario'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_pregunta_bitacora()
		{
			$this->conectar();
				$sql="SELECT `idpregunta`, `pregunta`, `respuesta`, `tusuario_idusuario` FROM `tpregunta` WHERE idpregunta='$this->lcIdPregunta' AND tusuario_idusuario='$this->lcUsuario'";
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

		function registrar_pregunta()
		{
			$this->conectar();
			$sql="INSERT INTO `tpregunta`(`pregunta`, `respuesta`, `tusuario_idusuario`) VALUES (UPPER('$this->lcPregunta'),UPPER('$this->lcRespuesta'),'$this->lcUsuario')";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function eliminar_pregunta()
		{
			$this->conectar();
			$sql="DELETE FROM `tpregunta` WHERE idpregunta='$this->lcIdPregunta' ";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function editar_pregunta()
		{
			$this->conectar();
			$sql="UPDATE `tpregunta` SET `pregunta`=UPPER('$this->lcPregunta'),`respuesta`=UPPER('$this->lcRespuesta') WHERE tusuario_idusuario='$this->lcUsuario' AND idpregunta='$this->lcIdPregunta'";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function desbloquear()
		{
			$this->conectar();
			$sql="UPDATE `tusuario` SET estatususu='1' WHERE idusuario='$this->lcUsuario'";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function validar()
		{
			$this->conectar();
			$llHecho=false;
				$sql="SELECT `idpregunta`, `pregunta`, `respuesta`, `tusuario_idusuario` FROM `tpregunta` WHERE idpregunta='$this->lcIdPregunta' AND tusuario_idusuario='$this->lcUsuario' AND respuesta=UPPER('$this->lcRespuesta')";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$llHecho = true;
				}
			
			$this->desconectar();
			return $llHecho;
		}

		function cambio_clave($pcClave)
		{
			if($this->valida_clave($pcClave))
			{
				$this->conectar();
				$sql="UPDATE tclave SET fechafincla=NOW(), estatuscla='0' WHERE tusuario_idusuario='$this->lcUsuario' AND estatuscla='1';  ";
				
				$lnHecho=$this->ejecutar($sql);			
				
				$sql="  INSERT INTO `tclave`(`clavecla`, `fechainiciocla`, `fechafincla`, `estatuscla`, `tusuario_idusuario`) VALUES (sha1('$pcClave'),now(), ADDDATE(NOW(), (SELECT tiempocaducida FROM tsistema)),'1','$this->lcUsuario');";
				$lnHecho=$this->ejecutar($sql);			
				
				$this->desconectar();
			}
			else
			{
				$lnHecho=false;
			}
			return $lnHecho;

		}

		function cambio_clave_interno($pcClave_vieja, $pcClave_Nueva)
		{
			if($this->valida_clave($pcClave_Nueva))
			{
				$this->conectar();
				$sql="UPDATE tclave SET fechafincla=NOW(), estatuscla='0' WHERE tusuario_idusuario='$this->lcUsuario' AND estatuscla='1';  ";
				
				$lnHecho=$this->ejecutar($sql);			
				
				$sql="  INSERT INTO `tclave`(`clavecla`, `fechainiciocla`, `fechafincla`, `estatuscla`, `tusuario_idusuario`) VALUES (sha1('$pcClave_Nueva'),now(), ADDDATE(NOW(), (SELECT tiempocaducida FROM tsistema)),'1','$this->lcUsuario');";
				$lnHecho=$this->ejecutar($sql);			
				
				$this->desconectar();
			}
			else
			{
				$lnHecho=false;
			}
			return $lnHecho;

		}

		function valida_clave($pcClave)
		{
			$llHecho=true;
			$this->conectar();
			$sql="SELECT * FROM tclave WHERE clavecla=sha1('$pcClave') AND tusuario_idusuario='$this->lcUsuario';";
			$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$llHecho = false;
				}		
			$this->desconectar();
			return $llHecho;
		}
	}
?>