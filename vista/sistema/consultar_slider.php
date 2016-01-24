<?php
include('../clases/clase_slider.php');
$lobjslider = NEW clsSlider();
$id=(isset($_GET['id']))?$_GET['id']:"";
$lobjslider->set_slider($id);
$Datos_slider = $lobjslider->consultar_slider_bitacora();

if($Datos_slider)
{
    $operacion='editar_slider';
    $titulo   ='Consultar slider';
}
else
{
    $operacion='registrar_slider';
    $titulo   ='Registrar slider';
    $Datos_slider['fechanot']=date('d/m/Y');
}
?>       
<div style="float: left" class="col-lg-8 span8 pull-left">
    <h3><?php print($titulo); ?></h3>
    <div class="alert alert-info">
        <ul>
            <li>En este formuario podrás consultar/editar la imagen deslizante (slider) del home page o pagina de inicio.</li>
            <li>Sí necesitas ayuda para usar este formulario haz clic en el botón <button class="btn btn-warning" type="button" onclick="javascript:introJs().start();"><i class="fa fa-question-circle"></i> Ayuda</button>.</li>
        </ul>
    </div>
    <form class="formulario" enctype="multipart/form-data" action="../controlador/control_slider.php" method="POST" name="form_slider">
        <input type="hidden" value="<?php print($operacion);?>" name="operacion" />
        <input type="hidden" value="<?php print($Datos_slider['idslider']);?>" name="idslider" />
        <div class="row-fluid">
            <div class="col-lg-12 span12">
                <label>Nombre <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Nombre de la imagen que desea agregar al slider."><i class="fa fa-question" ></i></span></label>
                <input type="text" class="span12"  name="titulosli" id="cam_titulosli" value="<?php print($Datos_slider['titulosli']);?>" required/>
            </div>
        </div>
        <div class="row-fluid">
            <div class="col-lg-12 span12">
                <label>Texto <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Texto que mostrará el slider."><i class="fa fa-question" ></i></span></label>
                <textarea class="span12"  name="textosli" id="cam_textosli" ><?php print($Datos_slider['textosli']);?></textarea>
            </div>
        </div>
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label>Imagen <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Imagen a publicar para el slider."><i class="fa fa-question" ></i></span></label>
                <input type="file" class="span12"  name="imagensli" id="cam_imagensli"  value="<?php print($Datos_slider['imagensli']);?>"/>
                <input type="hidden" class="span12"  name="imagensli_ant" id="cam_imagensli_ant"  value="<?php print($Datos_slider['imagensli']);?>"/>
            </div>
        </div>
        <div class="botonera">
            <input type="submit" class="btn btn-success" name="btn_enviar" id="btn_enviar" value="Aceptar">
            <input type="button" class="btn btn-danger" name="btn_regresar" id="btn_regresar" value="Regresar" onclick="window.location.href='?vista=sistema/slider';">
        </div>
    </form>
</div>