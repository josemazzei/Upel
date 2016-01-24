<?php
    require_once("../clases/clase_evaluacion.php");
    $lobjEvaluacion=new clsEvaluacion;
    $lobjEvaluacion->set_Evaluacion($_GET['id']);
    $laevaluacion=$lobjEvaluacion->consultar_evaluacion();
?>
<div style="float: left" class="col-lg-11 span11 pull-left">
    <h3>Consultar evaluación</h3>
    <form class="formulario" action="../controlador/control_evaluacion.php" method="POST" >
        <input type="hidden" value="<?php echo $laevaluacion['idevaluacion'];?>" name="idevaluacion" id="cam_idevaluacion">
        <input type="hidden" value="editar_evaluacion" name="operacion" id="cam_operacion">
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                 <label>Curso <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Curso en el cual se encuentra el participante a evaluar."><i class="fa fa-question" ></i></span></label>
                <select name="idcurso" id="cam_idcurso" class="form-control span12" onchange="consultar_participantes_instrumento(this.value);">
                    <?php 
                        require_once("../clases/clase_curso.php");
                        $lobjCurso=new clsCurso;
                        $lacurso=$lobjCurso->consultar_cursos_activos();
                        $lobjCurso->set_Curso($laevaluacion['idcurso']);
                        for($i=0;$i<count($lacurso);$i++)
                        {
                            $selected=($lacurso[$i][0]==$laevaluacion['idcurso'])?'selected':'';
                            echo '<option value="'.$lacurso[$i][0].'" '.$selected.'>'.$lacurso[$i][1].'</option>';
                        }
                    ?>
                </select>
            </div>
            <div class="col-lg-6 span6">
                <label>Participante <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Participante que se evaluará."><i class="fa fa-question" ></i></span></label>
                <select name="idparticipante" id="cam_idparticipante" class="form-control span12">
                    <?php 
                        $laparticipante=$lobjCurso->consultar_participantes();
                        for ($i=0; $i <count($laparticipante); $i++) 
                        { 
                            $selected=($laparticipante[$i][8]==$laevaluacion['idcurso_idparticipante'])?'selected':'';
                            echo '<option value="'.$laparticipante[$i][8].'" '.$selected.'>'.$laparticipante[$i][4].' / '.$laparticipante[$i][0].' '.$laparticipante[$i][2].'</option>';
                        }
                    ?>
                </select>
            </div>
        </div>
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                 <label>Intrumento <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Intrumento con el cual se evaluará."><i class="fa fa-question" ></i></span></label>
                <select name="idinstrumento" id="cam_idinstrumento" class="form-control span12" onchange="cargar_intrumento(this.value)">
                    <?php 
                        $lainstrumento=$lobjCurso->consultar_instrumentos();
                        for ($i=0; $i <count($lainstrumento); $i++) 
                        { 
                            $selected=($lainstrumento[$i][0]==$laevaluacion['tinstrumento_idinstrumento'])?'selected':'';
                            echo '<option value="'.$lainstrumento[$i][0].'" '.$selected.'>'.$lainstrumento[$i][1].'</option>';
                        }
                    ?>
                </select>
            </div>
            <div class="col-lg-6 span6">
                <label>Fecha <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Fecha de nacimiento del participante."><i class="fa fa-question" ></i></span></label>
                <div class="span6 input-append date"   id="dp3" data-date="<?php echo date('d-m-Y')?>"  data-date-format="dd-mm-yyyy" data-date-viewmode="days">
                  <input class="span12" name="fechaeva" id="cam_fechaeva" size="16" value="<?php echo date('d-m-Y')?>" type="text" readonly>
                  <span class="add-off" ><i class="icon-calendar"></i></span>
                </div>
            </div>
        </div>
        <div class="row-fluid">
            <h3>Instrumento</h3>

            <section id="datos">
              <div style="margin: 0 auto; display: block; width: 100px;" id="ajax_loader"><img id="loader_gif" src="../media/img/loader.gif" style=" display:none;"/><div id="cargando" style="display:none;font-size: 11px; color: #777;">Cargando...</div></div>
              <div class="col-lg-12 span12 pull-left" style="margin:0;display:none" id="datos_1"></div>
            </section>
        </div>
        <div class="botonera">
            <input type="submit" class="btn btn-success" name="btn_enviar" id="btn_enviar" value="Aceptar">
            <input type="button" class="btn btn-danger" name="btn_regresar" id="btn_regresar" value="Regresar" onclick="window.location.href='?vista=curso/evaluacion';">
        </div>
    </form>
</div>
<script>
$('#dp3').datepicker();
cargar_intrumento('');
function consultar_participantes_instrumento(id)
{
        var url="../controlador/control_curso.php";
        $.ajax({   
            type: "POST",
            url:url,
            data:{idcurso:id,
                operacion:'consultar_participantes_curso'},
            success: function(datos){  
                if(datos!='0')
                {
                    $('#cam_idparticipante').html(datos);
                    $('#cam_idparticipante').prop("disabled", false);
                    consultar_instrumentos(id,url);
                }
                else
                {
                    $('#cam_idparticipante').prop("disabled", true);
                    $('#cam_idinstrumento').prop("disabled", true);
                    $('#cam_idinstrumento').val('');
                    $('#cam_idinstrumento').val('');
                    alert('No existen participantes inscritos en el curso seleccionado.');
                }
               
             }
        });

        
}

function consultar_instrumentos(id,url)
{
    $.ajax({   
            type: "POST",
            url:url,
            data:{idcurso:id,
                operacion:'consultar_intrumentos_curso'},
            success: function(datos){  
                if(datos!='0')
                {
                    $('#cam_idinstrumento').html(datos);
                    $('#cam_idinstrumento').prop("disabled", false);
                }
                else
                {
                    $('#cam_idinstrumento').prop("disabled", true);
                    $('#cam_idinstrumento').val('');

                    alert('No existen intrumentos registrados en la asignatura del curso seleccionado.');
                }
               
             }
        });
}
function cargar_intrumento(idinstrumento)
{
    if(idinstrumento!='')
        id=idinstrumento;
    else
        id=<?php echo "'".$laevaluacion['tinstrumento_idinstrumento']."'";?>;

        $("#loader_gif").fadeIn("slow");
        $("#cargando").fadeIn("slow");
        var url="../controlador/control_evaluacion.php";
        $.ajax({   
            type: "POST",
            url:url,
            data:{idevaluacion:<?php echo "'".$laevaluacion['idevaluacion']."'";?>,idinstrumento:id,operacion:'cargar_evaluacion'},
            success: function(datos){ 
                $("#loader_gif").fadeOut("slow");
                $("#cargando").fadeOut("slow");
                if(datos!='0')
                {
                    $('#datos_1').html(datos);
                    $("#datos_1").fadeIn("slow");
                    $("[data-toggle='popover']").popover();    
                }
                else
                {
                    $('#datos_1').html(datos);
                }
               
             }
        });
}
</script>