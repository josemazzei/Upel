<div style="float: left" class="col-lg-8 span8 pull-left">
    <h3>Asignar módulo</h3>
    <div class="alert alert-info">
        <ul>
            En este entorno podrá asignar módulo al rol del sistema.
        </ul>
    </div>

    <form action="../controlador/control_rol.php" method="POST" name="form_servicio">
        <input type="hidden" value="asignar_modulo" name="operacion" />
        <label><h5>Rol</h5></label>
        <select name="idrol" id="cam_idrol" onchange="buscar_modulo(this.value);" required>
            <option value="">Seleccione un rol</option>
            <?php
            require_once('../clases/clase_rol.php');
            $lobjRol=new clsrol;
            $laroles=$lobjRol->consultar_roles();
            for($i=0;$i<count($laroles);$i++)
            {
                if($laroles[$i][0]==$_GET['id'])
                {
                    echo '<option value="'.$laroles[$i][0].'" selected>'.$laroles[$i][1].'</option>';
                }
                else
                {
                    echo '<option value="'.$laroles[$i][0].'">'.$laroles[$i][1].'</option>';
                }
            }
            ?>
        </select>
        <div class="checkbox">
            <table class="table table-striped">
                <thead>
                    <br>
                    <th align="center">Módulo</th>
                    <th align="center">Asignar <input type="checkbox" value="" title="Asignar todos" name="" id="cam_check_todos" onclick="habilitar_todos(this);" /></th>
                    <th align="center">Orden</th>                  
                </thead>
                <tbody>
                <?php
                    require_once('../clases/clase_modulo.php');
                    $lobjModulo=new clsModulo;
                    $laModulos=$lobjModulo->consultar_modulos_activos();

                    $lobjRol->set_Rol($_GET['id']);
                    $laModulos_Rol=$lobjRol->consultar_modulos();
                    for($i=0;$i<count($laModulos);$i++)
                    {
                        echo '<tr>';
                        $cheked='';
                        $disabled='disabled';
                        for($j=0;$j<count($laModulos_Rol);$j++)
                        {
                            if($laModulos_Rol[$j][0]==$laModulos[$i][0])
                            {
                                $cheked='checked';
                                $disabled='';
                                break;
                            }

                        }
                         if($cheked!='checked')
                        {
                            $c++;
                        }
                         echo '<td style="text-align:center">
                                '.$laModulos[$i][1].'
                              </td>';
                        echo '<td style="text-align:center">
                                <input type="checkbox" name="idmodulo[]" onclick="habilitar(this)" id="cam_asignar'.$i.'" value="'.$laModulos[$i][0].'" '.$cheked.'>
                              </td>';
                        echo '<td style="text-align:center">
                                <select style="width:50px" name="orden[]" onchange="validar_orden(this)" id="cam_orden'.$i.'" '.$disabled.' >
                                    <option value="">-</option>
                                    ';
                                   
                                    for ($g=1; $g<=count($laModulos) ; $g++) 
                                    { 
                                        $selected='';
                                        if($cheked=='checked')
                                        {
                                            if($laModulos_Rol[$i-$c][2]==$g)
                                            {
                                                $selected='selected';  
                                                
                                            }
                                        }
                                        echo '<option value="'.$g.'" '.$selected.'>'.$g.'</option>';
                                    }
                                
                                echo '</select>
                              </td>';
                        echo '</tr>';
                    }
                ?>
                </tbody>
            </table>
        </div>
        <div class="col-lg-10 span10 pull-left botonera" style="display: block;">
            <input type="submit" class="btn btn-success" name="btn_enviar" id="btn_enviar" value="Aceptar">
            <input type="button" class="btn btn-danger" name="btn_regresar" id="btn_regresar" value="Regresar" onclick="window.location.href='intranet.php';">
        </div>
    </form>
</div>
<script type="text/javascript">
    function buscar_modulo(idrol)
    {
        window.location.href="intranet.php?vista=seguridad/asignar_modulo&id="+idrol;
    }
    function habilitar(cam_asignar)
    {
        var i = cam_asignar.id.substring((cam_asignar.id.length-1),cam_asignar.id.length);
        cam_orden=document.getElementById("cam_orden"+i);

        if(cam_asignar.checked==true)
        {
           cam_orden.disabled=false; 
        }
        else
        {
            cam_orden.disabled=true; 
        }
    }

     function habilitar_todos(e)
    {

        idmodulo=document.getElementsByName('idmodulo[]');
        for(i=0;i<idmodulo.length;i++)
        {
            if(e.checked==true)
            {
                idmodulo[i].checked=true;
            }
            else
            {
                idmodulo[i].checked=false;
            }
        }
    }

    function validar_orden(e)
    {
        orden=document.getElementsByName('orden[]');
        for (var i = 0; i<orden.length; i++) {
            if(orden[i].value==e.value && e.id!="cam_orden"+i)
            {
                orden[i].value="";
                break;
            }
        };
        
    }
</script>