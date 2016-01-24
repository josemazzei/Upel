<?php
   date_default_timezone_set('America/Caracas');
   include_once("../clases/clase_inscripcion.php");
   include_once("../clases/clase_curso.php");
   ob_end_clean();
   require_once("../libreria/fpdf/clsFpdf.php");
   require_once("../clases/clase_bitacora.php");
   require_once('../libreria/utilidades.php');
   require_once('../libreria/uuid.php');
   $lobjBitacora=new clsBitacora;
   $lobjUtil=new clsUtil;
   $ObjInscripcion = new clsInscripcion();
   $ObjCurso = new clsCurso();
   $lobjPdf=new clsFpdf();
   $lcReal_ip=$lobjUtil->get_real_ip();
    $ldFecha=date('Y-m-d h:m');

   $lobjPdf->AliasNbPages();
   $lobjPdf->codigo=UUID::v4();
   $lobjPdf->AddPage("P","Legal");
   $lobjPdf->SetFont("arial","B",12);
   $Idparticipante=(isset($_GET['idparticipante']))?$_GET['idparticipante']:'';
   $Cedulapar=(isset($_GET['cedula']))?$_GET['cedula']:'';
	$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Reporte','-','idparticipante','-',$lobjPdf->codigo,$Idparticipante,$_SESSION['usuario'],'historial_participante'); //envia los datos a la clase bitacora
   	$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
   	$ObjInscripcion->set_Idparticipante($Idparticipante);
	$row_participante=$ObjInscripcion->consultar_participante_inscripcion();
	$row_inscripcion=$ObjInscripcion->consultar_inscripcion();
	$row_cursos=$ObjCurso->historial_participante($Idparticipante);

   $lobjPdf->Ln(10);
   $lobjPdf->Cell(0,6,utf8_decode("HISTORIAL DE CURSOS INSCRITOS"),0,1,"C");
   $lobjPdf->Ln();
         //analizamos los nombres de las tablas con mas longitud para colocar de ese tamaño las celdas
	$row_inscripcion[8]=($row_inscripcion[8])?$row_inscripcion[8]:'default.jpg';

	if($row_inscripcion[8]=='default.jpg')
		$lobjPdf->Cell(50,30,$lobjPdf->Image('../media/img/participantes/'.$row_inscripcion[8],10,74,40,25),1,1,"C");
	else
		$lobjPdf->Cell(50,30,$lobjPdf->Image('../media/img/participantes/'.$row_inscripcion[8],10,73,50,30),1,1,"C");
   $lobjPdf->Cell(200,6,utf8_decode("DATOS DEL PARTICIPANTE"),1,1,"C");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Cédula'),1,0,"C"); 
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode(number_format($row_participante[1],0,'','.')),1,0,"C");
	$lobjPdf->Cell(100,6,'',1,1,"C");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Primer nombre'),1,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode($row_participante[2]),1,0,"C");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Segundo nombre'),1,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode($row_participante[3]),1,1,"C");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Primer apellido'),1,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode($row_participante[4]),1,0,"C");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Segundo apellido'),1,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode($row_participante[5]),1,1,"C");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Sexo'),1,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode($row_participante[6]),1,0,"C");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Teléfono'),1,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode($row_participante[7]),1,1,"C");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Fecha nacimiento'),1,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode($row_participante[9]),1,0,"C");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Braille'),1,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode($row_participante[14]),1,1,"C");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Hijo Nº'),1,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode($row_participante[10]),1,0,"C");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Tenencia de vivienda'),1,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode($row_participante[11]),1,1,"C");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Medio'),1,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode($row_participante[12]),1,0,"C");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Tipo de construcción'),1,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode($row_participante[13]),1,1,"C");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Institución'),1,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode($row_participante[16]),1,0,"C");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Diagnóstico'),1,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode($row_participante[15]),1,1,"C");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Dirección'),1,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->MultiCell(150,6,utf8_decode($row_participante[8]),1,"L");

   
	if($row_cursos)
	{
		for($i=0;$i<count($row_cursos);$i++)
		{
			if($tmpvar!=$row_cursos[$i][1])
			{
				$tmpvar=$row_cursos[$i][1];
				 $lobjPdf->Ln(6);
				$lobjPdf->SetFont("arial","B",12);

			    $lobjPdf->Cell(200,6,utf8_decode("HISTORIAL DE CURSOS ".$row_cursos[$i][1]),1,1,"C");
			    $lobjPdf->SetFont("arial","B",12);
				$lobjPdf->Cell(40,6,utf8_decode('Grupo'),1,0,"C"); 
				$lobjPdf->Cell(50,6,utf8_decode('Asignatura'),1,0,"C");
				$lobjPdf->Cell(70,6,utf8_decode('Nombre'),1,0,"C");
				$lobjPdf->Cell(40,6,utf8_decode('Aula'),1,1,"C");
				$lobjPdf->SetFont("arial","",12);

				$lobjPdf->Cell(40,6,utf8_decode($row_cursos[$i][4]),1,0,"C");
				$lobjPdf->Cell(50,6,utf8_decode($row_cursos[$i][2]),1,0,"C");
				$lobjPdf->Cell(70,6,utf8_decode($row_cursos[$i][0]),1,0,"C");
				$lobjPdf->Cell(40,6,$row_cursos[$i][3],1,1,"C");
			}
			else
			{
				$lobjPdf->Cell(40,6,utf8_decode($row_cursos[$i][4]),1,0,"C");
				$lobjPdf->Cell(50,6,utf8_decode($row_cursos[$i][2]),1,0,"C");
				$lobjPdf->Cell(70,6,utf8_decode($row_cursos[$i][0]),1,0,"C");
				$lobjPdf->Cell(40,6,$row_cursos[$i][3],1,1,"C");
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

    	$lobjPdf->Cell(200,6,utf8_decode('NO SE HA INSCRITO A NINGUN CURSO.'),1,1,"C");
	}
	
   $lobjPdf->Output(); 
?>