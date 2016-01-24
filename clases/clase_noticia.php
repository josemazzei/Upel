<?php

	require_once('../nucleo/ModeloConect.php');
	class clsNoticia extends ModeloConect
	{
		private $lcIdnoticia;
		private $lcTitulonot;
		private $lcTextonot;
		private $lcImagennot;
		private $lcFechanot;
		private $lcEstatusnot;

		function set_Noticia($pcIdnoticia)
		{
			$this->lcIdnoticia=$pcIdnoticia;
		}

		function set_Titulo($pcTitulo)
		{
			$this->lcTitulonot=$pcTitulo;
		}

		function set_Texto($pcTexto)
		{
			$this->lcTextonot=$pcTexto;
		}

		function set_Imagen($pcImagen)
		{
			$this->lcImagennot=$pcImagen;
		}

		function set_Fechanot($pcFecha)
		{
			$this->lcFechanot=$pcFecha;
		}

		function set_Estatus($pcEstatus)
		{
			$this->lcEstatusnot=$pcEstatus;
		}

		function consultar_noticia()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT * FROM tnoticia WHERE idnoticia='$this->lcIdnoticia' AND estatusnot='1';";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[0]=$laRow['idnoticia'];
					$Fila[1]=$laRow['titulonot'];
					$Fila[2]=$laRow['textonot'];
					$Fila[3]=$laRow['imagennot'];
					$Fila[4]=$laRow['fechanot'];
					$Fila[5]=$laRow['estatusnot'];
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_noticia_post()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT *, date_format(fechanot, '%d-%m-%Y') AS fechanot FROM tnoticia WHERE idnoticia='$this->lcIdnoticia' AND estatusnot='1';";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[0]=$laRow['idnoticia'];
					$Fila[1]=$laRow['titulonot'];
					$Fila[2]=$laRow['textonot'];
					$Fila[3]=$laRow['imagennot'];
					$Fila[4]=$laRow['fechanot'];
					$Fila[5]=$laRow['estatusnot'];
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_noticias()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT * FROM `tnoticia` ";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['idnoticia'];
					$Fila[$cont][1]=$laRow['titulonot'];
					$Fila[$cont][2]=$laRow['textonot'];
					$Fila[$cont][3]=$laRow['imagennot'];
					$Fila[$cont][4]=$laRow['fechanot'];
					$Fila[$cont][5]=$laRow['estatusnot'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_noticias_activas()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT *, date_format(fechanot,'%d-%m-%Y') AS fechanot FROM `tnoticia` WHERE  estatusnot='1' ORDER BY fechanot DESC;";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['idnoticia'];
					$Fila[$cont][1]=$laRow['titulonot'];
					$Fila[$cont][2]=$laRow['textonot'];
					$Fila[$cont][3]=$laRow['imagennot'];
					$Fila[$cont][4]=$laRow['fechanot'];
					$Fila[$cont][5]=$laRow['estatusnot'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}


		function consultar_noticias_activas_limit()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT *, date_format(fechanot, '%d-%m-%Y') AS fechanot FROM `tnoticia` WHERE  estatusnot='1' ORDER BY fechanot DESC LIMIT 3;";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['idnoticia'];
					$Fila[$cont][1]=$laRow['titulonot'];
					$Fila[$cont][2]=$laRow['textonot'];
					$Fila[$cont][3]=$laRow['imagennot'];
					$Fila[$cont][4]=$laRow['fechanot'];
					$Fila[$cont][5]=$laRow['estatusnot'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_noticia_bitacora()
		{
			$this->conectar();
				$sql="SELECT * FROM `tnoticia` WHERE idnoticia='$this->lcIdnoticia'  AND estatusnot='1';";
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

		function registrar_noticia()
		{
			$this->lcFechanot=date('Y-m-d');
			$this->conectar();
			$sql="INSERT INTO `tnoticia`(`titulonot`, `textonot`, `imagennot`, `fechanot`, `estatusnot`)
			 VALUES 
			 (UPPER('$this->lcTitulonot'),'$this->lcTextonot','$this->lcImagennot','$this->lcFechanot','1')";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function eliminar_noticia()
		{
			$this->conectar();
			$sql="UPDATE tnoticia SET estatusnot='0' WHERE idnoticia='$this->lcIdnoticia' ";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function restaurar_noticia()
		{
			$this->conectar();
			$sql="UPDATE tnoticia SET estatusnot='1' WHERE idnoticia='$this->lcIdnoticia' ";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function editar_noticia()
		{
			$this->conectar();
			$sql="UPDATE `tnoticia` 
				SET `titulonot`=UPPER('$this->lcTitulonot'),`textonot`='$this->lcTextonot',`imagennot`='$this->lcImagennot',`fechanot`='$this->lcFechanot' WHERE idnoticia='$this->lcIdnoticia'";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}
	}
?>