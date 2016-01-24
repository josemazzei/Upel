<?php
    require_once("../clases/clase_diagnostico.php");
    $lobjDiagnostico=new clsDiagnostico;
    $id=(isset($_GET['id']))?$_GET['id']:"";
    $lobjDiagnostico->set_diagnostico($id);
    $laDiagnostico=$lobjDiagnostico->consultar_diagnostico();
     $Diagnosticos= $lobjDiagnostico->consultar_diagnosticos_inactivos();
?>
<div style="float: left" class="col-lg-8 span8 pull-left">
    <h3>Consultar Condición visual</h3>
    <div class="alert alert-info">
        <ul>
            <li>En este formulario podrá consultar y editar la condición visual del participante, docente y fammiliar.</li>
            <li>Sí necesitas ayuda para usar este formulario haz clic en el botón <button class="btn btn-warning" type="button" onclick="javascript:introJs().start();"><i class="fa fa-question-circle"></i> Ayuda</button>.</li>
        </ul>
    </div>
    <form class="formulario" action="../controlador/control_diagnostico.php" method="POST" name="form_diagnostico">
        <input type="hidden"  name="iddiagnostico" id="cam_iddiagnostico" value="<?php echo $laDiagnostico[0];?>"/>
        <label>Nombre <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Nombre del diagnostico."><i class="fa fa-question" ></i></span></label>
        <input type="text" name="descripciondia" id="cam_descripciondia" onchange="validar_nombre();" value="<?php echo $laDiagnostico[1];?>" required/>
        <div class="botonera">
            <input type="submit" class="btn btn-success" name="btn_enviar" id="btn_enviar" value="Guardar">
            <input type="button" class="btn btn-danger" name="btn_regresar" id="btn_regresar" value="Regresar" onclick="window.location.href='?vista=archivo/diagnostico';">
        </div>
        <input type="hidden" value="editar_diagnostico" name="operacion" />
    </form>
</div>
<?php
            for($i=0;$i<count($Diagnosticos);$i++)
            {
                ?>
                    <input type="hidden" value="<?php print($Diagnosticos[$i][1]);?>" name="nombres[]" />
                <?php
            }
        ?>    
<script type="text/javascript">
$(function()
{
$("#cam_descripciondia").lemez_aceptar("texto","btn_enviar");
});
function validar_nombre()
{
    nombre_Diagnostico=document.getElementById('cam_descripciondia');
    nom_Diagnosticos = document.getElementsByName('nombres[]');
        for(i=0;i<nom_Diagnosticos.length;i++)
        {
            if(nom_Diagnosticos[i].value==nombre_Diagnostico.value.toUpperCase())
            {
                alert('Debe ingresar un nombre distinto, este ya se encuentra registrado.');
                nombre_Diagnostico.value='';
                nombre_Diagnostico.focus();
            }
        }
}
</script>