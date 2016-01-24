<?php
    date_default_timezone_set('America/Caracas');
    include_once("../clases/clase_evaluacion.php");
    ob_end_clean();
    require_once("../libreria/fpdf/clsFpdf.php");
    require_once("../clases/clase_bitacora.php");
    require_once('../libreria/utilidades.php');
    require_once('../libreria/uuid.php');
    $lobjBitacora=new clsBitacora;
    $lobjUtil=new clsUtil;
    $lobjEvaluacion = new clsEvaluacion();

   	$lobjPdf=new clsFpdf();
   	$lobjPdf->AliasNbPages();
   	$lobjPdf->codigo=UUID::v4();
   	$lobjPdf->AddPage("L","Letter");
  	$idinstrumento=(isset($_GET['idinstrumento']))?$_GET['idinstrumento']:'';
  	$idcurso=(isset($_GET['idcurso']))?$_GET['idcurso']:'';
  	$idparticipante=(isset($_GET['idparticipante']))?$_GET['idparticipante']:'';
  	$fecha=(isset($_GET['fecha']))?$_GET['fecha']:'';
   	$lcReal_ip=$lobjUtil->get_real_ip();
	$ldFecha=date('Y-m-d h:m');
	$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Reporte','-','idevaluacion','-',$lobjPdf->codigo,$idevaluacion,$_SESSION['usuario'],'evaluacion'); //envia los datos a la clase bitacora
	$lobjBitacora->registrar_bitacora();

	$lobjEvaluacion->set_Instrumento($idinstrumento);
	$lobjEvaluacion->set_Participante($idparticipante);
	$lobjEvaluacion->set_Cruso($idcurso);
	$row_evaluacion=$lobjEvaluacion->consultar_evaluacion_vacia();
	$row_criterios=$lobjEvaluacion->consultar_items_evaluacion_vacia();


	$lobjPdf->Ln(10);
    $lobjPdf->SetFont("arial","B",12);
   
    $lobjPdf->Cell(0,6,utf8_decode("EVALUACIÓN DE APRENDIZAJES"),0,1,"C");
    $lobjPdf->setX(100);
    $lobjPdf->Cell(30,6,utf8_decode("LAPSO:"),0,0,"C");
	$lobjPdf->Cell(50,6,utf8_decode($row_evaluacion['nombrelap']),'B',1,"L");

    $lobjPdf->Cell(0,6,utf8_decode("1.- DATOS DE IDENTIFICACIÓN"),0,1,"L");
	$lobjPdf->Ln(6);

    $lobjPdf->SetFont("arial","B",10);
	$lobjPdf->Cell(75,6,utf8_decode('APELLIDOS Y NOMBRES:'),0,0,"C");
	$lobjPdf->SetFont("arial","",10);
	$lobjPdf->Cell(175,6,utf8_decode($row_evaluacion['nombreunopar'].' '.$row_evaluacion['nombredospar'].' '.$row_evaluacion['apellidounopar'].' '.$row_evaluacion['apellidodospar']),'B',1,"L");

	$lobjPdf->SetFont("arial","B",10);
	$lobjPdf->Cell(75,6,utf8_decode('CEDULA DE IDENTIDAD:'),0,0,"C");
	$lobjPdf->SetFont("arial","",10);
	$lobjPdf->Cell(75,6,utf8_decode($row_evaluacion['nacionalidadpar'].' - '.number_format($row_evaluacion['cedulapar'],0,'','.')),'B',0,"L");

	$lobjPdf->SetFont("arial","B",10);
	$lobjPdf->Cell(50,6,utf8_decode('EDAD:'),0,0,"C");
	$lobjPdf->SetFont("arial","",10);
	$lobjPdf->Cell(50,6,utf8_decode($row_evaluacion['edad']),'B',1,"L");

	$lobjPdf->SetFont("arial","B",10);
	$lobjPdf->Cell(75,6,utf8_decode('FECHA DE NACIMIENTO:'),0,0,"C");
	$lobjPdf->SetFont("arial","",10);
	$lobjPdf->Cell(75,6,utf8_decode($row_evaluacion['fechanacimientopar']),'B',0,"L");

	$lobjPdf->SetFont("arial","B",10);
	$lobjPdf->Cell(50,6,utf8_decode('LUGAR DE NACIMIENTO:'),0,0,"C");
	$lobjPdf->SetFont("arial","",10);
	$lobjPdf->Cell(50,6,utf8_decode($row_evaluacion['descripcionloc']),'B',1,"L");

	$lobjPdf->SetFont("arial","B",10);
	$lobjPdf->Cell(75,6,utf8_decode('CURSO:'),0,0,"C");
	$lobjPdf->SetFont("arial","",10);
	$lobjPdf->Cell(75,6,utf8_decode($row_evaluacion['nombrecur']),'B',0,"L");

	$lobjPdf->SetFont("arial","B",10);
	$lobjPdf->Cell(50,6,utf8_decode('DOCENTE DE AULA:'),0,0,"C");
	$lobjPdf->SetFont("arial","",10);
	$lobjPdf->Cell(50,6,utf8_decode($row_evaluacion['docente_aula_integrada']),'B',1,"L");

	$lobjPdf->SetFont("arial","B",10);
	$lobjPdf->Cell(75,6,utf8_decode('INSTITUCIÓN DONDE ESTA INTEGRADO:'),0,0,"C");
	$lobjPdf->SetFont("arial","",10);
	$lobjPdf->Cell(175,6,utf8_decode($row_evaluacion['institucion']),'B',1,"L");
	
	$lobjPdf->SetFont("arial","B",10);
	$lobjPdf->Cell(75,6,utf8_decode('DOCENTE ESPECIALISTA:'),0,0,"C");
	$lobjPdf->SetFont("arial","",10);
	$lobjPdf->Cell(175,6,utf8_decode($row_evaluacion['nombreunodoc'].' '.$row_evaluacion['apellidounodoc']),'B',1,"L");

	$lobjPdf->SetFont("arial","B",10);
	$lobjPdf->Cell(75,6,utf8_decode('FECHA:'),0,0,"C");
	$lobjPdf->SetFont("arial","",10);
	$lobjPdf->Cell(50,6,utf8_decode($fecha),'B',1,"L");
	$lobjPdf->Ln(10);
    $lobjPdf->SetFont("arial","B",12);
   
    $lobjPdf->Cell(0,6,utf8_decode("2.- DATOS DE LOS LOGROS"),0,1,"L");
	$lobjPdf->Ln(5);
	for($i=0;$i<count($row_criterios);$i++)
	{
		if($row_criterios[$i][3]=='completo')
		{
			$lobjPdf->SetFont("arial","B",10);
			$lobjPdf->Cell(75,6,utf8_decode($row_criterios[$i][2].': '),0,0,"C");
			$lobjPdf->SetFont("arial","",10);
			$lobjPdf->MultiCell(175,6,utf8_decode(''),'B',"L");
		}
		elseif(($row_criterios[$i][3]=='mitad')&&($i%2!=0))
		{
			$lobjPdf->SetFont("arial","B",10);
			$lobjPdf->Cell(40,6,utf8_decode($row_criterios[$i][2].': '),0,0,"C");
			$lobjPdf->SetFont("arial","",10);
			$lobjPdf->Cell(85,6,utf8_decode(''),'B',0,"L");
		}
		elseif(($row_criterios[$i][3]=='mitad')&&($i%2==0))
		{
			$lobjPdf->SetFont("arial","B",10);
			$lobjPdf->Cell(40,6,utf8_decode($row_criterios[$i][2].': '),0,0,"C");
			$lobjPdf->SetFont("arial","",10);
			$lobjPdf->Cell(85,6,utf8_decode(''),'B',1,"L");
		}
	}
   $lobjPdf->Output(); 
?>