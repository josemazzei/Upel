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
   	$lobjPdf->AddPage("L","Legal");

   	$pcIdCurso=($_GET['id']!='')?$_GET['id']:'';
    $pcFecha=($_GET['fecha']!='')?$_GET['fecha']:'';
    $pcIdAsignatura=($_GET['idasignatura']!='')?$_GET['idasignatura']:'';
    $fecha=date("d-m-Y",strtotime($pcFecha));
    

   	$lcReal_ip=$lobjUtil->get_real_ip();
	$ldFecha=date('Y-m-d h:m');
	$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Reporte','-','idevaluacion','-',$lobjPdf->codigo,$idevaluacion,$_SESSION['usuario'],'evaluacion'); //envia los datos a la clase bitacora
	$lobjBitacora->registrar_bitacora();

    $lobjAsistencia->set_Curso($pcIdCurso);
    $lobjCurso->set_Curso($pcIdCurso);
    $laAsistencia=$lobjAsistencia->consultar_asistencia($pcFecha);
    $laCurso=$lobjCurso->consultar_curso();


	$lobjPdf->Ln(10);
    $lobjPdf->SetFont("arial","B",12);
   
    $lobjPdf->Cell(0,6,utf8_decode("ASISTENCIA"),0,1,"C");

    $lobjPdf->Cell(0,6,utf8_decode("1.- DATOS DE IDENTIFICACIÓN"),0,1,"L");
	$lobjPdf->Ln(6);


    $lobjPdf->SetFont("arial","B",10);
	$lobjPdf->Cell(20,6,utf8_decode('CURSO:'),0,0,"L");
	$lobjPdf->SetFont("arial","",10);
	$lobjPdf->Cell(75,6,utf8_decode($laCurso[1]),'B',0,"L");

	$lobjPdf->SetFont("arial","B",10);
	$lobjPdf->Cell(30,6,utf8_decode('FECHA:'),0,0,"C");
	$lobjPdf->SetFont("arial","",10);
	$lobjPdf->Cell(30,6,utf8_decode($fecha),'B',0,"L");

	$lobjPdf->SetFont("arial","B",10);
	$lobjPdf->Cell(30,6,utf8_decode('LAPSO:'),0,0,"C");
	$lobjPdf->SetFont("arial","",10);
	$lobjPdf->Cell(30,6,utf8_decode($laCurso[7]),'B',0,"L");

	$lobjPdf->SetFont("arial","B",10);
	$lobjPdf->Cell(50,6,utf8_decode('ASIGNATURA:'),0,0,"C");
	$lobjPdf->SetFont("arial","",10);
	$lobjPdf->Cell(75,6,utf8_decode($laCurso[10]),'B',1,"L");

	$lobjPdf->SetFont("arial","B",10);
	$lobjPdf->Cell(20,6,utf8_decode('GRUPO:'),0,0,"L");
	$lobjPdf->SetFont("arial","",10);
	$lobjPdf->Cell(75,6,utf8_decode($laCurso[8]),'B',0,"L");

	$lobjPdf->SetFont("arial","B",10);
	$lobjPdf->Cell(30,6,utf8_decode('DOCENTE:'),0,0,"C");
	$lobjPdf->SetFont("arial","",10);
	$lobjPdf->Cell(75,6,utf8_decode($laCurso[11]),'B',0,"L");

	$lobjPdf->SetFont("arial","B",10);
	$lobjPdf->Cell(20,6,utf8_decode('AULA:'),0,0,"C");
	$lobjPdf->SetFont("arial","",10);
	$lobjPdf->Cell(50,6,utf8_decode($laCurso[12]),'B',1,"L");

    $lobjPdf->SetFont("arial","B",12);
    $lobjPdf->Cell(0,6,utf8_decode("2.- LISTADO DE PARTICIPANTES"),0,1,"L");
	$lobjPdf->Ln(5);
    $lobjPdf->SetFont("arial","B",10);
	$lobjPdf->Cell(30,6,utf8_decode('CÉDULA'),1,0,"C"); 
	$lobjPdf->Cell(80,6,utf8_decode('APELLIDO Y NOMBRE'),1,0,"C");
	$lobjPdf->Cell(20,6,utf8_decode('ASISTIÓ'),1,0,"C");
	$lobjPdf->Cell(70,6,utf8_decode('UNIDAD'),1,0,"C");
	$lobjPdf->Cell(70,6,utf8_decode('OBJETIVOS'),1,0,"C");
	$lobjPdf->Cell(70,6,utf8_decode('OBSERVACIÓN'),1,0,"C");
	$lobjPdf->SetFont("arial","",12);
    $lobjPdf->Ln(6);

    $lobjPdf->SetFont("arial","",10);
	for($i=0;$i<count($laAsistencia);$i++)
	{
		$unidades=$objetivos='';
        $laAsistencia[$i][6]=($laAsistencia[$i][6])?$laAsistencia[$i][6]:'default.jpg';

		$lobjPdf->Cell(30,6,utf8_decode(number_format($laAsistencia[$i][4],0,'','.')),1,0,"C");
		$lobjPdf->Cell(80,6,utf8_decode($laAsistencia[$i][2].' '.$laAsistencia[$i][0]),1,0,"C");
		if($laAsistencia[$i][9]!='')
			$lobjPdf->Cell(20,6,utf8_decode(($laAsistencia[$i][9])?'SI':'NO'),1,0,"C");
		else
			$lobjPdf->Cell(20,6,utf8_decode(''),1,0,"C");
		for($j=0;$j<count($laAsistencia[$i][11]);$j++)
		{
			$unidades.=$laAsistencia[$i][11][$j][1].',';
		}
		for($j=0;$j<count($laAsistencia[$i][12]);$j++)
		{
			$objetivos.=$laAsistencia[$i][12][$j][1].',';
		}
		$unidades=substr($unidades,0,-1);
		$objetivos=substr($objetivos,0,-1);

		$lobjPdf->Cell(70,6,utf8_decode($unidades),1,0,"C");
		$lobjPdf->Cell(70,6,utf8_decode($objetivos),1,0,"C");
		$lobjPdf->Cell(70,6,utf8_decode(($laAsistencia[$i][13])?$laAsistencia[$i][13]:''),1,0,"C");

   	 	$lobjPdf->Ln(6);
		
	}

   $lobjPdf->Output(); 
?>