<?php
require_once('../clases/clase_curso.php');
require_once('../clases/clase_asistencia.php');
$lobjCurso=new clsCurso;
$lobjAsistencia=new clsAsistencia;
$idcurso = (isset($_GET['id']))?$_GET['id']:"-1";
$lobjCurso->set_Curso($idcurso);
$lobjAsistencia->set_Curso($idcurso);
$Datos_Curso=$lobjCurso->consultar_datos_inscripcion();
$laDiaAsistencia=$lobjAsistencia->consultar_dia_asistencias();


$fecha1 = $Datos_Curso[13];
$fecha2 = date("Y-m-d");
$cont=$cont2=0;
for($i=$fecha1;$i<=$fecha2;$i = date("Y-m-d", strtotime($i ."+ 1 days")))
{
    $fecha_asistencia=false;
    for ($j=0; $j <count($laDiaAsistencia);$j++) 
    {
        if($i==$laDiaAsistencia[$j][0])
        {
            $fecha=date("j/n/Y",strtotime($laDiaAsistencia[$j][0]));
            $event.='{date:"'.$fecha.'",color: "#5bb75b"},';
            $fecha_asistencia=true;
            $cont2++;

        }

    }

    if(!$fecha_asistencia && $i!=date("Y-m-d"))
    {
        $fecha_sin_asistencia=date("j/n/Y",strtotime($i));   
        $dia_sin_asistencia=date("l",strtotime($i));
        if($dia_sin_asistencia!='Saturday' && $dia_sin_asistencia!='Sunday')
        {
            $event.='{date:"'.$fecha_sin_asistencia.'",color: "#da4f49"},';
            $cont++;
        }
    }
   
}
$event=substr($event,0,strlen($event)-1);
?>
<script>
                        $(document).ready(function() {

                            var monthNames = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Dicembre"];

                            var dayNames = ["L", "M", "M", "J", "V", "S", "D"];
                            var events=[<?php echo $event;?>];


                            $('#calendari_lateral1').bic_calendar({
                                //list of events in array
                                events: events,
                                //enable select
                                enableSelect: true,
                                //enable multi-select
                                multiSelect: false,
                                //set day names
                                dayNames: dayNames,
                                //set month names
                                monthNames: monthNames,
                                //show dayNames
                                showDays: true,
                                //show month controller
                                displayMonthController: true,
                                //show year controller
                                displayYearController: true
                            });
                        });
function cargar_listado(fecha)
{
        var id= <?php echo '"'.$_GET['id'].'"';?>;
        var idasignatura= <?php echo '"'.$Datos_Curso[11].'"';?>;
        $("#previo").fadeOut("slow");
       
        $("#loader_gif").fadeIn("slow");
        $("#cargando").fadeIn("slow");
        var url="listado_asistencia.php";
        $.ajax({   
            type: "GET",
            url:url,
            data:{idasignatura:idasignatura,
                fecha:fecha,
                    id:id},
            success: function(datos){  
                $("#loader_gif").fadeOut("slow");
                $("#cargando").fadeOut("slow");

               $('#datos_1').html(datos);
               
             }
        });
}
function regresar_calendario()
{
      var d = document.getElementById("datos_1");
        while (d.hasChildNodes())
            d.removeChild(d.firstChild);

      $("#previo").fadeIn("slow");
}

</script>
<div style="float: left" class="col-lg-11 span11 pull-left">
    <h3>Asistencia</h3>
     <div class="alert alert-info">
        <ul>
            <li>En este formulario podrá registrar, consultar, editar e imprimir la asistencia de los participantes partiendo de un curso.</li>
            <li>Sí necesitas ayuda para usar este formulario haz clic en el botón <button class="btn btn-warning" type="button" onclick="javascript:introJs().start();"><i class="fa fa-question-circle"></i> Ayuda</button>.</li>
        </ul>
    </div>
    <form class="formulario" action="../controlador/control_asistencia.php" method="POST" >
        <input type="hidden" value="<?php echo $idcurso;?>" name="idcurso" id="cam_idcurso">
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label><b>Nombre: </b> <?php print($Datos_Curso[1]); ?></label>
            </div>
            <div class="col-lg-6 span6">
                <label><b>Asignatura: </b> <?php print($Datos_Curso[10]); ?> </label>
            </div>
        </div>
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label><b>Grupo: </b> <?php print($Datos_Curso[8]); ?></label>
            </div>
            
            <div class="col-lg-6 span6">
                <label><b>Capacidad: </b> <?php print($Datos_Curso[3]); ?> </label>
            </div>
        </div>
         <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label><b>Lapso: </b> <?php print($Datos_Curso[7]); ?> </label>
            </div>
            <div class="col-lg-6 span6">
                <label><b>Inscritos: </b> <?php print($Datos_Curso[12]); ?> </label>
            </div>
        </div>
        <div style="text-align:center" class="col-lg-11 span11" id="previo">
            <div class="span6">
                <h4>Calendario del curso</h4>        
                <div id="calendari_lateral1"></div>
                <div class="botonera">
                    <input type="button" class="btn btn-danger" name="btn_regresar" id="btn_regresar" value="Regresar" onclick="window.location.href='?vista=curso/asistencia'">
                </div>
            </div>
            <div class="span4 pull-rigth" style="margin-top:220px;">
                <table>
                    <tr>
                        <td style="width:70px;height:30px;background:rgb(91, 183, 91);"></td>
                        <td style="text-align:left;padding-left:10px;">Asistencia registrada = <?php echo $cont2;?></td>
                    </tr>
                    <tr>
                        <td style="width:70px;height:30px;background: rgb(218, 79, 73);"></td>
                        <td style="text-align:left;padding-left:10px;">Asistencia por registrar  = <?php echo $cont;?></td>
                    </tr>
                    <tr>
                        <td style="width:70px;height:30px;border: 3px solid rgb(204, 204, 204);"></td>
                        <td style="text-align:left;padding-left:10px;">Hoy</td>
                    </tr>
                </table>
            </div>
        </div>
        <section id="datos">
          <div style="margin: 0 auto; display: block; width: 100px;" id="ajax_loader"><img id="loader_gif" src="../media/img/loader.gif" style=" display:none;"/><div id="cargando" style="display:none;font-size: 11px; color: #777;">Cargando...</div></div>
          <div class="col-lg-11 span11 pull-left" style="margin:0;" id="datos_1"></div>
      </section>
    </form>
</div>
<script>
$(document).ready(function() {
    document.addEventListener('bicCalendarSelect', function(e) {
        moment.lang('es'); // default the language to English
        var dateFirst = new moment(e.detail.dateFirst);
        var dateLast = new moment(e.detail.dateLast);

        $('#from-day').val(dateFirst.format('LL'));
        $('#to-day').val(dateLast.format('LL'));

        /*
         * more about moment.js
         * http://momentjs.com/docs/#/displaying/
         */
    });
});
</script>
