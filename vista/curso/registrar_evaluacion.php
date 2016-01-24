<?php 
   date_default_timezone_set('America/Caracas');
?>
<div style="float: left" class="col-lg-11 span11 pull-left">
    <h3>Realizar Evaluacion</h3>
    <form class="formulario" action="../controlador/control_evaluacion.php" method="POST" >
        <input type="hidden" value="registrar_evaluacion" name="operacion" id="cam_operacion">
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                 <label>Curso <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Curso en el cual se encuentra el participante a evaluar."><i class="fa fa-question" ></i></span></label>
                <select name="idcurso" id="cam_idcurso" class="form-control span12" onchange="consultar_participantes_instrumento(this.value);">
                    <option></option>
                    <?php 
                        require_once("../clases/clase_curso.php");
                        $lobjCurso=new clsCurso;
                        $lacurso=$lobjCurso->consultar_cursos_activos();
                        for($i=0;$i<count($lacurso);$i++)
                        {
                            echo '<option value="'.$lacurso[$i][0].'">'.$lacurso[$i][1].'</option>';
                        }
                    ?>
                </select>
            </div>
            <div class="col-lg-6 span6">
                <label>Participante <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Participante que se evaluará."><i class="fa fa-question" ></i></span></label>
                <select name="idparticipante" id="cam_idparticipante" class="form-control span12" disabled>
                    <option></option>

                </select>
            </div>
        </div>
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                 <label>Intrumento <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Intrumento con el cual se evaluará."><i class="fa fa-question" ></i></span></label>
                <select name="idinstrumento" id="cam_idinstrumento" class="form-control span12" onchange="cargar_intrumento(this.value)" disabled>
                    <option></option>

                </select>
            </div>
            <div class="col-lg-6 span6">
                <label>Fecha <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Fecha de nacimiento del participante."><i class="fa fa-question" ></i></span></label>
                <div class="span6 input-append date"   id="dp3" data-date="<?php echo date('d-m-Y')?>"  data-date-format="dd-mm-yyyy" data-date-viewmode="days">
                  <input class="span12" name="fechaeva" id="cam_fechaeva" size="16" value="<?php echo date('d-m-Y')?>" type="text" required>
                  <span class="add-on" ><i class="icon-calendar"></i></span>
                </div>
            </div>
        </div>
        <div class="row-fluid">
            <h3>Instrumento</h3>
            <a onclick="cargar_evaluacion_vacia();" class="btn btn-success"> Imprimible para evaluar <i class="fa fa-file-text-o"></i></a>
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
function cargar_intrumento(id)
{
        $("#loader_gif").fadeIn("slow");
        $("#cargando").fadeIn("slow");
        var url="../controlador/control_instrumento.php";
        $.ajax({   
            type: "POST",
            url:url,
            data:{idinstrumento:id,operacion:'cargar_instrumento'},
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
function cargar_evaluacion_vacia()
{
    curso=document.getElementById("cam_idcurso").value;
    instrumento=document.getElementById("cam_idinstrumento").value;
    participante=document.getElementById("cam_idparticipante").value;
    fecha=document.getElementById("cam_fechaeva").value;
    if(curso!='' && instrumento!='' && participante!='')
    {
        window.open('../reporte/evaluacion_vacia.php?idcurso='+curso+'&idinstrumento='+instrumento+'&idparticipante='+participante+'&fecha='+fecha,'_blank');
    }
    else
    {
        if(curso=='')
        {
            $("#cam_idcurso").focus();
            alert("Seleccione un curso");
        }

        if(instrumento=='')
        {
            $("#cam_idinstrumento").focus();
            alert("Seleccione un instrumento");

        }

        if(participante=='')
        {
            $("#cam_idparticipante").focus();
            alert("Seleccione un participante");
        }
    }
}
</script>