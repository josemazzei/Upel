<div style="float: left" class="col-lg-11 span11 pull-left">
    <h3>Asignar servicio</h3>
     <div class="alert alert-info">
        <ul>
            En este módulo podrá asignar sub-módulo y operación al rol del sistema.
        </ul>
    </div>
    <form action="../controlador/control_rol.php" method="POST" name="form_servicio">
        <input type="hidden" value="asignar_servicio" name="operacion" />
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
        <h5>Servicios</h5>
            <?php
                $lobjRol->set_Rol($_GET['id']);
                $laModulos=$lobjRol->consultar_modulos_menu();
                for($i=0;$i<count($laModulos);$i++)
                {
                    require_once('../clases/clase_servicio.php');
                    $lobjServicio=new clsServicio;
                    $laServicios=$lobjServicio->consultar_servicios_modulo($laModulos[$i][0]);
                    echo '<div class="col-lg-5 span5" style="display:inline">';                  
                        echo '<h5>'.$laModulos[$i][1].'</h5>';
                        if($laServicios)
                        {
                            $c=0;
                            echo '<div  class="checkbox" style="border: solid 1px #ccc">
                                <table class="table table-striped">
                                    <thead>
                                        <th>Servicio</th>
                                        <th>Tipo</th>
                                        <th><input type="checkbox" value="" title="Asignar todos" name="" id="cam_check_todos'.$i.'" onclick="habilitar_todos(this,'; echo "'".$i."'";echo ');" /> Asignar</th>
                                        <th>Orden</th>                    
                                    </thead>
                                    <tbody>';
                                $laServicios_Rol=$lobjRol->consultar_servicios($laModulos[$i][0]);
                                for($j=0;$j<count($laServicios);$j++)
                                {
                                    echo '<tr>';
                                    $cheked='';
                                    $disabled='disabled';
                                    for($k=0;$k<count($laServicios_Rol);$k++)
                                    {
                                        if($laServicios[$j][0]==$laServicios_Rol[$k][0])
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

                                    if($laServicios[$j][4]==1)
                                    {
                                        $tipo='Sub-Módulo';
                                    }
                                    elseif($laServicios[$j][4]==0)
                                    {
                                        $tipo='Operación';
                                    }

                                    echo '<td>
                                            '.$laServicios[$j][1].'
                                          </td>';

                                     echo '<td>
                                            '.$tipo.'
                                          </td>';
                                    echo '<td style="text-align:center">
                                            <input type="checkbox" name="idservicio'.$i.'[]" onclick="habilitar(this)" id="cam_asignar_'.$i.'_'.$j.'" value="'.$laServicios[$j][0].'" '.$cheked.'>
                                          </td>';
                                    
                                    if($tipo=='Sub-Módulo'){echo '<td style="display:block" >';}
                                    elseif($tipo=='Operación'){echo '<td style="display:none">';}
                                    
                                            echo '<select style="width:60px" name="orden'.$i.'[]" onchange="validar_orden(this)" id="cam_orden_'.$i.'_'.$j.'" '.$disabled.' >
                                                <option value="">-</option>
                                                ';
                                         
                                                for ($g=1; $g<=count($laServicios) ; $g++) 
                                                { 
                                                    $selected='';
                                                    if($cheked=='checked')
                                                    {
                                                        if($laServicios_Rol[$j-$c][4]==$g)
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

                            echo '
                                    </tbody>
                                </table>
                            </div>';
                        }
                        else
                        {
                            echo '<p class="text-danger" >Este módulo no tiene servicios registrados</p>';
                        }
                    echo "</div>";
                }
            ?>
        <div class="col-lg-10 span10 pull-left botonera" style="display: block;">
            <input type="submit" class="btn btn-success" name="btn_enviar" id="btn_enviar" value="Aceptar">
            <input type="button" class="btn btn-danger" name="btn_regresar" id="btn_regresar" value="Regresar" onclick="window.location.href='?vista=seguridad/asignar_modulo';">
        </div>
    </form>
</div>
<script type="text/javascript">
    function buscar_modulo(idrol)
    {
        window.location.href="intranet.php?vista=seguridad/asignar_servicio&id="+idrol;
    }
     function habilitar(cam_asignar)
    {
        separacion=cam_asignar.id.split('_');
        var j=separacion[2];
        var i = separacion[3];
        cam_orden=document.getElementById("cam_orden_"+j+"_"+i);

        if(cam_asignar.checked==true)
        {
           cam_orden.disabled=false; 
        }
        else
        {
            cam_orden.disabled=true; 
        }
    }

     function habilitar_todos(e,i)
    {
        idservicio=document.getElementsByName('idservicio'+i+'[]');
        for(i=0;i<idservicio.length;i++)
        {
            if(e.checked==true)
            {
                idservicio[i].checked=true;
            }
            else
            {
                idservicio[i].checked=false;
            }
        }
    }

    function validar_orden(e)
    {
         separacion=e.id.split('_');
        var j=separacion[2];
        orden=document.getElementsByName('orden'+j+'[]');
        for (var i = 0; i<orden.length; i++) {
            if(orden[i].value==e.value && e.id!="cam_orden_"+j+"_"+i)
            {
                orden[i].value="";
                break;
            }
        };
        
    }
</script>