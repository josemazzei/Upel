<?php
include('../clases/clase_grupo.php');
$lobjGrupo = NEW clsGrupo();
$id=(isset($_GET['id']))?$_GET['id']:"";
$lobjGrupo->set_Idgrupo($id);
$Datos_Grupo = $lobjGrupo->consultar_grupo_bitacora();
$Grupos      = $lobjGrupo->consultar_grupos_inactivo();
if($Datos_Grupo)
{
    $operacion='editar_grupo';
    $titulo   ='Consultar grupo';
}
else
{
    $operacion='registrar_grupo';
    $titulo   ='Registrar grupo';
}
?>

<div style="float: left" class="col-lg-8 span8 pull-left">
    <h3><?php print($titulo); ?></h3>
     <div class="alert alert-info">
        <ul>
            <li>En este módulo podrá consultar y editar el grupo de edad que pertenecerá el participante.</li>
            <li>Sí necesitas ayuda para usar este módulo haz clic en el botón <button class="btn btn-warning" type="button" onclick="javascript:introJs().start();"><i class="fa fa-question-circle"></i> Ayuda</button>.</li>
        </ul>
    </div>
    <form class="formulario" action="../controlador/control_grupo.php" method="POST" name="form_grupo">
        <input type="hidden" value="<?php print($operacion);?>" name="operacion" />
        <input type="hidden" value="<?php print($Datos_Grupo['idgrupo']);?>" name="idgrupo" />
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label>Nombre <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Nombre del grupo."><i class="fa fa-question" ></i></span></label>
                <input type="text" class="span12"  name="nombregru" id="cam_nombregru" onchange="validar_nombre();" value="<?php print($Datos_Grupo['nombregru']);?>" required/>
            </div>
            <div class="col-lg-6 span6">
                <label>Descripción <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Descripción del grupo."><i class="fa fa-question" ></i></span></label>
                <textarea class="span12"  name="descripciongru" id="cam_descripciongru" required><?php print($Datos_Grupo['descripciongru']);?></textarea>
            </div>
        </div>
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label>Edad mínima <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Edad minima del grupo."><i class="fa fa-question" ></i></span></label>
                <input type="text" class="span12" maxlength="2" name="edadmin" id="cam_edadmin" required value="<?php print($Datos_Grupo['edadmin']);?>"/>
            </div>
            <div class="col-lg-6 span6">
                <label>Edad Máxima <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Edad maxima del curso."><i class="fa fa-question" ></i></span></label>
                <input type="text" class="span12" maxlength="3" name="edadmax" id="cam_edadmax" onchange="validar_edad();" required value="<?php print($Datos_Grupo['edadmax']);?>"/>
            </div>
        </div>
        <div class="botonera">
            <input type="submit" class="btn btn-success" onclick="return validar_edad();" name="btn_enviar" id="btn_enviar" value="Guardar">
            <input type="button" class="btn btn-danger" name="btn_regresar" id="btn_regresar" value="Regresar" onclick="window.location.href='?vista=archivo/grupo';">
        </div>
    </form>
</div>
<?php
            for($i=0;$i<count($Grupos);$i++)
            {
                ?>
                    <input type="hidden" value="<?php print($Grupos[$i][1]);?>" name="nombres[]" />
                <?php
            }
        ?>
<script>
function validar_edad()
{
    edadmin=document.getElementById('cam_edadmin');
    edadmax=document.getElementById('cam_edadmax');

    if(parseInt(edadmax.value)<=parseInt(edadmin.value))
    {
        alert('La edad máxima debe ser mayor a la edad mínima.');
        edadmax.value='';
        return false;
    }
    return true;
}
$(function(){
$("#cam_nombregru").lemez_aceptar("texto","btn_enviar");
$("#cam_descripciongru").lemez_aceptar("texto","btn_enviar");
$("#cam_edadmin").lemez_aceptar("numero","btn_enviar");
$("#cam_edadmax").lemez_aceptar("numero","btn_enviar");
});
function validar_nombre()
{
    nombre_grupo=document.getElementById('cam_nombregru');
    nombre_grupos = document.getElementsByName('nombres[]');
        for(i=0;i<nombre_grupos.length;i++)
        {
            if(nombre_grupos[i].value==nombre_grupo.value.toUpperCase())
            {
                alert('Debe ingresar un nombre distinto, este ya se encuentra registrado.');
                nombre_grupo.value='';
                nombre_grupo.focus();
            }
        }
}
</script>