<?php
   date_default_timezone_set('America/Caracas');
   include_once("../clases/clase_curso.php");
   ob_end_clean();
   require_once("../libreria/fpdf/clsFpdf.php");
   require_once("../clases/clase_bitacora.php");
   require_once('../libreria/utilidades.php');
   require_once('../libreria/uuid.php');
   $lobjBitacora=new clsBitacora;
   $lobjUtil=new clsUtil;
   $ObjCurso = new clsCurso();
	$lobjPdf=new clsFpdf();
   $lcReal_ip=$lobjUtil->get_real_ip();
    $ldFecha=date('Y-m-d h:m');
    
   $lobjPdf->AliasNbPages();
   $lobjPdf->codigo=UUID::v4();
   $lobjPdf->AddPage("L","Legal");
   $lobjPdf->SetFont("arial","B",12);
   	$Idcurso=(isset($_GET['idcurso']))?$_GET['idcurso']:'';
   	$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Reporte','-','idcurso','-', $lobjPdf->codigo,$Idcurso,$_SESSION['usuario'],'historial_curso'); //envia los datos a la clase bitacora
   	$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
   	$ObjCurso->set_Curso($Idcurso);
	$row_cursos=$ObjCurso->historial_curso();

   
   $lobjPdf->Ln(10);
   $lobjPdf->Cell(0,6,utf8_decode("INFORMACIÓN DEL CURSO"),0,1,"C");
   $lobjPdf->Ln();
         //analizamos los nombres de las tablas con mas longitud para colocar de ese tamaño las celdas

	$lobjPdf->Cell(300,6,utf8_decode("DATOS DEL CURSO"),1,1,"C");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Nombre'),1,0,"C"); 
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(100,6,utf8_decode($row_cursos['nombrecur']),1,0,"C");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Asignatura'),1,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(100,6,utf8_decode($row_cursos['nombreasi']),1,1,"C");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Grupo'),1,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(100,6,utf8_decode($row_cursos['nombregru']),1,0,"C");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Aula'),1,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(100,6,utf8_decode($row_cursos['nombreaul']),1,1,"C");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Matriculados'),1,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(100,6,utf8_decode($row_cursos['cantidad_participantes']),1,0,"C");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Desincorporados'),1,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(100,6,utf8_decode($row_cursos['cantidad_retirados']),1,1,"C");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Lapso'),1,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(250,6,utf8_decode($row_cursos['nombrelap']),1,1,"C");
	
	$lobjPdf->Ln(6);
	$lobjPdf->SetFont("arial","B",12);

				$lobjPdf->Ln(6);
				$lobjPdf->SetFont("arial","B",12);

				$inscritos = $ObjCurso->consultar_participantes_inscritos();
			    $lobjPdf->Cell(300,6,utf8_decode("INSCRITOS "),1,1,"C");
			    $lobjPdf->SetFont("arial","B",12);
				$lobjPdf->Cell(60,6,utf8_decode('Cédula'),1,0,"C"); 
				$lobjPdf->Cell(120,6,utf8_decode('Apellidos'),1,0,"C");
				$lobjPdf->Cell(120,6,utf8_decode('Nombres'),1,1,"C");
				$lobjPdf->SetFont("arial","",12);

				if($inscritos)
				{
					for($i=0;$i<count($inscritos);$i++)
					{
						$lobjPdf->Cell(60,6,utf8_decode(number_format($inscritos[$i][4],0,'','.')),1,0,"C"); 
						$lobjPdf->Cell(120,6,utf8_decode($inscritos[$i][2].' '.$inscritos[$i][3]),1,0,"C");
						$lobjPdf->Cell(120,6,utf8_decode($inscritos[$i][0].' '.$inscritos[$i][1]),1,1,"C");
					}
				}
				else
				{
					$lobjPdf->Cell(300,6,utf8_decode('NO SE HAN INSCRITO ESTUDIANTES.'),1,0,"C"); 
				}
				

				$lobjPdf->Ln(6);
				$lobjPdf->SetFont("arial","B",12);


				$retirados = $ObjCurso->consultar_participantes_retirados();
			    $lobjPdf->Cell(300,6,utf8_decode("DESINCORPORADOS "),1,1,"C");
			    $lobjPdf->SetFont("arial","B",12);
				$lobjPdf->Cell(60,6,utf8_decode('Cédula'),1,0,"C"); 
				$lobjPdf->Cell(120,6,utf8_decode('Apellidos'),1,0,"C");
				$lobjPdf->Cell(120,6,utf8_decode('Nombres'),1,1,"C");
				$lobjPdf->SetFont("arial","",12);

				if($retirados)
				{
					for($i=0;$i<count($retirados);$i++)
					{
						$lobjPdf->Cell(60,6,utf8_decode(number_format($retirados[$i][4],0,'','.')),1,0,"C"); 
						$lobjPdf->Cell(120,6,utf8_decode($retirados[$i][2].' '.$retirados[$i][3]),1,0,"C");
						$lobjPdf->Cell(120,6,utf8_decode($retirados[$i][0].' '.$retirados[$i][1]),1,1,"C");
					}
				}
				else
				{
					$lobjPdf->Cell(300,6,utf8_decode('NO SE HAN RETIRADO ESTUDIANTES.'),1,0,"C"); 
				}
				
		
	
   $lobjPdf->Output(); 
?>