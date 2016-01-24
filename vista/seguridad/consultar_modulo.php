<?php
    require_once("../clases/clase_modulo.php");
    $lobjModulo=new clsModulo;
    $id=(isset($_GET['id']))?$_GET['id']:"";
    $lobjModulo->set_Modulo($id);
    $laModulo=$lobjModulo->consultar_modulo();
    $Modulos=$lobjModulo->consultar_modulos();
?>
<div style="float: left" class="col-lg-8 span8 pull-left">
    <h3>Consultar Módulo</h3>
     <div class="alert alert-info">
        <ul>
            <li>En este formulario podrá consultar y editar el módulo del sistema.</li>
            <li>Sí necesitas ayuda para usar este formulario haz clic en el botón <button class="btn btn-warning" type="button" onclick="javascript:introJs().start();"><i class="fa fa-question-circle"></i> Ayuda</button>.</li>
        </ul>
    </div>
    <form class="formulario" action="../controlador/control_modulo.php" method="POST" name="form_modulo">
        <input type="hidden" value="editar_modulo" name="operacion" />
        <input type="hidden"  name="idmodulo" id="cam_idmodulo" value="<?php echo $laModulo[0];?>"/>
        <label>Nombre <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Nombre del modulo."><i class="fa fa-question" ></i></span></label>
        <input type="text" name="nombremod" id="cam_nombremod"onchange="validar_nombre();" value="<?php echo $laModulo[1];?>" required/>
        <div class="botonera">
            <input type="submit" class="btn btn-success" name="btn_enviar" id="btn_enviar" value="Guardar">
            <input type="button" class="btn btn-danger" name="btn_regresar" id="btn_regresar" value="Regresar" onclick="window.location.href='?vista=seguridad/modulo';">
        </div>
    </form>
</div>
<?php
        for($i=0;$i<count($Modulos);$i++)
        {
            ?>
                <input type="hidden" value="<?php print($Modulos[$i][1]);?>" name="nombres[]" />
            <?php
        }
?>
<script type="text/javascript">

function validar_nombre()
{
   nombre_modulo=document.getElementById('cam_nombremod');
    nom_modulos = document.getElementsByName('nombres[]');
       for(i=0;i<nom_modulos.length;i++)
        {
            if(nom_modulos[i].value==nombre_modulo.value.toUpperCase())
            {
                alert('Debe ingresar un nombre distinto, este ya se encuentra registrado.');
                nombre_modulo.value='';
                nombre_modulo.focus();
            }
        }
}
</script>