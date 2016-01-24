<?php
require_once('../clases/clase_curso.php');
require_once('../clases/clase_grupo.php');
$lobjCurso=new clsCurso;
$idcurso = (isset($_GET['id']))?$_GET['id']:"-1";
$lobjCurso->set_Curso($idcurso);
$Datos_Curso=$lobjCurso->consultar_datos_inscripcion();
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
    <h3>Participantes Inscrito</h3>
    <form action="../controlador/control_inscripcion_curso.php" method="POST" name="form_lapso">
        <input type="hidden" value="inscribir_curso" name="operacion" />
        <input type="hidden" value="<?php print($Datos_Curso[0]);?>" name="idcurso" />
        <input type="hidden" value="<?php print($Datos_Curso[3]);?>" name="capacidad" />
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label><b>Nombre</b> <?php print($Datos_Curso[1]); ?></label>
            </div>
            <div class="col-lg-6 span6">
                <label><b>Asignatura</b> <?php print($Datos_Curso[10]); ?> </label>
            </div>
        </div>
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label><b>Grupo</b> <?php print($Datos_Curso[8]); ?></label>
            </div>
            
            <div class="col-lg-6 span6">
                <label><b>Capacidad</b> <?php print($Datos_Curso[3]); ?> </label>
            </div>
        </div>
         <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label><b>Lapso</b> <?php print($Datos_Curso[7]); ?> </label>
            </div>
            <div class="col-lg-6 span6">
                <label><b>Inscritos</b> <?php print($Datos_Curso[12]); ?> </label>
            </div>
        </div>
            <h5>Participantes Inscritos</h5>
        <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable dataTable" id="filtro"> 
            <thead>
                <th>Foto</th><th>Cédula</th><th>Apellidos</th><th>Nombre</th><th>Acción</th>
            </thead>
            <tbody>
            <?php
                    if($idcurso)
                    {
                        $lobjCurso->set_Asignatura($Datos_Curso[11]);
                        $laParticipantes=$lobjCurso->consultar_participantes();
                        for($i=0;$i<count($laParticipantes);$i++)
                        {
                            $laParticipantes[$i][6]=($laParticipantes[$i][6])?$laParticipantes[$i][6]:'default.png';
                            
                            echo '<tr>';
                            echo '<td><img style="width:52px;height:52px;" src="../media/img/participantes/'.$laParticipantes[$i][6].'"/></td>';
                            echo '<td style="padding-top:20px">'.$laParticipantes[$i][4].'</td>';
                            echo '<td style="padding-top:20px">'.$laParticipantes[$i][2].' '.$laParticipantes[$i][3].'</td>';
                            echo '<td style="padding-top:20px">'.$laParticipantes[$i][0].' '.$laParticipantes[$i][1].'</td>';
                            if($i<$Datos_Curso[3])
                            {
                                $checked="checked";
                            }
                            echo '<td><a class="btn btn-success" href="../reporte/plantilla_inscripcion.php?idparticipante='.$laParticipantes[$i][5].'" target="_blank"><i class="fa fa-file-text"></i></a> </td>';
                           echo '</tr>';
                                $checked="";

                        }
                    }
                    else
                    {
                        echo '<tr><td colspan="4">NO EXISTE EL CURSO SELECCIONADO</td></tr>';
                    }
                ?>
                </tbody>
        </table>
        <div class="botonera">
            <input type="submit" class="btn btn-success" name="btn_enviar" id="btn_enviar" value="Aceptar">
            <input type="button" class="btn btn-danger" name="btn_regresar" id="btn_regresar" value="Regresar" onclick="window.location.href='?vista=curso/curso';">
        </div>
    </form>
</div>
