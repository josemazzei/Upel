<?php
   date_default_timezone_set('America/Caracas');
   include_once("../clases/clase_inscripcion.php");
   ob_end_clean();
   require_once("../libreria/fpdf/clsFpdf.php");
   require_once("../clases/clase_bitacora.php");
   require_once('../libreria/utilidades.php');
   require_once('../libreria/uuid.php');
   $lobjBitacora=new clsBitacora;
   $lobjUtil=new clsUtil;
   $ObjInscripcion = new clsInscripcion();

   $lobjPdf=new clsFpdf();
   $lobjPdf->AliasNbPages();
   $lobjPdf->codigo=UUID::v4();
   $lobjPdf->AddPage("P","Legal");
   $Idparticipante=(isset($_GET['idparticipante']))?$_GET['idparticipante']:'';
   $Cedulapar=(isset($_GET['cedula']))?$_GET['cedula']:'';
   	$lcReal_ip=$lobjUtil->get_real_ip();
    $ldFecha=date('Y-m-d h:m');
   	$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Reporte','-','idparticipante','-',$lobjPdf->codigo,$Idparticipante,$_SESSION['usuario'],'plantilla_inscripcion'); //envia los datos a la clase bitacora
   	$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
	$ObjInscripcion->set_Idparticipante($Idparticipante);
	$row_participante=$ObjInscripcion->consultar_participante_inscripcion();
	$row_inscripcion=$ObjInscripcion->consultar_inscripcion();
	$row_participante_familiar=$ObjInscripcion->consultar_participante_familiar();

   $lobjPdf->SetFont("arial","B",12);
   $lobjPdf->Ln(5);
   $lobjPdf->Cell(0,6,utf8_decode("HOJA DE VIDA"),0,1,"C");
   $lobjPdf->Ln(6);
         //analizamos los nombres de las tablas con mas longitud para colocar de ese tamaño las celdas
	$row_inscripcion[8]=($row_inscripcion[8])?$row_inscripcion[8]:'default.jpg';
	$lobjPdf->Cell(50,30,$lobjPdf->Image('../media/img/participantes/'.$row_inscripcion[8],10,68,50,30),1,1,"C");
   $lobjPdf->Cell(200,6,utf8_decode("DATOS DEL PARTICIPANTE"),0,1,"C");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Primer nombre:'),0,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode($row_participante[2]),'B',0,"L");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Segundo nombre:'),0,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode($row_participante[3]),'B',1,"L");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Primer apellido:'),0,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode($row_participante[4]),'B',0,"L");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Segundo apellido:'),0,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode($row_participante[5]),'B',1,"L");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Fecha nacimiento:'),0,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode($row_participante[9]),'B',0,"L");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Edad:'),0,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode($row_participante[20]),'B',1,"L");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Sexo:'),0,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode($row_participante[6]),'B',0,"L");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Cédula:'),0,0,"C"); 
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode($row_participante[18].'-'.number_format($row_participante[1],0,'','.')),'B',1,"L");
	
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Dirección:'),0,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->MultiCell(150,6,utf8_decode($row_participante[8]),'B',"L");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Teléfono:'),0,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode($row_participante[7]),'B',0,"L");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Correo:'),0,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode($row_participante[21]),'B',1,"L");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Etnia:'),0,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode(($row_participante[19]=='1')?'SI':'NO'),'B',0,"L");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Braille:'),0,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode($row_participante[14]),'B',1,"L");
	

	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Condición visual:'),0,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(150,6,utf8_decode($row_participante[15]),'B',1,"L");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Resumen diagnóstico:'),0,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->MultiCell(150,6,utf8_decode($row_inscripcion[25]),'B',"L");

	
	
	
	/*$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Institución:'),0,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode($row_participante[16]),'B',1,"L");*/

	$lobjPdf->Ln(2);
	$lobjPdf->SetFont("arial","B",12);

    $lobjPdf->Cell(200,6,utf8_decode("DATOS FAMILIARES DEL PARTICIPANTE"),0,1,"C");
	$lobjPdf->Ln(2);
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Nº de hermanos:'),0,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode($row_participante[23]),'B',0,"L");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Hijo Nº:'),0,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode($row_participante[10]),'B',1,"L");

	for($i=0;$i<count($row_participante_familiar);$i++)
	{
    $lobjPdf->Ln();

	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(70,6,utf8_decode('Nombre y apellido del '.$row_participante_familiar[$i]['descripcionpar'].' : '),0,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(130,6,utf8_decode($row_participante_familiar[$i]['nombrefam']),'B',1,"L");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Fecha de nacimiento:'),0,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(30,6,utf8_decode($row_participante_familiar[$i]['fechanacimientofam']),'B',0,"L");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(30,6,utf8_decode('CI:'),0,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(30,6,utf8_decode($row_participante_familiar[$i]['idfamiliar']),'B',0,"L");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(30,6,utf8_decode('Edad:'),0,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(30,6,utf8_decode($row_participante_familiar[$i]['edad']),'B',1,"L");

	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Grado de Instrucción:'),0,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode($row_participante_familiar[$i]['gradoinstrucfam']),'B',0,"L");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Ocupación:'),0,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->MultiCell(50,6,utf8_decode($row_participante_familiar[$i]['ocupacionfam']),'B',"L");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Nº Hijos:'),0,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode($row_participante_familiar[$i]['numhijofam']),'B',0,"L");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Condición Visual:'),0,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode($row_participante_familiar[$i]['descripciondia']),'B',1,"L");

	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Teléfono:'),0,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode($row_participante_familiar[$i]['telefonofam']),'B',1,"L");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Dirección:'),0,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->MultiCell(150,6,utf8_decode($row_participante_familiar[$i]['direccionfam']),'B',"L");
	
	$lobjPdf->Cell(200,6,utf8_decode('_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _'),0,0,"C");
		
	}

    $lobjPdf->Ln(6);
	$lobjPdf->SetFont("arial","B",12);

    $lobjPdf->Cell(200,6,utf8_decode("DATOS DE LA INSCRIPCIÓN"),0,1,"C");
	$lobjPdf->Ln(6);
	
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Grado de Instrucción:'),0,0,"C"); 
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode($row_inscripcion[17]),'B',0,"L");
    $lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Estudia actualmente:'),0,0,"C"); 
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode(($row_inscripcion[16])?'SI':'NO'),'B',1,"L");

	if($row_inscripcion[14]=='SI')
	{
		$lobjPdf->SetFont("arial","B",12);
		$lobjPdf->Cell(50,6,utf8_decode('Institución:'),0,0,"C");
		$lobjPdf->SetFont("arial","",12);
		$lobjPdf->Cell(100,6,utf8_decode($row_inscripcion[14]),'B',1,"L");
		$lobjPdf->SetFont("arial","B",12);
		$lobjPdf->Cell(40,6,utf8_decode('Grado:'),0,0,"C");
		$lobjPdf->SetFont("arial","",12);
		$lobjPdf->Cell(40,6,utf8_decode($row_inscripcion[2]),'B',0,"L");
		$lobjPdf->SetFont("arial","B",12);
		$lobjPdf->Cell(40,6,utf8_decode('Sección:'),0,0,"C");
		$lobjPdf->SetFont("arial","",12);
		$lobjPdf->Cell(40,6,utf8_decode($row_inscripcion[3]),'B',0,"L");
		$lobjPdf->SetFont("arial","B",12);
		$lobjPdf->Cell(40,6,utf8_decode('Turno:'),0,0,"C");
		$lobjPdf->SetFont("arial","",12);
		$lobjPdf->Cell(40,6,utf8_decode($row_inscripcion[18]),'B',1,"L");
	}

	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Disponibilidad:'),0,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode($row_inscripcion[5]),'B',0,"L");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Días:'),0,0,"C");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode($row_inscripcion[6]),'B',1,"L");

	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Docente del Grado:'),0,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode($row_inscripcion[19]),'B',0,"L");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Teléfono:'),0,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode($row_inscripcion[20]),'B',1,"L");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Docente de aula integrada:'),0,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode($row_inscripcion[21]),'B',0,"L");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Teléfono:'),0,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode($row_inscripcion[22]),'B',1,"L");

	$lobjPdf->Ln(6);
	$lobjPdf->SetFont("arial","B",12);

    $lobjPdf->Cell(200,6,utf8_decode("CONDICIÓN HABITACIONAL"),0,1,"C");

	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Medio:'),0,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode($row_participante[11]),'B',0,"L");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Tenencia de vivienda:'),0,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode($row_participante[12]),'B',1,"L");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Tipo de construcción:'),0,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode($row_participante[13]),'B',1,"L");

	$lobjPdf->Ln(6);
	$lobjPdf->SetFont("arial","B",12);

    $lobjPdf->Cell(200,6,utf8_decode("INGRESOS FAMILIARES"),0,1,"C");

	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(80,6,utf8_decode('Responsable del grupo familiar:'),0,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(120,6,utf8_decode($row_inscripcion[26]),'B',1,"L");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(80,6,utf8_decode('Ingreso Mensual:'),0,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(40,6,utf8_decode($row_inscripcion[27]),'B',0,"L");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('Otro ingreso:'),0,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(30,6,utf8_decode($row_inscripcion[28]),'B',0,"L");
	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(50,6,utf8_decode('No ingreso:'),0,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(50,6,utf8_decode($row_inscripcion[29]),'B',1,"L");

	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(80,6,utf8_decode('Está dispuesto a colaborar con CAIDV:'),0,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->MultiCell(120,6,utf8_decode($row_inscripcion[30]),'B',"L");

	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(80,6,utf8_decode('Aprender BRAILLE:'),0,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(120,6,utf8_decode($row_inscripcion[31]),'B',"L");

	$lobjPdf->SetFont("arial","B",12);
	$lobjPdf->Cell(80,6,utf8_decode('De que tiempo dispone para:'),0,0,"C");
	$lobjPdf->SetFont("arial","",12);
	$lobjPdf->Cell(120,6,utf8_decode($row_inscripcion[32]),'B',"L");
	
   $lobjPdf->Output(); 
?>