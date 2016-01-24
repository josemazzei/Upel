<?php
include('../clases/clase_noticia.php');
$lobjNoticia = NEW clsNoticia();
$id=(isset($_GET['id']))?$_GET['id']:"";
$lobjNoticia->set_Noticia($id);
$Datos_Noticia = $lobjNoticia->consultar_noticia_bitacora();

if($Datos_Noticia)
{
    $operacion='editar_noticia';
    $titulo   ='Consultar Noticia';
}
else
{
    $operacion='registrar_noticia';
    $titulo   ='Registrar Noticia';
    $Datos_Noticia['fechanot']=date('d/m/Y');
}
?>       
<script type="text/javascript" src="../libreria/tinymce/tinymce.min.js"></script> <!-- TinyMCE -->
<script type="text/javascript">
tinymce.init({
    selector: "textarea",
    language : 'es'
 });
</script>
<div style="float: left" class="col-lg-8 span8 pull-left">
    <h3><?php print($titulo); ?></h3>
    <div class="alert alert-info">
        <ul>
            <li>En este formuario podrás consultar/editar la noticia del home page o pagina de inicio.</li>
            <li>Sí necesitas ayuda para usar este formulario haz clic en el botón <button class="btn btn-warning" type="button" onclick="javascript:introJs().start();"><i class="fa fa-question-circle"></i> Ayuda</button>.</li>
        </ul>
    </div>
    <form class="formulario" enctype="multipart/form-data" action="../controlador/control_noticia.php" method="POST" name="form_noticia">
        <input type="hidden" value="<?php print($operacion);?>" name="operacion" />
        <input type="hidden" value="<?php print($Datos_Noticia['idnoticia']);?>" name="idnoticia" />
        <div class="row-fluid">
            <div class="col-lg-12 span12">
                <label>Nombre <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Nombre de la noticia que desea publicar."><i class="fa fa-question" ></i></span></label>
                <input type="text" class="span12"  name="titulonot" id="cam_titulonot" value="<?php print($Datos_Noticia['titulonot']);?>" required/>
            </div>
        </div>
        <div class="row-fluid">
            <div class="col-lg-12 span12">
                <label>Texto <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="El texto citado en la noticia, puede agregarle estilo con los botones del panel o copiarlo desde un archivo WORD."><i class="fa fa-question" ></i></span></label>
                <textarea class="span12"  name="textonot" id="cam_textonot" ><?php print($Datos_Noticia['textonot']);?></textarea>
            </div>
        </div>
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label>Imagen <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Imagen que servirá para mostrar la noticia en el home page."><i class="fa fa-question" ></i></span></label>
                <input type="file" class="span12"  name="imagennot" id="cam_imagennot"  value="<?php print($Datos_Noticia['imagennot']);?>"/>
                <input type="hidden" name="imagennot_ant" id="cam_imagennot"  value="<?php print($Datos_Noticia['imagennot']);?>"/>
            </div>
            <div class="col-lg-6 span6">
                <label>Fecha <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Fecha en la que ocurrio la noticia."><i class="fa fa-question" ></i></span></label>
                <input type="text" class="span12"  name="fechanot" id="cam_fechanot" required value="<?php print($Datos_Noticia['fechanot']);?>"/>
            </div>
        </div>
        <div class="botonera">
            <input type="submit" class="btn btn-success" name="btn_enviar" onclick="return validar();" id="btn_enviar" value="Aceptar">
            <input type="button" class="btn btn-danger" name="btn_regresar" id="btn_regresar" value="Regresar" onclick="window.location.href='?vista=sistema/noticia';">
        </div>
    </form>
</div>
<script type="text/javascript">
    $(function(){
    $("#cam_titulonot").lemez_aceptar("sin_comillas");
    });
    function validar()
    {
        var textonot = tinyMCE.get("cam_textonot").getContent();;
        expresion=/^[^\'\"]*$/;
        if(expresion.test(textonot)==false)
        {
            alert('No se permiten comillas simples (\') o comillas dobles (\").');            
            tinyMCE.execCommand('mceFocus', false, 'cam_textonot');
            return false;
            
        }       
        if(textonot == '' )
        {
            alert('Debe escribir un mensaje en el campo para poder continuar.');
            tinyMCE.execCommand('mceFocus', false, 'cam_textonot');
            return false;
        }
        else if(textonot.length<250 )
        {
            alert('El texto del mensaje no puede ser menor de 250 caracteres.');
            tinyMCE.execCommand('mceFocus', false, 'cam_textonot');
            return false;
        }

        return true;
    }
</script>