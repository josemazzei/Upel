<?php
$consultar= $registrar= $eliminar=false;
for($i=0;$i<count($laModulos);$i++) 
    {
        $laServicios=$lobjRol->consultar_servicios_menu($laModulos[$i][0]); 
        for ($j=0; $j <count($laServicios) ; $j++) //Se recorre un ciclo para poder extraer los datos de cada uno de los servicios que tiene asignado el modulo para poder constuir el menú
        {
            if($laServicios[$j][2]=='seguridad/consultar_modulo')
            {
                $consultar=true;
            }
            if($laServicios[$j][2]=='seguridad/registrar_modulo')
            {

                $registrar=true;
            }
            if($laServicios[$j][2]=='seguridad/eliminar_modulo')
            {
                $eliminar=true;
            }
        }
    }
?>
<script>
 function buscar(id)
 {
    window.location.href="?vista=seguridad/consultar_modulo&o=Consultar&id="+id;
 }
  function eliminar(id)
  {
     if(confirm("¿Esta seguro que desea desactivar el módulo seleccionado?"))
    {
      document.getElementById("cam_idmodulo").value=id;
      document.form_modulo.submit();
    }
  }
    function restaurar(id)
  {
     if(confirm("¿Esta seguro que desea restaurar el módulo seleccionado?"))
    {
      document.getElementById("cam_idmodulo").value=id;
      document.getElementById("cam_operacion").value='restaurar_modulo';
      document.form_modulo.submit();
    }
  }
    $(document).ready(function() {
        oTable = $('#filtro').dataTable({
            "bJQueryUI": true,
            "sPaginationType": "full_numbers",
            "iDisplayLength": 5                    
        });
    } );
</script>
<!--datatable-->  
<div style="float: left" class="col-lg-8 span8 pull-left">
    <h3>Módulo</h3>
    <div class="alert alert-info">
        <ul>
            En este módulo podrá registrar, consultar, editar, desactivar y activar el módulo del sistema.
        </ul>
    </div>
    <form action="../controlador/control_modulo.php" method="POST" name="form_modulo">
        <input type="hidden" value="eliminar_modulo" name="operacion" id="cam_operacion"/>
        <input type="hidden"  name="idmodulo" id="cam_idmodulo"/>
        <?php
        if($registrar)
        {
            echo '<a class="btn btn-success" id="btn_registrar" href="?vista=seguridad/registrar_modulo"><i class="icon-plus icon-white"></i> Registrar modulo</a>';
        }
        ?>
        <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable dataTable" id="filtro">
            <thead>
                <th>Código</th><th>Nombre</th><th>Estatus</th><?php if($consultar || $eliminar)
                        { echo '<th>Acción</th>';}?>
            </thead>
            <tbody>
            <?php
                    require_once('../clases/clase_modulo.php');
                    $lobjModulo=new clsModulo;
                    $laModulos=$lobjModulo->consultar_modulos();
                    for($i=0;$i<count($laModulos);$i++)
                    {
                        $dependencia=false;
                        $lobjModulo->set_Modulo($laModulos[$i][0]);
                        $dependencia=$lobjModulo->consultar_dependencia();
                        if($laModulos[$i][2])
                        {
                            $laModulos[$i][2]='Activo';
                        }
                        elseif(!$laModulos[$i][2]) 
                        {
                            $laModulos[$i][2]='Inactivo';
                        }

                        echo '<tr>';
                        echo '<td>'.$laModulos[$i][0].'</td>';
                        echo '<td>'.$laModulos[$i][1].'</td>';
                        echo '<td>'.$laModulos[$i][2].'</td>';
                        if($consultar || $eliminar)
                        {
                            echo '<td>';
                            if($consultar && $laModulos[$i][2]=='Activo')
                            {
                                echo '<a class="btn btn-info" href="#" onclick="buscar('.$laModulos[$i][0].')"><i class="icon-search icon-white"></i></a>';
                            }
                            if($eliminar && $dependencia==false)
                            {
                                if($laModulos[$i][2]=='Activo')
                                {
                                    echo '<a class="btn btn-danger" href="#" onclick="eliminar('.$laModulos[$i][0].')" ><i class="icon-remove icon-white"></i></a>';
                                }
                                elseif($laModulos[$i][2]=='Inactivo')
                                {
                                    echo '<a class="btn btn-warning" title="Revertir Cambios" href="#" onclick="restaurar('.$laModulos[$i][0].')" ><i class="icon-refresh icon-white"></i></a>';
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