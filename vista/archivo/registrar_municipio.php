<?php

    require_once("../clases/clase_municipio.php");
    $lobjmunicipio=new clsMunicipio;
    $id=(isset($_GET['id']))?$_GET['id']:"";
    $lobjmunicipio->set_municipio($id);
    $Municipios= $lobjmunicipio->consultar_municipios_inactivos();
?>
<div style="float: left" class="col-lg-8 span8 pull-left">
    <h3>Registrar municipio</h3>
        <div class="alert alert-info">
            <ul>
                <li>En este formulario podrá registrar el municipio en el sistema.</li>
                <li>Sí necesitas ayuda para usar este formulario haz clic en el botón <button class="btn btn-warning" type="button" onclick="javascript:introJs().start();"><i class="fa fa-question-circle"></i> Ayuda</button>.</li>
            </ul>
        </div>
    <form class="formulario" action="../controlador/control_municipio.php" method="POST" name="form_municipio">
        <input type="hidden" value="registrar_municipio" name="operacion" />
        <input type="hidden"  name="idmunicipio" id="cam_idmunicipio"/>
        <label>Nombre <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Nombre del municipio."><i class="fa fa-question" ></i></span></label>
        <input type="text" name="nombremunicipio" id="cam_nombremunicipio" onchange="validar_nombre();" data-step="1" data-intro="Ingrese el nombre del municipio" data-position="right" required/>
        <div class="botonera">
        <input type="submit" data-step="2" data-intro='Haga clic en <button class="btn btn-success">Aceptar</button> para guardar el municipio ingresado' data-position="top" class="btn btn-success" name="btn_enviar" id="btn_enviar" value="Aceptar">
            <input type="button" data-step="3" data-intro='Haga clic en <button class="btn btn-danger">Regresar</button> para regresar al listado de municipios' data-position="top" class="btn btn-danger" name="btn_regresar" id="btn_regresar" value="Regresar" onclick="window.location.href='?vista=archivo/municipio';">
        </div>
    </form>
</div>

<?php
            for($i=0;$i<count($Municipios);$i++)
            {
                ?>
                    <input type="hidden" value="<?php print($Municipios[$i][1]);?>" name="nombres[]" />
                <?php
            }
        ?>
<script type="text/javascript">
$(function(){
$("#cam_nombremunicipio").lemez_aceptar("texto","btn_enviar");
});
function validar_nombre()
{
    nombre_municipio=document.getElementById('cam_nombremunicipio');
    nom_municipios = document.getElementsByName('nombres[]');
        for(i=0;i<nom_municipios.length;i++)
        {
            if(nom_municipios[i].value==nombre_municipio.value.toUpperCase())
            {
                alert('Debe ingresar un nombre distinto, este ya se encuentra registrado.');
                nombre_municipio.value='';
                nombre_municipio.focus();
            }
        }
} 
</script>
