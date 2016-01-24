<?php
require_once('../nucleo/ModeloConect.php');
class clsBitacora extends ModeloConect
	{
		/*
		atributos de la clase.
		*/
		private $lnIdBitacora;
		private $lcDireccion;
		private $ldFecha;
		private $lcIp;
		private $lcOperacion;
		private $lcCampo;
		private $lcTabla;
		private $lcMotivo;
		private $lcValorAnterior;
		private $lcValorNuevo;
		private $lcUsuario;
		private $lcServicio;

		/*
		El set_IdBitacora() recibe el IdBitacora desde cualquier instancia realizada de la clase.
		*/
		function set_IdBitacora($pnIdBitacora)
		{
			$this->lnIdBitacora=$pnIdBitacora;
		}
		/*
		El set_Datos() recibe los datos enviados desde cualquier instancia realizada de la clase.
		*/
		function set_Datos($pcDireccion,$pdFecha,$pcIp,$pcOperacion,$pcMotivo,$pcCampo,$pcTabla,$pcValorAnterior,$pcValorNuevo,$pcUsuario,$pcServicio)
		{
			$this->lcDireccion=$pcDireccion;
			$this->ldFecha=$pdFecha;
			$this->lcIp=$pcIp;
			$this->lcOperacion=$pcOperacion;
			$this->lcCampo=$pcCampo;
			$this->lcTabla=$pcTabla;
			$this->lcMotivo=$pcMotivo;
			$this->lcValorAnterior=$pcValorAnterior;
			$this->lcValorNuevo=$pcValorNuevo;
			$this->lcUsuario=$pcUsuario;
			$this->lcServicio=$pcServicio;
		}
		/*
		El listar_bitacora() realiza una consulta donde trae un listado de los datos de las acciones realizadas en el sistema.
		*/
		function listar_bitacora()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT *,date_format(fechahorabit,'%d-%m-%Y %H:%i')as fechahorabit FROM tbitacora WHERE operacionbit<>'Reporte' ORDER BY idbitacora DESC";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['idbitacora'];
					$Fila[$cont][1]=$laRow['direccionbit'];
					$Fila[$cont][2]=$laRow['fechahorabit'];
					$Fila[$cont][3]=$laRow['ipbit'];
					$Fila[$cont][4]=$laRow['idusuario'];
					$Fila[$cont][5]=$laRow['serviciobit'];
					$Fila[$cont][6]=$laRow['valoranteriorbit'];
					$Fila[$cont][7]=$laRow['valornuevobit'];
					$Fila[$cont][8]=$laRow['operacionbit'];
					$Fila[$cont][9]=$laRow['motivobit'];
					$Fila[$cont][10]=$laRow['campobit'];
					$Fila[$cont][11]=$laRow['tablabit'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}
		/*
		El listar_bitacora_reporte() realiza una consulta donde trae un listado de los datos de los 
		reportes emitidos en el sistema.
		*/
		function listar_bitacora_reporte()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT *,date_format(fechahorabit,'%d-%m-%Y %H:%i')as fechahorabit FROM tbitacora WHERE operacionbit='Reporte' ORDER BY idbitacora DESC";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['idbitacora'];
					$Fila[$cont][1]=$laRow['direccionbit'];
					$Fila[$cont][2]=$laRow['fechahorabit'];
					$Fila[$cont][3]=$laRow['ipbit'];
					$Fila[$cont][4]=$laRow['idusuario'];
					$Fila[$cont][5]=$laRow['serviciobit'];
					$Fila[$cont][6]=$laRow['valoranteriorbit'];
					$Fila[$cont][7]=$laRow['valornuevobit'];
					$Fila[$cont][8]=$laRow['operacionbit'];
					$Fila[$cont][9]=$laRow['motivobit'];
					$Fila[$cont][10]=$laRow['campobit'];
					$Fila[$cont][11]=$laRow['tablabit'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}
		/*
		El consultar_bitacora_reporte() realiza una consulta donde trae los datos de una acción realizada en el sistema
		para mostrar en un formulario del sistema.
		*/
		function consultar_bitacora()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT *,date_format(fechahorabit,'%d-%m-%Y %H:%i')as fechahorabit FROM tbitacora WHERE idbitacora='$this->lnIdBitacora' ORDER BY idbitacora DESC";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[0]=$laRow['idbitacora'];
					$Fila[1]=$laRow['direccionbit'];
					$Fila[2]=$laRow['fechahorabit'];
					$Fila[3]=$laRow['ipbit'];
					$Fila[4]=$laRow['idusuario'];
					$Fila[5]=$laRow['serviciobit'];
					$Fila[6]=$laRow['valoranteriorbit'];
					$Fila[7]=$laRow['valornuevobit'];
					$Fila[8]=$laRow['operacionbit'];
					$Fila[9]=$laRow['motivobit'];
					$Fila[10]=$laRow['campobit'];
					$Fila[11]=$laRow['tablabit'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}
		/*
		El consultar_bitacora_reporte() realiza una consulta donde trae los datos de una acción realizada en el sistema para 
		realizar un reporte de esa acción.
		*/
		function consultar_bitacora_reporte()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT *,date_format(fechahorabit,'%d-%m-%Y %H:%i')as fechahorabit FROM tbitacora WHERE idbitacora='$this->lnIdBitacora' ORDER BY idbitacora DESC";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[0]=$laRow['idbitacora'];
					$Fila[1]=$laRow['direccionbit'];
					$Fila[2]=$laRow['fechahorabit'];
					$Fila[3]=$laRow['ipbit'];
					$Fila[4]=$laRow['idusuario'];
					$Fila[5]=$laRow['serviciobit'];
					$Fila[6]=$laRow['valoranteriorbit'];
					$Fila[7]=$laRow['valornuevobit'];
					$Fila[8]=$laRow['operacionbit'];
					$Fila[9]=$laRow['motivobit'];
					$Fila[10]=$laRow['campobit'];
					$Fila[11]=$laRow['tablabit'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}
		/*
		El registrar_bitacora() registra las acciones realizadas en el sistema.
		*/
		function registrar_bitacora()
		{
			$this->conectar();
			$sql="INSERT INTO tbitacora (direccionbit,fechahorabit,ipbit,operacionbit,motivobit,campobit,tablabit,valoranteriorbit,valornuevobit,idusuario,serviciobit)VALUES('$this->lcDireccion','$this->ldFecha','$this->lcIp','$this->lcOperacion','$this->lcMotivo','$this->lcCampo','$this->lcTabla','$this->lcValorAnterior','$this->lcValorNuevo','$this->lcUsuario','$this->lcServicio')";
			$lcHecho=$this->ejecutar($sql);
			$this->desconectar();
			return $lcHecho;
		}

		/*
		El revertir_cambios() revierte las modificaciones realizadas en el sistema.
		*/
		function revertir_cambios()
		{
			$this->conectar();
			$sql="UPDATE $this->lcTabla SET $this->lcCampo='$this->lcValorAnterior' WHERE $this->lcCampo='$this->lcValorNuevo'";
			$lcHecho=$this->ejecutar($sql);
			$this->desconectar();
			return $lcHecho;
		}

	}
?>