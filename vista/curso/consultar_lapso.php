<?php
include('../clases/clase_lapso.php');
$lobjLapso = NEW clsLapso();
$id=(isset($_GET['id']))?$_GET['id']:"";
$lobjLapso->set_Lapso($id);
$Datos_Lapso = $lobjLapso->consultar_lapso_bitacora();

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

//if(!$Datos_Lapso['fechafinlap'])
//{
   // $Datos_Lapso['fechafinlap']=date('d-m-Y',strtotime(date("m/d/Y")." +$cantidaddiaslapso day"));
//}
?>

<div id="lapso" style="float: left" class="col-lg-8 span8 pull-left ">
    <h3><?php print($titulo); ?></h3>
      <div class="alert alert-info">
        <ul>
            <li>En este formulario podrá consultar, editar, aperturar y cerrar lapso existente.</li>
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
                <div>
                    <input type="text" class="span12" readOnly name="fechainilap" size="16" id="cam_fechainilap" required value="<?php print($Datos_Lapso['fechainilap']);?>"/>
                </div> 
            </div>
            <div class="col-lg-6 span6">
                <label>Fecha Fin <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Fecha en la que finaliza el lapso."><i class="fa fa-question" ></i></span></label>
                    <input type="text" class="span12"  readOnly name="fechafinlap" size="16" id="cam_fechafinlap" required value="<?php print($Datos_Lapso['fechafinlap']);?>"/>
            </div>
        </div>
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label>Estado <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Estado que le puede asignar al lapso."><i class="fa fa-question" ></i></span></label>
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
            <input type="submit" class="btn btn-success" name="btn_enviar" id="btn_enviar" onclick="return validar()" value="Guardar">
            <input type="button" class="btn btn-danger" name="btn_regresar" id="btn_regresar" value="Regresar" onclick="window.location.href='?vista=curso/lapso';">
        </div>
    </form>
</div>
<script type="text/javascript">
   // $('#cam_fechainilap').datepicker();

    function validar()
    {
        valor=document.getElementById("cam_estadolap").value;
        if(confirm("¿Esta seguro que desea cambiar a ["+valor+"] el lapso?"))
            return true;
        else 
            return false;
    }
</script>