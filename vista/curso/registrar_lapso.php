<?php
include('../clases/clase_lapso.php');
$lobjLapso = NEW clsLapso();
$id=(isset($_GET['id']))?$_GET['id']:"";
$lobjLapso->set_Lapso($id);
$Datos_Lapso = $lobjLapso->consultar_lapso_bitacora();
$UltimaFecha=  $lobjLapso->consultar_ultima_fecha();
$UltimaFecha=date('d-m-Y',strtotime($UltimaFecha." +1 day"));
if($Datos_Lapso)
{
    $operacion='editar_lapso';
    $titulo   ='Consultar lapso';
}
else
{
    $operacion='registrar_lapso';
    $titulo   ='Registrar lapso';
}
$Lapsoaperturado = bool;
$Lapsoaperturado = $lobjLapso->consultar_activo();
$cantidaddiaslapso = $lobjLapso->consultar_cantidad_dias();

if(!$Datos_Lapso['fechafinlap'])
{
    $Datos_Lapso['fechafinlap']=date('d-m-Y',strtotime($UltimaFecha." +$cantidaddiaslapso day"));
}
?>

<div id="lapso" style="float: left" class="col-lg-8 span8 pull-left ">
    <h3><?php print($titulo); ?></h3>
    <div class="alert alert-info">
        <ul>
            <li>En este formulario podrá registrar lapso aperturado y programado.</li>
            <li>Sí necesitas ayuda para usar este formulario haz clic en el botón <button class="btn btn-warning" type="button" onclick="javascript:introJs().start();"><i class="fa fa-question-circle"></i> Ayuda</button>.</li>
        </ul>
    </div>
    <form class="formulario" action="../controlador/control_lapso.php" method="POST" name="form_lapso">
        <input type="hidden" value="<?php print($operacion);?>" name="operacion" />
        <input type="hidden" value="<?php print($Datos_Lapso['idlapso']);?>" name="idlapso" />
        <input type="hidden" value="<?php print($cantidaddiaslapso);?>" id="cantidaddiaslapso" name="cantidaddiaslapso" />
        <div id="error" class="alert alert-error hide">Debe ingresar una fecha entre estos rangos: </div>
        <div class="row-fluid">
            <div class="col-lg-6 span12">
                <label>Nombre <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Nombre del lapso."><i class="fa fa-question" ></i></span></label>
                <input type="text" class="span12"  name="nombrelap" id="cam_nombrelap" value="<?php print($Datos_Lapso['nombrelap']);?>" required/>
            </div>
        </div>
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label>Fecha Inicio <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Fecha en la que inicia el lapso."><i class="fa fa-question" ></i></span></label>
                <div class="span10 input-append date"   >
                    <input type="text" class="span12" data-date="07-01-2014"  data-date-format="dd-mm-yyyy" data-date-viewmode="years" name="fechainilap" size="16" id="cam_fechainilap" required value="<?php if($Datos_Lapso['fechainilap']) {print($Datos_Lapso['fechainilap']);} else {print($UltimaFecha);} ?>"/>
                  <span class="add-on"><i class="icon-th"></i></span>
                </div>
               
            </div>
            <div class="col-lg-6 span6">
                <label>Fecha Fin <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Fecha en la que finaliza el lapso."><i class="fa fa-question" ></i></span></label>
                    <input type="text" class="span12"  readOnly name="fechafinlap" size="16" id="cam_fechafinlap" required value="<?php print($Datos_Lapso['fechafinlap']);?>"/>
            </div>
        </div>
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label>Estado <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Estado con el cual puede registrar el lapso."><i class="fa fa-question" ></i></span></label>
                <select name="estadolap" id="cam_estadolap" class="span12">
                    <?php if($Datos_Lapso['estadolap']!='CERRADO') 
                    {
                       ?>
                    <?php  if(!$Lapsoaperturado){?>
                    <option value="Aperturado" <?php if($Datos_Lapso['estadolap']=='APERTURADO') print('SELECTED');?>>APERTURAR</option>
                    <?php }
                    if($Datos_Lapso['estadolap']!='APERTURADO'){?>
                    <option value="Programado" <?php if($Datos_Lapso['estadolap']=='PROGRAMADO') print('SELECTED');?>>PROGRAMAR</option>
                    <?php }?>
                    <option value="Cerrado" <?php if($Datos_Lapso['estadolap']=='CERRADO') print('SELECTED');?>>CERRAR</option>
                    <?php }else {?>
                    <option value="Programado" <?php if($Datos_Lapso['estadolap']=='CERRADO') print('SELECTED');?>>CERRADO</option>
                    <?php }?>
                </select>
            </div>
        </div>
        <div class="botonera">
            <input type="submit" class="btn btn-success" name="btn_enviar" id="btn_enviar" value="Aceptar">
            <input type="button" class="btn btn-danger" name="btn_regresar" id="btn_regresar" value="Regresar" onclick="window.location.href='?vista=curso/lapso';">
        </div>
    </form>
</div>
<script type="text/javascript">
    $('#cam_fechainilap').datepicker();

$(document).ready(function(){
$("#btn_enviar").bind("click", function() { 
    var fecha_fin = $("#cam_fechafinlap").val();
    var fecha_inicio = $("#cam_fechainilap").val();
    var nombre_lapso = $("#cam_nombrelap").val();
                $.ajax({  
                    type: "GET",  
                    url: "../controlador/validar_lapso.php?operacion=verificar",  
                    data: {fechainilap:fecha_inicio , fechafinlap:fecha_fin, nombrelap:nombre_lapso},  
                    success: function(msg){  

                            if(msg != ''){
                                btn_enviar.disabled=true;
                                $("#error").html(msg);
                                $("#error").show();
                            }else{
                                $("#error").html(msg);
                                $("#error").hide();
                                btn_enviar.disabled=false;
                                }
                        }
                        });
                });
$("#lapso").bind("click", function() { 
    var nombre_lapso = $("#cam_nombrelap").val();
    
    var fecha_inicio = $("#cam_fechainilap").val();
    var cantidaddias = $("#cantidaddiaslapso").val();
    var sumarDias = parseInt(cantidaddias);
    var dias = fecha_inicio.substr(0,2);
    var meses = fecha_inicio.substr(3,2);
    var anos = fecha_inicio.substr(6,4);
    fecha = anos+"-"+meses+"-"+dias;
    fecha= new Date(fecha);
    fecha.setDate(fecha.getDate()+sumarDias);

    var anio=fecha.getFullYear();
    var mes= fecha.getMonth()+1;
    var dia= fecha.getDate();

    if(mes.toString().length<2){
    mes="0".concat(mes);        
    }    

    if(dia.toString().length<2){
    dia="0".concat(dia);        
    }
    $("#cam_fechafinlap").val(dia+"-"+mes+"-"+anio);
    var fecha_fin = $("#cam_fechafinlap").val();

                $.ajax({  
                    type: "GET",  
                    url: "../controlador/validar_lapso.php?operacion=verificar",  
                    data: {fechainilap:fecha_inicio , fechafinlap:fecha_fin, nombrelap:nombre_lapso},  
                    success: function(msg){  

                            if(msg != ''){
                                btn_enviar.disabled=true;
                                $("#error").html(msg);
                                $("#error").show();
                            }else{
                                $("#error").html(msg);
                                $("#error").hide();
                                btn_enviar.disabled=false;
                                }
                        }
                        });
                });


        });

</script>