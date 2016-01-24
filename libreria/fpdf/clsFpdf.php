<?php
	session_start();
	require_once("../libreria/fpdf/fpdf.php");
	
	class clsFpdf extends FPDF
	{
		public $codigo;
		//Cabecera de página
		//
		
		function set_orientacion($orientacion='p')
		{
			$this->FPDF($orientacion);
		}

		public function Header()
		{
			//Logo
			$this->Image('../media/images/cintillo-caidv.jpg',10,10,200,15);
			$this->Ln(2);
			$this->Image('../media/images/CAIDV.jpg',10,30,60,18);

			//Arial bold 15
			$this->SetFont("Arial","B",15);
			//Título
			
			//Arial bold 8
			$this->SetFont("Arial","B",8);
			//Fecha
			$lcFecha=date("d/m/Y  h:m a");
			$this->Cell(0,50,$lcFecha,0,0,"R");
			$this->Ln(4);
			$this->Cell(0,50,'Usuario: '.$_SESSION['usuario'],0,0,"R");
			//Salto de línea
			$this->Ln(35);
		}

		//Pie de página
		public function Footer()
		{
			//Posición: a 2 cm del final
			$this->SetY(-20);
			//Arial italic 8
			$this->SetFont("Arial","I",8);
			//Dirección
			$this->Cell(0,4,$this->codigo,0,1,"C");

			$this->Cell(0,4,"Acarigua Estado Portuguesa",0,1,"C");
			//Número de página
			$this->Cell(0,4,utf8_decode("Página ").$this->PageNo()."/{nb}",0,0,"C");
		}
	}
?>
