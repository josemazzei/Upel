<?php
   date_default_timezone_set('America/Caracas');
   include_once("../clases/clase_lapso.php");
   include_once("../clases/clase_curso.php");
   ob_end_clean();
   require_once("../libreria/fpdf/clsFpdf.php");
    require_once("../clases/clase_bitacora.php");
   require_once('../libreria/utilidades.php');
   require_once('../libreria/uuid.php');
   $lobjBitacora=new clsBitacora;
   $lobjUtil=new clsUtil;
   $ObjLapso = new clsLapso();
   $ObjCurso = new clsCurso();
    $lobjPdf=new clsFpdf();
   $lcReal_ip=$lobjUtil->get_real_ip();
    $ldFecha=date('Y-m-d h:m');
    
   $lobjPdf->AliasNbPages();
   $lobjPdf->codigo=UUID::v4();
   $lobjPdf->AddPage("L","Legal");
   $lobjPdf->SetFont("arial","B",12);
   $IdLapso=(isset($_GET['idlapso']))?$_GET['idlapso']:'';
   	$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Reporte','-','idlapso','-',$lobjPdf->codigo,$IdLapso,$_SESSION['usuario'],'historial_lapso'); //envia los datos a la clase bitacora
   	$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
   	$ObjLapso->set_Lapso($IdLapso);
   	$ObjCurso->set_Lapso($IdLapso);
	$row_detalle=$ObjLapso->historial_lapso();
	$row_lapso=$ObjLapso->consultar_lapso_bitacora();
	$row_cursos=$ObjCurso->historial_cursos();

   
   $lobjPdf->Ln(10);
   $lobjPdf->Cell(0,6,utf8_decode("HISTORIAL DEL LAPSO"),0,1,"C");
   $lobjPdf->Ln();
         //analizamos los nombres de las tablas con mas longitud para colocar de ese tamaño las celdas

	$lobjPdf->Cell(200,6,utf8_decode("DATOS DEL LAPSO"),1,1,"C");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Nombre'),1,0,"C"); 
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(150,6,utf8_decode($row_lapso['nombrelap']),1,1,"C");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Fecha Inicio'),1,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode($row_lapso['fechainilap']),1,0,"C");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Fecha Fin'),1,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode($row_lapso['fechafinlap']),1,1,"C");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Estado'),1,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode($row_lapso['estadolap']),1,0,"C");
	$lobjPdf->Cell(100,6,'',1,1,"C");
	
	$lobjPdf->Ln(6);
	$lobjPdf->SetFont("arial","B",12);


	$lobjPdf->Cell(200,6,utf8_decode("DETALLE DEL LAPSO"),1,1,"C");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(80,6,utf8_decode('CURSOS:'),1,0,"C"); 
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(20,6,utf8_decode($row_detalle['cantidad_cursos']),1,0,"C");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(80,6,utf8_decode('PARTICIPANTES'),1,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(20,6,utf8_decode($row_detalle['cantidad_participantes']),1,1,"C");

	if($row_cursos)
	{
		for($i=0;$i<count($row_cursos);$i++)
		{
			if($tmpvar!=$row_cursos[$i][1])
			{
				$tmpvar=$row_cursos[$i][1];
				 $lobjPdf->Ln(6);
				$lobjPdf->SetFont("arial","B",12);

			    $lobjPdf->Cell(340,6,utf8_decode("HISTORIAL DE CURSOS ".$row_cursos[$i][1]),1,1,"C");
			    $lobjPdf->SetFont("arial","B",12);
				$lobjPdf->Cell(40,6,utf8_decode('Grupo'),1,0,"C"); 
				$lobjPdf->Cell(70,6,utf8_decode('Asignatura'),1,0,"C");
				$lobjPdf->Cell(80,6,utf8_decode('Nombre'),1,0,"C");
				$lobjPdf->Cell(50,6,utf8_decode('Aula'),1,0,"C");
				$lobjPdf->Cell(50,6,utf8_decode('Matriculados'),1,0,"C");
				$lobjPdf->Cell(50,6,utf8_decode('Desincorporados'),1,1,"C");
				$lobjPdf->SetFont("arial","",12);

				$lobjPdf->Cell(40,6,utf8_decode($row_cursos[$i][4]),1,0,"C");
				$lobjPdf->Cell(70,6,utf8_decode($row_cursos[$i][2]),1,0,"C");
				$lobjPdf->Cell(80,6,utf8_decode($row_cursos[$i][0]),1,0,"C");
				$lobjPdf->Cell(50,6,$row_cursos[$i][3],1,0,"C");
				$lobjPdf->Cell(50,6,$row_cursos[$i][5],1,0,"C");
				$lobjPdf->Cell(50,6,$row_cursos[$i][6],1,1,"C");
			}
			else
			{
				$lobjPdf->Cell(40,6,utf8_decode($row_cursos[$i][4]),1,0,"C");
				$lobjPdf->Cell(70,6,utf8_decode($row_cursos[$i][2]),1,0,"C");
				$lobjPdf->Cell(80,6,utf8_decode($row_cursos[$i][0]),1,0,"C");
				$lobjPdf->Cell(50,6,$row_cursos[$i][3],1,0,"C");
				$lobjPdf->Cell(50,6,$row_cursos[$i][5],1,0,"C");
				$lobjPdf->Cell(50,6,$row_cursos[$i][6],1,1,"C");
			}
		}
	}
	else
	{
		 $lobjPdf->Ln(6);
				$lobjPdf->SetFont("arial","B",12);
		$lobjPdf->Cell(200,6,utf8_decode("HISTORIAL DE CURSOS "),1,1,"C");
			    $lobjPdf->SetFont("arial","B",12);
				$lobjPdf->Cell(40,6,utf8_decode('Grupo'),1,0,"C"); 
				$lobjPdf->Cell(50,6,utf8_decode('Asignatura'),1,0,"C");
				$lobjPdf->Cell(70,6,utf8_decode('Nombre'),1,0,"C");
				$lobjPdf->Cell(40,6,utf8_decode('Aula'),1,1,"C");
				$lobjPdf->SetFont("arial","",12);

    	$lobjPdf->Cell(200,6,utf8_decode('NO SE HA REGISTRADO NINGUN CURSO.'),1,1,"C");
	}
	
   $lobjPdf->Output(); 
?>