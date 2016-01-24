<?php
include('../clases/clase_areaconocimiento.php');
$lobjArea = NEW clsAreaconocimiento();
$id=(isset($_GET['id']))?$_GET['id']:"";
$lobjArea->set_Area($id);
$Datos_Area = $lobjArea->consultar_area_bitacora();
$Areas= $lobjArea->consultar_areas_inactivas();
if($Datos_Area)
{
    $operacion='editar_area';
    $titulo   ='Consultar área de conocimiento';
}
else
{
    $operacion='registrar_area';
    $titulo   ='Registrar área de conocimiento';
}
?>

<div style="float: left" class="col-lg-8 span8 pull-left">
    <h3><?php print($titulo); ?></h3>
    <div class="alert alert-info">
        <ul>
            <li>En este formulario podrá consultar y editar el área de conociento para la asignatura.</li>
            <li>Sí necesitas ayuda para usar este formulario haz clic en el botón <button class="btn btn-warning" type="button" onclick="javascript:introJs().start();"><i class="fa fa-question-circle"></i> Ayuda</button>.</li>
        </ul>
    </div>
    <form class="formulario" action="../controlador/control_areaconocimiento.php" method="POST" name="form_area">
        <input type="hidden" value="<?php print($operacion);?>" name="operacion" />
        <input type="hidden" value="<?php print($Datos_Area['idarea_conocimiento']);?>" name="idarea_conocimiento" />
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label>Nombre <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Nombre del area de conocimiento."><i class="fa fa-question" ></i></span></label>
                <input type="text" class="span12"  name="nombreare" id="cam_nombreare" onchange="validar_nombre();" value="<?php print($Datos_Area['nombreare']);?>" required/>
            </div>
            
        </div>
        <div class="botonera">
            <input type="submit" class="btn btn-success" name="btn_enviar" id="btn_enviar" value="Aceptar">
            <input type="button" class="btn btn-danger" name="btn_regresar" id="btn_regresar" value="Regresar" onclick="window.location.href='?vista=archivo/area_conocimiento';">
        </div>
    </form>
</div>
<?php
            for($i=0;$i<count($Areas);$i++)
            {
                ?>
                    <input type="hidden" value="<?php print($Areas[$i][1]);?>" name="nombres[]" />
                <?php
            }
        ?>

<script type="text/javascript">
$(function()
{
$("#cam_nombreare").lemez_aceptar("texto","btn_enviar");
});
function validar_nombre()
{
    nombre_area=document.getElementById('cam_nombreare');
    nom_areas = document.getElementsByName('nombres[]');
        for(i=0;i<nom_areas.length;i++)
        {
            if(nom_areas[i].value==nombre_area.value.toUpperCase())
            {
                alert('Debe ingresar un nombre distinto, este ya se encuentra registrado.');
                nombre_area.value='';
                nombre_area.focus();
            }
        }
}
</script>