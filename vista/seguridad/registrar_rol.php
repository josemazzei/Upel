<?php

    require_once("../clases/clase_rol.php");
    $lobjrol=new clsRol;
    $id=(isset($_GET['id']))?$_GET['id']:"";
    $lobjrol->set_Rol($id);
    $Roles= $lobjrol->consultar_roles();
?>
<div style="float: left" class="col-lg-8 span8 pull-left">
    <h3>Registrar Rol</h3>
     <div class="alert alert-info">
        <ul>
            <li>En este formuario podrá registrar el rol del sistema .</li>
            <li>Sí necesitas ayuda para usar este formulario haz clic en el botón <button class="btn btn-warning" type="button" onclick="javascript:introJs().start();"><i class="fa fa-question-circle"></i> Ayuda</button>.</li>
        </ul>
    </div>
    <form class="formulario" action="../controlador/control_rol.php" method="POST" name="form_rol">
        <input type="hidden" value="registrar_rol" name="operacion" />
        <input type="hidden"  name="idrol" id="cam_idrol"/>
        <label>Nombre <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Nombre del rol."><i class="fa fa-question" ></i></span></label>
        <input type="text" name="nombrerol" id="cam_nombrerol" onchange="validar_nombre();" required/>
        <div class="botonera">
            <input type="submit" class="btn btn-success" name="btn_enviar" id="btn_enviar" value="Aceptar">
            <input type="button" class="btn btn-danger" name="btn_regresar" id="btn_regresar" value="Regresar" onclick="window.location.href='?vista=seguridad/rol';">
        </div>
    </form>
</div>
<?php
            for($i=0;$i<count($Roles);$i++)
            {
                ?>
                    <input type="hidden" value="<?php print($Roles[$i][1]);?>" name="nombres[]" />
                <?php
            }
?>
<script type="text/javascript">
function validar_nombre()
{
    nombre_rol=document.getElementById('cam_nombrerol');
    nom_roles = document.getElementsByName('nombres[]');
       for(i=0;i<nom_roles.length;i++)
        {
            if(nom_roles[i].value==nombre_rol.value.toUpperCase())
            {
                alert('Debe ingresar un nombre distinto, este ya se encuentra registrado.');
                nombre_rol.value='';
                nombre_rol.focus();
            }
        }
}
</script>
