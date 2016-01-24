<?php
include('../clases/clase_aula.php');
$lobjAula = NEW clsAula();
$id=(isset($_GET['id']))?$_GET['id']:"";
$lobjAula->set_Aula($id);
$Datos_Aula = $lobjAula->consultar_aula_bitacora();
$Aulas= $lobjAula->consultar_aulas_inactivas();
if($Datos_Aula)
{
    $operacion='editar_aula';
    $titulo   ='Consultar aula';
}
else
{
    $operacion='registrar_aula';
    $titulo   ='Registrar aula';
}
?>

<div style="float: left" class="col-lg-8 span8 pull-left">
    <h3><?php print($titulo); ?></h3>
    <div class="alert alert-info">
        <ul>
            <li>En este formulario podrá consultar y editar el aula donde se le dictará curso al participante.</li>
            <li>Sí necesitas ayuda para usar este formulario haz clic en el botón <button class="btn btn-warning" type="button" onclick="javascript:introJs().start();"><i class="fa fa-question-circle"></i> Ayuda</button>.</li>
        </ul>
    </div>
    <form class="formulario" action="../controlador/control_aula.php" method="POST" name="form_aula">
        <input type="hidden" value="<?php print($operacion);?>" name="operacion" />
        <input type="hidden" value="<?php print($Datos_Aula['idaula']);?>" name="idaula" />
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label>Nombre <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Nombre del aula."><i class="fa fa-question" ></i></span></label>
                <input type="text" class="span12" data-step="1" data-intro="Ingrese el nombre del aula" data-position="right" name="nombreaul" id="cam_nombreaul" onchange="validar_nombre();" value="<?php print($Datos_Aula['nombreaul']);?>" required/>
            </div>
            <div class="col-lg-6 span6">
                <label>Tipo <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Tipo de aula."><i class="fa fa-question" ></i></span></label>
                <input type="text" class="span12" data-step="2" data-intro="Ingrese el tipo de aula" data-position="right" name="tipoaul" id="cam_tipoaul" value="<?php print($Datos_Aula['tipoaul']);?>" required/>
            </div>
        </div>
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label>Capacidad <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Capacidad del aula."><i class="fa fa-question" ></i></span></label>
                <input type="text" class="span12" maxlength="3" data-step="3" data-intro="Ingrese la capacidad del aula" data-position="right" name="capacidadaul" id="cam_capacidadaul" required value="<?php print($Datos_Aula['capacidadaul']);?>"/>
            </div>
        </div>
        <div class="botonera">
            <input type="submit" data-step="4" data-intro='Haga clic en <button class="btn btn-success">Guardar</button> para guardar el aula ingresada' data-position="top" class="btn btn-success" name="btn_enviar" id="btn_enviar" value="Guardar">
            <input type="button" data-step="5" data-intro='Haga clic en <button class="btn btn-danger">Regresar</button> para regresar al listado de aulas' data-position="top" class="btn btn-danger" name="btn_regresar" id="btn_regresar" value="Regresar" onclick="window.location.href='?vista=archivo/aula';">
        </div>
    </form>
</div>
<?php
            for($i=0;$i<count($Aulas);$i++)
            {
                ?>
                    <input type="hidden" value="<?php print($Aulas[$i][1]);?>" name="nombres[]" />
                <?php
            }
        ?>
<script type="text/javascript">
$(function()
{
$("#cam_nombreaul").lemez_aceptar("texto_numero_especial","btn_enviar");
$("#cam_tipoaul").lemez_aceptar("texto","btn_enviar");
$("#cam_capacidadaul").lemez_aceptar("numero","btn_enviar");
});
function validar_nombre()
{
    nombre_aula=document.getElementById('cam_nombreaul');
    nom_aulas = document.getElementsByName('nombres[]');
        for(i=0;i<nom_aulas.length;i++)
        {
            if(nom_aulas[i].value==nombre_aula.value.toUpperCase())
            {
                alert('Debe ingresar un nombre distinto, este ya se encuentra registrado.');
                nombre_aula.value='';
                nombre_aula.focus();
            }
        }
}
</script>
</script>