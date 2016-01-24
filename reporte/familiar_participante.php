<?php
   date_default_timezone_set('America/Caracas');
   include_once("../clases/clase_inscripcion.php");
   include_once("../clases/clase_familiar.php");
   ob_end_clean();
   require_once("../libreria/fpdf/clsFpdf.php");
   require_once("../clases/clase_bitacora.php");
   require_once('../libreria/utilidades.php');
   require_once('../libreria/uuid.php');

   $lobjBitacora=new clsBitacora;
   $lobjUtil=new clsUtil;
   $ObjInscripcion = new clsInscripcion();
   $ObjFamiliar = new clsFamiliar();
     $lobjPdf=new clsFpdf();
    $ldFecha=date('Y-m-d h:m');
	$lcReal_ip=$lobjUtil->get_real_ip();
	
   $lobjPdf->AliasNbPages();
   $lobjPdf->codigo=UUID::v4();
   $lobjPdf->AddPage("P","Letter");
   $lobjPdf->SetFont("arial","B",12);
   	$Idparticipante=(isset($_GET['id']))?$_GET['id']:'';
	$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Reporte','-','id','-',$lobjPdf->codigo,$Idparticipante,$_SESSION['usuario'],'familiar_participante'); //envia los datos a la clase bitacora
   	$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.

	$ObjInscripcion->set_Idparticipante($Idparticipante);
	$ObjFamiliar->set_Familiar($Idparticipante);
	$row_participante=$ObjFamiliar->consultar_familiar();
	$row_participante_familiar=$ObjInscripcion->consultar_familiar_participante($Idparticipante);

  
   $lobjPdf->Ln(10);
   $lobjPdf->Cell(0,6,utf8_decode("PARTICIPANTES POR FAMILIAR"),0,1,"C");
   $lobjPdf->Ln();
         //analizamos los nombres de las tablas con mas longitud para colocar de ese tamaño las celdas

	//$lobjPdf->Cell(50,30,$lobjPdf->Image('../media/img/participantes/'.$row_participante[1].'.jpg',10,64,50,30),1,1,"C");
   $lobjPdf->Cell(200,6,utf8_decode("Datos del Familiar"),1,1,"C");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Cédula'),1,0,"C"); 
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode(number_format($row_participante[0],0,'','.')),1,0,"C");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,'Nacionalidad',1,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode(($row_participante[14]=='V')?'VENEZOLANO/A':'EXTRANJERO/A'),1,1,"C");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Primer nombre'),1,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode($row_participante[1]),1,0,"C");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Segundo nombre'),1,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode($row_participante[2]),1,1,"C");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Primer apellido'),1,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode($row_participante[3]),1,0,"C");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Segundo apellido'),1,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode($row_participante[4]),1,1,"C");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Sexo'),1,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode($row_participante[5]),1,0,"C");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Teléfono'),1,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode($row_participante[8]),1,1,"C");
	$lobjPdf->SetFont("arial","B",12);

    $lobjPdf->Ln(6);
	$lobjPdf->SetFont("arial","B",12);

    $lobjPdf->Cell(200,6,utf8_decode("PARTICIPANTES"),1,1,"C");
    $lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(30,6,utf8_decode('CÉDULA'),1,0,"C"); 
	$lobjPdf->Cell(100,6,utf8_decode('NOMBRE APELLIDO'),1,0,"C");
	$lobjPdf->Cell(70,6,utf8_decode('PARENTESCO'),1,0,"C");
	$lobjPdf->SetFont("arial","",12);
    $lobjPdf->Ln(6);

	for($i=0;$i<count($row_participante_familiar);$i++)
	{
		$lobjPdf->Cell(30,6,utf8_decode(number_format($row_participante_familiar[$i]['cedulapar'],0,'','.')),1,0,"C");
		$lobjPdf->Cell(100,6,utf8_decode($row_participante_familiar[$i]['nombrepar']),1,0,"C");
		$lobjPdf->Cell(70,6,utf8_decode($row_participante_familiar[$i]['descripcionpar']),1,0,"C");
   	 	$lobjPdf->Ln(6);
		
	}
   $lobjPdf->Output(); 
?>