<?php

    require_once("../clases/clase_unidad_medida.php");
    $lobjunidad_medida=new clsUnidad_Medida;
    $id=(isset($_GET['id']))?$_GET['id']:"";
    $lobjunidad_medida->set_unidad_medida($id);
    $launidad_medida=$lobjunidad_medida->consultar_unidad_medida();
    $Unidad_Medidas= $lobjunidad_medida->consultar_unidad_medidas_inactivos();
?>
<div style="float: left" class="col-lg-8 span8 pull-left">
    <h3>Consultar unidad_medida</h3>
    <div class="alert alert-info">
        <ul>
            <li>En este formulario podrá consultar y editar el unidad_medida en el sistema.</li>
            <li>Sí necesitas ayuda para usar este formulario haz clic en el botón <button class="btn btn-warning" type="button" onclick="javascript:introJs().start();"><i class="fa fa-question-circle"></i> Ayuda</button>.</li>
        </ul>
    </div>
    <form class="formulario" action="../controlador/control_unidad_medida.php" method="POST" name="form_unidad_medida">
        <input type="hidden"  name="idunidad_medida" id="cam_idunidad_medida" value="<?php echo $launidad_medida[0];?>"/>
        
        <label>Nombre <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Nombre del unidad_medida."><i class="fa fa-question" ></i></span></label>
        <input type="text" name="nombreunidad_medida" id="cam_nombreunidad_medida"onchange="validar_nombre();" data-step="1" data-intro="Ingrese el nombre del unidad_medida" data-position="right" value="<?php echo $launidad_medida[1];?>" required/>
        <div class="botonera">
            <input type="submit" class="btn btn-success" data-step="2" data-intro='Haga clic en <button class="btn btn-success">Guardar</button> para guardar el unidad_medida ingresado' data-position="top" name="btn_enviar" id="btn_enviar" value="Guardar">
            <input type="button" class="btn btn-danger" data-step="3" data-intro='Haga clic en <button class="btn btn-danger">Regresar</button> para regresar al listado de unidad_medidas' data-position="top" name="btn_regresar" id="btn_regresar" value="Regresar" onclick="window.location.href='?vista=archivo/unidad_medida';">
        </div>
        <input type="hidden" value="editar_unidad_medida" name="operacion" />
    </form>
</div>
<?php
            for($i=0;$i<count($Unidad_Medidas);$i++)
            {
                ?>
                    <input type="hidden" value="<?php print($Unidad_Medidas[$i][1]);?>" name="nombres[]" />
                <?php
            }
        ?>
<script type="text/javascript">
$(function(){
$("#cam_nombreunidad_medida").lemez_aceptar("texto","btn_enviar");
});
function validar_nombre()
{
    nombre_unidad_medida=document.getElementById('cam_nombreunidad_medida');
    nom_unidad_medidas = document.getElementsByName('nombres[]');
        for(i=0;i<nom_unidad_medidas.length;i++)
        {
            if(nom_unidad_medidas[i].value==nombre_unidad_medida.value.toUpperCase())
            {
                alert('Debe ingresar un nombre distinto, este ya se encuentra registrado.');
                nombre_unidad_medida.value='';
                nombre_unidad_medida.focus();
            }
        }
} 
</script>