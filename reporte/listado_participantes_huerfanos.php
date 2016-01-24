<?php
   date_default_timezone_set('America/Caracas');
   include_once("../clases/clase_participante.php");
   ob_end_clean();
   require_once("../libreria/fpdf/clsFpdf.php");
   require_once("../clases/clase_bitacora.php");
   require_once('../libreria/utilidades.php');
   require_once('../libreria/uuid.php');
   $lobjBitacora=new clsBitacora;
   $lobjUtil=new clsUtil;
   $ObjParticipante = new clsParticipante();
   $lobjPdf=new clsFpdf();

   $lobjPdf->AliasNbPages();
   $lobjPdf->codigo=UUID::v4();
   $lobjPdf->AddPage("P","Letter");
	$row_detalle=$ObjParticipante->listado_participantes_huerfanos();
	$lcReal_ip=$lobjUtil->get_real_ip();
    $ldFecha=date('Y-m-d h:m');
   	$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Reporte','-','-','-',$lobjPdf->codigo,'',$_SESSION['usuario'],'listado_participantes_huerfanos'); //envia los datos a la clase bitacora
   	$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
   $lobjPdf->SetFont("arial","B",12);
   $lobjPdf->Ln(10);
   $lobjPdf->Cell(0,6,utf8_decode("PARTICIPANTES HUERFANOS"),0,1,"C");
   $lobjPdf->Ln();
         //analizamos los nombres de las tablas con mas longitud para colocar de ese tamaño las celdas
	
	$lobjPdf->Ln(6);
	$lobjPdf->SetFont("arial","B",12);


	$lobjPdf->Cell(200,6,utf8_decode("LISTADO DE PARTICIPANTES"),1,1,"C");
	$lobjPdf->Cell(30,6,utf8_decode('CÉDULA'),1,0,"C"); 
	$lobjPdf->Cell(100,6,utf8_decode('NOMBRE Y APELLIDO'),1,0,"C");
	$lobjPdf->Cell(20,6,utf8_decode('EDAD'),1,0,"C");
	$lobjPdf->Cell(50,6,utf8_decode('GRUPO'),1,1,"C");
	$lobjPdf->SetFont("arial","",12);
	if($row_detalle)
	{
		for($i=0;$i<count($row_detalle);$i++)
		{

				$lobjPdf->Cell(30,6,utf8_decode($row_detalle[$i][20].'-'.number_format($row_detalle[$i][1],0,'','.')),1,0,"C");
				$lobjPdf->Cell(100,6,utf8_decode($row_detalle[$i][2].' '.$row_detalle[$i][3].','.$row_detalle[$i][4].' '.$row_detalle[$i][5]),1,0,"C");
				$lobjPdf->Cell(20,6,utf8_decode($row_detalle[$i][21]),1,0,"C");
				$lobjPdf->Cell(50,6,$row_detalle[$i][22],1,1,"C");

		}
	}
	else
	{

    	$lobjPdf->Cell(200,6,utf8_decode('NO SE HA REGISTRADO NINGUN PARTICIPANTE PERTENECIENTE A UNA ETNIA.'),1,1,"C");
	}
	
   $lobjPdf->Output(); 
?>