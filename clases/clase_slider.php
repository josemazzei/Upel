<?php

	require_once('../nucleo/ModeloConect.php');
	class clsSlider extends ModeloConect
	{
		private $lcIdSlider;
		private $lcTitulo;
		private $lcTexto;
		private $lcImagen;
		private $lcEstatus;

		function set_Slider($pcIdSlider)
		{
			$this->lcIdSlider=$pcIdSlider;
		}

		function set_Titulo($pcTitulo)
		{
			$this->lcTitulo=$pcTitulo;
		}

		function set_Texto($pcTexto)
		{
			$this->lcTexto=$pcTexto;
		}

		function set_Imagen($pcImagen)
		{
			$this->lcImagen=$pcImagen;
		}

		function set_Estatus($pcEstatus)
		{
			$this->lcEstatus=$pcEstatus;
		}

		function consultar_slider()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT * FROM `tslider` WHERE idslider='$this->lcIdSlider'";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[0]=$laRow['idslider'];
					$Fila[1]=$laRow['titulosli'];
					$Fila[2]=$laRow['textosli'];
					$Fila[3]=$laRow['imagensli'];
					$Fila[4]=$laRow['estatussli'];
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_sliders()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT * FROM `tslider` ";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['idslider'];
					$Fila[$cont][1]=$laRow['titulosli'];
					$Fila[$cont][2]=$laRow['textosli'];
					$Fila[$cont][3]=$laRow['imagensli'];
					$Fila[$cont][4]=$laRow['estatussli'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_slider_activas()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT * FROM `tslider` WHERE  estatussli='1';";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['idslider'];
					$Fila[$cont][1]=$laRow['titulosli'];
					$Fila[$cont][2]=$laRow['textosli'];
					$Fila[$cont][3]=$laRow['imagensli'];
					$Fila[$cont][4]=$laRow['estatussli'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_slider_bitacora()
		{
			$this->conectar();
				$sql="SELECT * FROM `tslider` WHERE idslider='$this->lcIdSlider'  AND estatussli='1';";
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

		function registrar_slider()
		{
			$this->conectar();
			$sql="INSERT INTO `tslider`
			( `titulosli`, `textosli`, `imagensli`, `estatussli`) 
			VALUES (UPPER('$this->lcTitulo'),'$this->lcTexto','$this->lcImagen','1')";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function eliminar_slider()
		{
			$this->conectar();
			$sql="UPDATE tslider SET estatussli='0' WHERE idslider='$this->lcIdSlider' ";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function restaurar_slider()
		{
			$this->conectar();
			$sql="UPDATE tslider SET estatussli='1' WHERE idslider='$this->lcIdSlider' ";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function editar_slider()
		{
			$this->conectar();
			$sql="UPDATE `tslider` 
				SET `titulosli`=UPPER('$this->lcTitulo'),`textosli`='$this->lcTexto',`imagensli`='$this->lcImagen'
				WHERE idslider='$this->lcIdSlider'";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}
	}
?>