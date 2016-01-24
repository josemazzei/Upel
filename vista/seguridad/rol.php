<?php
$consultar= $registrar= $eliminar=false;
for($i=0;$i<count($laModulos);$i++) 
    {
         
        $laServicios=$lobjRol->consultar_servicios_menu($laModulos[$i][0]); 
        for ($j=0; $j <count($laServicios) ; $j++) //Se recorre un ciclo para poder extraer los datos de cada uno de los servicios que tiene asignado el modulo para poder constuir el menú
        {
            if($laServicios[$j][2]=='seguridad/consultar_rol')
            {
                $consultar=true;
            }
            if($laServicios[$j][2]=='seguridad/registrar_rol')
            {
                $registrar=true;
            }
            if($laServicios[$j][2]=='seguridad/eliminar_rol')
            {
                $eliminar=true;
            }
        }
    }
?>
<script>
 function buscar(id)
 {
    window.location.href="?vista=seguridad/consultar_rol&o=Consultar&id="+id;
 }
  function eliminar(id)
  {
     if(confirm("¿Esta seguro que desea desactivar el módulo seleccionado?"))
    {
      document.getElementById("cam_idrol").value=id;
      document.form_rol.submit();
    }
  }

    function restaurar(id)
  {
     if(confirm("¿Esta seguro que desea restaurar el rol seleccionado?"))
    {
      document.getElementById("cam_idrol").value=id;
      document.getElementById("cam_operacion").value='restaurar_rol';
      document.form_rol.submit();
    }
  }
</script>
<script type="text/javascript" charset="utf-8">
    $(document).ready(function() {
        oTable = $('#filtro').dataTable({
            "bJQueryUI": true,
            "sPaginationType": "full_numbers",
            "iDisplayLength": 5                    
        });
    } );
</script>  
<div style="float: left" class="col-lg-8 span8 pull-left">
    <h3>Rol</h3>
   <div class="alert alert-info">
        <ul>
            En este módulo podrá registrar, consultar, editar, desactivar y activar el rol del sistema.
        </ul>
    </div>
    <form action="../controlador/control_rol.php" method="POST" name="form_rol">
        <input type="hidden" value="eliminar_rol" name="operacion" id="cam_operacion"/>
        <input type="hidden"  name="idrol" id="cam_idrol"/>
        <?php
        if($registrar)
        {
            echo '<a class="btn btn-success" id="btn_registrar" href="?vista=seguridad/registrar_rol"><i class="icon-plus icon-white"></i> Registrar rol</a>';
        }
        ?>
        <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable dataTable" id="filtro">
            <thead>
                <th>Codigo</th><th>Nombre</th><th>Estatus</th><?php if($consultar || $eliminar)
                        { echo '<th>Acción</th>';}?>
            </thead>
            <tbody>
            <?php
                    require_once('../clases/clase_rol.php');
                    $lobjrol=new clsrol;
                    $larols=$lobjrol->consultar_roles();
                    for($i=0;$i<count($larols);$i++)
                    {
                        $dependencia=false;
                        $lobjrol->set_Rol($larols[$i][0]);
                        $dependencia=$lobjrol->consultar_dependencia();
                        if($larols[$i][2])
                        {
                            $larols[$i][2]='Activo';
                        }
                        elseif(!$larols[$i][2]) 
                        {
                            $larols[$i][2]='Inactivo';
                        }

                        echo '<tr>';
                        echo '<td>'.$larols[$i][0].'</td>';
                        echo '<td>'.$larols[$i][1].'</td>';
                        echo '<td>'.$larols[$i][2].'</td>';
                        if($consultar || $eliminar)
                        {
                            echo '<td>';
                            if($consultar && $larols[$i][2]=='Activo')
                            {
                                echo '<a class="btn btn-info" href="#" title="Consultar" onclick="buscar('.$larols[$i][0].')"><i class="icon-search icon-white"></i></a> ';
                            }
                            if($eliminar && $dependencia==false)
                            {
                                if($larols[$i][2]=='Activo')
                                {
                                    echo '<a class="btn btn-danger" href="#" title="Desactivar" onclick="eliminar('.$larols[$i][0].')" ><i class="icon-remove icon-white"></i></a> ';
                                }
                                elseif($larols[$i][2]=='Inactivo')
                                {
                                    echo '<a class="btn btn-warning" title="Restaurar" href="#" onclick="restaurar('.$larols[$i][0].')" ><i class="icon-refresh icon-white"></i></a>';
                                }
                            }
                            echo "</td>";
                        }
                        echo '</tr>';
                    }
                ?>
                </tbody>
        </table>
    </form>
    
</div>