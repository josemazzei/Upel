<?php
include('../clases/clase_inscripcion.php');
include('../clases/clase_participante.php');
include('../clases/clase_curso.php');
$lobjInscripcion = NEW clsInscripcion();
$lobjParticipante = NEW clsParticipante();
$lobjCurso = NEW clsCurso();
$id=(isset($_GET['id']))?$_GET['id']:"";
$lobjParticipante->set_Idparticipante($id);
$lobjInscripcion->set_Idparticipante($id);
$Datos_Participante = $lobjParticipante->consultar_participante_bitacora();
$Datos_Inscripcion = $lobjInscripcion->consultar_inscripcion_bitacora();
$Cursos = $lobjCurso->historial_participante($id);

?>
<script type="text/javascript" charset="utf-8">
    $(document).ready(function() {
        oTable = $('#filtro').dataTable({
            "bJQueryUI": true,
            "sPaginationType": "full_numbers",
            "iDisplayLength": 5                    
        });
    } );
</script>  
<div style="float: left" class="col-lg-8 span8 pull-left">
    <h3>Participantes Inscritos</h3>
    <form action="../controlador/control_inscripcion_curso.php" method="POST" name="form_lapso">
        <input type="hidden" value="inscribir_curso" name="operacion" />
        <input type="hidden" value="<?php print($Datos_Curso[0]);?>" name="idcurso" />
        <input type="hidden" value="<?php print($Datos_Curso[3]);?>" name="capacidad" />
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label><b>Cédula:</b> <?php print(number_format($Datos_Participante['cedulapar'],0,'','.')); ?></label>
            </div>
        </div>
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label><b>Primer Nombre:</b> <?php print($Datos_Participante['nombreunopar']); ?></label>
            </div>
            
            <div class="col-lg-6 span6">
                <label><b>Segundo Nombre:</b> <?php print(($Datos_Participante['nombredospar'])?$Datos_Participante['nombredospar']:'N/A'); ?> </label>
            </div>
        </div>
         <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label><b>Primer Apellido:</b> <?php print($Datos_Participante['apellidounopar']); ?> </label>
            </div>
            <div class="col-lg-6 span6">
                <label><b>Segundo Apellido:</b> <?php print(($Datos_Participante['apellidodospar'])?$Datos_Participante['apellidodospar']:'N/A'); ?> </label>
            </div>
        </div>
        <div class="row-fluid">
            <div class="col-lg-12 span12" style="text-align:center;">
                <h5>HISTORIAL DEL CURSO</h5>
            </div>
        </div>
        <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable dataTable"> 
            <thead>
                <th>Lapso</th><th>Grupo</th><th>Asignatura</th><th>Nombre</th><th>Aula</th>
            </thead>
            <tbody>
            <?php
                    if($Cursos)
                    {         
                        for($i=0;$i<count($Cursos);$i++)
                        {
                            echo '<tr>';
                            echo '<td>'.$Cursos[$i][1].'</td>';
                            echo '<td >'.$Cursos[$i][4].'</td>';
                            echo '<td >'.$Cursos[$i][2].'</td>';
                            echo '<td >'.$Cursos[$i][0].'</td>';
                            echo '<td >'.$Cursos[$i][3].'</td>';
                           echo '</tr>';
                        }
                    }
                    else
                    {
                        echo '<tr><td colspan="4">NO SE HA INSCRITO EN NINGUN CURSO.</td></tr>';
                    }
                ?>
                </tbody>
        </table>
        <div class="botonera">
            <input type="button" class="btn btn-danger" name="btn_regresar" id="btn_regresar" value="Regresar" onclick="window.location.href='?vista=persona/historial_participante';">
        </div>
    </form>
</div>
