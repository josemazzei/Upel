<?php
    require_once("../clases/clase_parentesco.php");
    $lobjparentesco=new clsParentesco;
    $id=(isset($_GET['id']))?$_GET['id']:"";
    $lobjparentesco->set_parentesco($id);
    $laparentesco=$lobjparentesco->consultar_parentesco();
    $Parentescos= $lobjparentesco->consultar_parentescos_inactivos();
?>
<div style="float: left" class="col-lg-8 span8 pull-left">
    <h3>Consultar parentesco</h3>
    <div class="alert alert-info">
        <ul>
            <li>En este formulario podrá consultar y editar el parentesco del familiar hacia el participante.</li>
            <li>Sí necesitas ayuda para usar este formulario haz clic en el botón <button class="btn btn-warning" type="button" onclick="javascript:introJs().start();"><i class="fa fa-question-circle"></i> Ayuda</button>.</li>
        </ul>
    </div>
    <form class="formulario" action="../controlador/control_parentesco.php" method="POST" name="form_parentesco">
        <input type="hidden"  name="idparentesco" id="cam_idparentesco" value="<?php echo $laparentesco[0];?>"/>
        <label>Nombre <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Nombre del parentesco."><i class="fa fa-question" ></i></span></label>
        <input type="text" name="descripcionpar" id="cam_descripcionpar" onchange="validar_nombre();" value="<?php echo $laparentesco[1];?>" required/>
        <div class="botonera">
            <input type="submit" class="btn btn-success" name="btn_enviar" id="btn_enviar" value="Guardar">
            <input type="button" class="btn btn-danger" name="btn_regresar" id="btn_regresar" value="Regresar" onclick="window.location.href='?vista=archivo/parentesco';">
        </div>
        <input type="hidden" value="editar_parentesco" name="operacion" />
    </form>
</div>
<?php
            for($i=0;$i<count($Parentescos);$i++)
            {
                ?>
                    <input type="hidden" value="<?php print($Parentescos[$i][1]);?>" name="nombres[]" />
                <?php
            }
        ?>
<script type="text/javascript">
$(function(){
$("#cam_descripcionpar").lemez_aceptar("texto","btn_enviar");
});
function validar_nombre()
{
    nombre_parentesco=document.getElementById('cam_descripcionpar');
    nom_parentesco = document.getElementsByName('nombres[]');
        for(i=0;i<nom_parentesco.length;i++)
        {
            if(nom_parentesco[i].value==nombre_parentesco.value.toUpperCase())
            {
                alert('Debe ingresar un nombre distinto, este ya se encuentra registrado.');
                nombre_parentesco.value='';
                nombre_parentesco.focus();
            }
        }
}
</script>