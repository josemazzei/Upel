<?php
    date_default_timezone_set('America/Caracas');
    include_once("../clases/clase_asistencia.php");
    include_once("../clases/clase_curso.php");
    ob_end_clean();
    require_once("../libreria/fpdf/clsFpdf.php");
    require_once("../clases/clase_bitacora.php");
    require_once('../libreria/utilidades.php');
    require_once('../libreria/uuid.php');
    $lobjBitacora=new clsBitacora;
    $lobjUtil=new clsUtil;
    $lobjAsistencia = new clsAsistencia();
    $lobjCurso = new clsCurso();

   	$lobjPdf=new clsFpdf();
   	$lobjPdf->AliasNbPages();
   	$lobjPdf->codigo=UUID::v4();
   	$lobjPdf->AddPage("P","Letter");

   	$pcIdCurso=($_GET['idcurso']!='')?$_GET['idcurso']:'';
    $pcIdAsistencia=($_GET['idasistencia']!='')?$_GET['idasistencia']:'';
    $fecha=date("d-m-Y",strtotime($pcFecha));
    

   	$lcReal_ip=$lobjUtil->get_real_ip();
	$ldFecha=date('Y-m-d h:m');
	$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Reporte','-','idevaluacion','-',$lobjPdf->codigo,$idevaluacion,$_SESSION['usuario'],'evaluacion'); //envia los datos a la clase bitacora
	$lobjBitacora->registrar_bitacora();

    $lobjAsistencia->set_Curso($pcIdCurso);
    $lobjCurso->set_Curso($pcIdCurso);
    $lobjAsistencia->set_IdAsistencia($pcIdAsistencia);

    $laAsistencia=$lobjAsistencia->consultar_asistencia_participante();
    $laCurso=$lobjCurso->consultar_curso();


	$lobjPdf->Ln(10);
    $lobjPdf->SetFont("arial","B",12);
   
    $lobjPdf->Cell(0,6,utf8_decode("ASISTENCIA"),0,1,"C");

    $lobjPdf->Cell(0,6,utf8_decode("1.- DATOS DE IDENTIFICACIÓN"),0,1,"L");
	$lobjPdf->Ln(6);


    $lobjPdf->SetFont("arial","B",10);
	$lobjPdf->Cell(30,6,utf8_decode('CURSO:'),0,0,"L");
	$lobjPdf->SetFont("arial","",10);
	$lobjPdf->Cell(75,6,utf8_decode($laCurso[1]),'B',0,"L");

	$lobjPdf->SetFont("arial","B",10);
	$lobjPdf->Cell(30,6,utf8_decode('FECHA:'),0,0,"C");
	$lobjPdf->SetFont("arial","",10);
	$lobjPdf->Cell(55,6,utf8_decode($fecha),'B',1,"L");

	$lobjPdf->SetFont("arial","B",10);
	$lobjPdf->Cell(30,6,utf8_decode('ASIGNATURA:'),0,0,"L");
	$lobjPdf->SetFont("arial","",10);
	$lobjPdf->Cell(75,6,utf8_decode($laCurso[10]),'B',0,"L");

	$lobjPdf->SetFont("arial","B",10);
	$lobjPdf->Cell(30,6,utf8_decode('LAPSO:'),0,0,"C");
	$lobjPdf->SetFont("arial","",10);
	$lobjPdf->Cell(55,6,utf8_decode($laCurso[7]),'B',1,"L");

	$lobjPdf->SetFont("arial","B",10);
	$lobjPdf->Cell(30,6,utf8_decode('GRUPO:'),0,0,"L");
	$lobjPdf->SetFont("arial","",10);
	$lobjPdf->Cell(75,6,utf8_decode($laCurso[8]),'B',0,"L");

	$lobjPdf->SetFont("arial","B",10);
	$lobjPdf->Cell(30,6,utf8_decode('AULA:'),0,0,"C");
	$lobjPdf->SetFont("arial","",10);
	$lobjPdf->Cell(55,6,utf8_decode($laCurso[12]),'B',1,"L");

	$lobjPdf->SetFont("arial","B",10);
	$lobjPdf->Cell(30,6,utf8_decode('DOCENTE:'),0,0,"L");
	$lobjPdf->SetFont("arial","",10);
	$lobjPdf->Cell(75,6,utf8_decode($laCurso[11]),'B',1,"L");

    $lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Ln(5);
    $lobjPdf->Cell(0,6,utf8_decode("2.- DATOS DE LA ASISTENCIA"),0,1,"L");
	$lobjPdf->Ln(5);
    
    $lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(20,6,utf8_decode('ASISTIÓ'),1,0,"C"); 
	$lobjPdf->Cell(70,6,utf8_decode('UNIDAD'),1,0,"C");
	$lobjPdf->Cell(100,6,utf8_decode('OBJETIVOS'),1,1,"C");
    $lobjPdf->SetFont("arial","",10);

	$lobjPdf->Cell(20,6,utf8_decode($laAsistencia[2]),1,0,"C");
	for($j=0;$j<count($laAsistencia[4]);$j++)
	{
		$lobjPdf->Cell(70,6,utf8_decode($laAsistencia[4][$j][1]),1,0,"C");
		
	}
	if($j==0)
		$lobjPdf->Cell(70,6,utf8_decode('-'),1,0,"C");

	for($j=0;$j<count($laAsistencia[5]);$j++)
	{
		$lobjPdf->MultiCell(100,6,utf8_decode(($j+1).'.-'.$laAsistencia[5][$j][1]),1,"C");
	}
	if($j==0)
		$lobjPdf->MultiCell(100,6,utf8_decode('-'),1,"C");
    $lobjPdf->Ln(6);
	$lobjPdf->SetFont("arial","B",10);
	$lobjPdf->Cell(35,6,utf8_decode('OBSERVACIONES:'),0,0,"L");
	$lobjPdf->SetFont("arial","",10);
	$lobjPdf->Cell(155,6,utf8_decode($laAsistencia[3]),'B',1,"L");
    $lobjPdf->Ln(6);
   $lobjPdf->Output(); 
?>