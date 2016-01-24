<?php
   date_default_timezone_set('America/Caracas');
   include_once("../clases/clase_docente.php");
   include_once("../clases/clase_diagnostico.php");
   ob_end_clean();
   require_once("../libreria/fpdf/clsFpdf.php");
   require_once("../clases/clase_bitacora.php");
   require_once('../libreria/utilidades.php');
   require_once('../libreria/uuid.php');
   $lobjPdf=new clsFpdf();
   $lobjBitacora=new clsBitacora;
   $lobjUtil=new clsUtil;
   $ObjDocente = new clsDocente();
   $ObjDiagnostico = new clsDiagnostico();
      
   $lobjPdf->AliasNbPages();
   $lobjPdf->codigo=UUID::v4();
   $lobjPdf->AddPage("P","Letter");
      $lcReal_ip=$lobjUtil->get_real_ip();
    $ldFecha=date('Y-m-d h:m');
      $lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Reporte','-','id_diagnostico','-',$lobjPdf->codigo,$_GET['id_diagnostico'],$_SESSION['usuario'],'listado_docentes_diagnostico'); //envia los datos a la clase bitacora
      $lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
      
      $ObjDocente->set_Diagnostico($_GET['id_diagnostico']);
      $ObjDiagnostico->set_Diagnostico($_GET['id_diagnostico']);
   $row_detalle=$ObjDocente->listado_docente_diagnostico();
   $row_consulta=$ObjDiagnostico->consultar_diagnostico();
   $lobjPdf->SetFont("arial","B",12);
   $lobjPdf->Ln(10);
   $lobjPdf->Cell(0,6,utf8_decode("DOCENTES POR TIPO DE CONDICION VISUAL"),0,1,"C");
   $lobjPdf->Cell(0,6,utf8_decode("TIPO DE CONDICION: ".$row_consulta[1]),0,1,"C");
   $lobjPdf->Ln();
         //analizamos los nombres de las tablas con mas longitud para colocar de ese tamaño las celdas
	
	$lobjPdf->Ln(4);
	$lobjPdf->SetFont("arial","B",12);


	$lobjPdf->Cell(200,6,utf8_decode("LISTADO DE DOCENTES"),1,1,"C");
	$lobjPdf->Cell(40,6,utf8_decode('CÉDULA'),1,0,"C"); 
	$lobjPdf->Cell(130,6,utf8_decode('NOMBRE Y APELLIDO'),1,0,"C");
	$lobjPdf->Cell(30,6,utf8_decode('EDAD'),1,1,"C");
	$lobjPdf->SetFont("arial","",12);

	if($row_detalle)
	{
		for($i=0;$i<count($row_detalle);$i++)
		{
			$lobjPdf->Cell(40,6,utf8_decode($row_detalle[$i][14].'-'.number_format($row_detalle[$i][0],0,'','.')),1,0,"C");
			$lobjPdf->Cell(130,6,utf8_decode($row_detalle[$i][1].' '.$row_detalle[$i][2].','.$row_detalle[$i][3].' '.$row_detalle[$i][4]),1,0,"C");
			$lobjPdf->Cell(30,6,$row_detalle[$i][15],1,1,"C");
		}
	}
	else
	{

    	$lobjPdf->Cell(200,6,utf8_decode('NO SE HA REGISTRADO NINGUN DOCENTE PARA ESTA CONDICION.'),1,1,"C");
	}
	
   $lobjPdf->Output(); 
?>