<script type="text/javascript" charset="utf-8">
    $(document).ready(function() {
        oTable = $('#filtro').dataTable({
            "bJQueryUI": true,
            "sPaginationType": "full_numbers",
            "iDisplayLength": 5                    
        });
    } );
</script> 
<div style="float: left" class="col-lg-11 span11 pull-left">
    <h3>Asistencia</h3>
    <div class="row-fluid">
        <div class="col-lg-6 span6">
            <label>Lapso <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Curso en el cual se encuentra el participante a evaluar."><i class="fa fa-question" ></i></span></label>
            <select name="idlapso" id="cam_idlapso" class="form-control span12" onchange="consultar_cursos(this.value);">
                <option value="">Seleccione un lapso</option>                
                <?php 
                   require_once('../clases/clase_lapso.php');
                    $lobjLapso=new clsLapso;
                    $laLapsos=$lobjLapso->consultar_lapsos_participante($_GET['idparticipante']);
                    for($i=0;$i<count($laLapsos);$i++)
                    {
                        $selected=($laLapsos[$i][0]==$_GET['idlapso'])?'selected':'';
                        echo '<option value="'.$laLapsos[$i][0].'" '.$selected.'>'.$laLapsos[$i][1].'</option>';
                    }
                    if($i==0)
                        echo '<option value="">El participante no tiene cursos inscritos</option>';

                ?>
            </select>
        </div>
        <div class="col-lg-6 span6">
            <label>Curso <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Curso en el cual se encuentra el participante a evaluar."><i class="fa fa-question" ></i></span></label>
            <select name="idcurso" id="cam_idcurso" class="form-control span12" onchange="consultar_evaluacion(this.value);" <?php echo ($_GET['idcurso']=='')?'disabled':'';?>>
                <option value=""></option>
                <?php 
                    require_once("../clases/clase_curso.php");
                    $lobjCurso=new clsCurso;
                    $lobjCurso->set_Lapso($_GET['idlapso']);
                    $lacurso=$lobjCurso->consultar_cursos_lapso_participante($_GET['idparticipante']);
                    for($i=0;$i<count($lacurso);$i++)
                    {
                        $selected=($lacurso[$i][0]==$_GET['idcurso'])?'selected':'';
                        echo '<option value="'.$lacurso[$i][0].'" '.$selected.'>'.$lacurso[$i][1].'</option>';
                    }
                ?>
            </select>
        </div>
    </div>
    <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable dataTable" id="filtro">
            <thead>
                <th>Código</th><th>Fecha</th><th>Asistencia</th><th>Unidad</th><th>Objetivo</th><th>Observación</th><th>Acción</th>
            </thead>
            <tbody>
            <?php
               require_once('../clases/clase_asistencia.php');
                    $lobjAsistencia=new clsAsistencia;
                    $lobjAsistencia->set_Curso($_GET['idcurso']);
                    $laAsistencia=$lobjAsistencia->consultar_asistencia_curso_participante($_GET['idparticipante']);
                    for($i=0;$i<count($laAsistencia);$i++)
                    {

                        echo '<tr>';
                        echo '<td>'.$laAsistencia[$i][0].'</td>';
                        echo '<td>'.$laAsistencia[$i][1].'</td>';
                        $checked=($laAsistencia[$i][2]=='1')?'checked':'';

                        echo '<td style="text-align:center"><input type="checkbox" style=" -ms-transform: scale(2);-moz-transform: scale(2);-webkit-transform: scale(2);-o-transform: scale(2);" '.$checked.' disabled/></td>';
                        echo '<td>';
                        for($j=0;$j<count($laAsistencia[$i][4]);$j++)
                        {
                            echo $laAsistencia[$i][4][$j][1];
                        }
                        echo '</td>';
                         echo '<td><ul>';
                        for($j=0;$j<count($laAsistencia[$i][5]);$j++)
                        {
                            echo '<li>'.$laAsistencia[$i][5][$j][1].'</li>';
                        }
                        echo '<td>'.$laAsistencia[$i][3].'</td>';

                        echo '</ul></td>';
                            echo '<td>';
                            echo '<a class="btn btn-success" href="../reporte/Asistencia_individual.php?idasistencia='.$laAsistencia[$i][0].'&idcurso='.$_GET['idcurso'].'" target="_blank"><i class="fa fa-file-text"></i></a>';
                            echo "</td>";

                        echo '</tr>';
                    }
            ?>
            </tbody>
        </table>
        <div class="botonera">
            <input type="button" class="btn btn-danger" name="btn_regresar" id="btn_regresar" value="Regresar" onclick="window.location.href='?vista=reporte/listado_participantes_asistencia';">
        </div>
</div>
<script>
  function consultar_cursos(id)
{
        var url="../controlador/control_curso.php";
        $.ajax({   
            type: "POST",
            url:url,
            data:{idlapso:id,idparticipante:"<?php echo $_GET['idparticipante'];?>",
                operacion:'consultar_cursos_lapso'},
            success: function(datos){  
                if(datos!='0')
                {

                    $('#cam_idcurso').html(datos);
                    $('#cam_idcurso').prop("disabled", false);
                    $('#cam_idcurso').focus();

                }
                else
                {
                    $('#cam_idlapso').focus();
                    $('#cam_idcurso').prop("disabled", true);
                    $('#cam_idlapso').val('');
                    $('#cam_idcurso').val('');
                    alert('El participante no tiene cursos inscritos en este lapso.');
                }
               
             }
        });

        
}
function consultar_evaluacion(id)
{
    if(id!='')
    {
        idlapso=document.getElementById("cam_idlapso").value;
        window.location.href="?vista=reporte/consultar_asistencias&idparticipante=2&idlapso="+idlapso+"&idcurso="+id;
    }
    else
    {
        $('#cam_idlapso').focus();
        $('#cam_idcurso').prop("disabled", true);
        $('#cam_idlapso').val('');
        $('#cam_idcurso').val('');
    }
}
</script>
