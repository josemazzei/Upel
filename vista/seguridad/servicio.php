<?php
$consultar= $registrar= $eliminar=false;
for($i=0;$i<count($laModulos);$i++) 
    {
         
        $laServicios=$lobjRol->consultar_servicios_menu($laModulos[$i][0]); 
        for ($j=0; $j <count($laServicios) ; $j++) //Se recorre un ciclo para poder extraer los datos de cada uno de los servicios que tiene asignado el modulo para poder constuir el menú
        {
            if($laServicios[$j][2]=='seguridad/consultar_servicio')
            {
                $consultar=true;
            }
            if($laServicios[$j][2]=='seguridad/registrar_servicio')
            {
                $registrar=true;
            }
            if($laServicios[$j][2]=='seguridad/eliminar_servicio')
            {
                $eliminar=true;
            }
        }
    }
?>
<script>
 function buscar(id)
 {
    window.location.href="?vista=seguridad/consultar_servicio&o=Consultar&id="+id;
 }
  function eliminar(id)
  {
     if(confirm("¿Esta seguro que desea desactivar el servicio seleccionado?"))
    {
      document.getElementById("cam_idservicio").value=id;
      document.form_servicio.submit();
    }
  }
  function restaurar(id)
  {
     if(confirm("¿Esta seguro que desea restaurar el servicio seleccionado?"))
    {
      document.getElementById("cam_idservicio").value=id;
      document.getElementById("cam_operacion").value='restaurar_servicio';
      document.form_servicio.submit();
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
    <h3>Servicio</h3>
    <div class="alert alert-info">
        <ul>
            En este módulo podrá registrar, consultar, editar, desactivar y activar el servicio del sistema.
        </ul>
    </div>

    <form action="../controlador/control_servicio.php" method="POST" name="form_servicio">
        <input type="hidden" value="eliminar_servicio" name="operacion" id="cam_operacion"/>
        <input type="hidden"  name="idservicio" id="cam_idservicio"/>
        <?php
        if($registrar)
        {
            echo '<a class="btn btn-success" id="btn_registrar" href="?vista=seguridad/registrar_servicio"><i class="icon-plus icon-white"></i> Registrar servicio</a>';
        }
        ?>
        <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable dataTable" id="filtro">
            <thead>
                <th>Codigo</th><th>Nombre</th><th>enlace</th><th>módulo</th><th>Estatus</th><?php if($consultar || $eliminar)
                        { echo '<th>Acción</th>';}?>
            </thead>
            <tbody>
            <?php
                    require_once('../clases/clase_servicio.php');
                    $lobjServicio=new clsServicio;
                    $laServicios=$lobjServicio->consultar_servicios();
                    for($i=0;$i<count($laServicios);$i++)
                    {
                        $dependencia=false;
                        $lobjServicio->set_Servicio($laServicios[$i][0]);
                        $dependencia=$lobjServicio->consultar_dependencia();
                        if($laServicios[$i][5])
                        {
                            $laServicios[$i][5]='Activo';
                        }
                        elseif(!$laServicios[$i][5]) 
                        {
                            $laServicios[$i][5]='Inactivo';
                        }
                        echo '<tr>';
                        echo '<td>'.$laServicios[$i][0].'</td>';
                        echo '<td>'.$laServicios[$i][1].'</td>';
                        echo '<td>'.$laServicios[$i][2].'</td>';
                        echo '<td>'.$laServicios[$i][3].'</td>';
                        echo '<td>'.$laServicios[$i][5].'</td>';
                         if($consultar || $eliminar)
                        {
                            echo '<td>';
                            if($consultar && $laServicios[$i][5]=='Activo')
                            {
                                echo '<a class="btn btn-info" href="#" title="Consultar" onclick="buscar('.$laServicios[$i][0].')"><i class="icon-search icon-white"></i></a> ';
                            }
                            if($eliminar && $dependencia==false)
                            {
                                if($laServicios[$i][5]=='Activo')
                                {
                                echo '<a class="btn btn-danger" href="#" title="Desactivar" onclick="eliminar('.$laServicios[$i][0].')" ><i class="icon-remove icon-white"></i></a> ';
                                }
                                elseif($laServicios[$i][5]=='Inactivo')
                                {
                                    echo '<a class="btn btn-warning" title="Restaurar" href="#" onclick="restaurar('.$laServicios[$i][0].')" ><i class="icon-refresh icon-white"></i></a>';
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