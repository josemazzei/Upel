<?php
$consultar= $registrar= $eliminar=false;
for($i=0;$i<count($laModulos);$i++) 
    {
         
        $laServicios=$lobjRol->consultar_servicios_menu($laModulos[$i][0]); 
        for ($j=0; $j <count($laServicios) ; $j++) //Se recorre un ciclo para poder extraer los datos de cada uno de los servicios que tiene asignado el modulo para poder constuir el menú
        {
            if($laServicios[$j][2]=='archivo/consultar_unidad_medida')
            {
                $consultar=true;
            }
            if($laServicios[$j][2]=='archivo/registrar_unidad_medida')
            {
                $registrar=true;
            }
            if($laServicios[$j][2]=='archivo/eliminar_unidad_medida')
            {
                $eliminar=true;
            }
        }
    }
?>
<script>
 function buscar(id)
 {
    window.location.href="?vista=archivo/consultar_unidad_medida&id="+id;
 }
  function eliminar(id)
  {
     if(confirm("¿Esta seguro que desea desactivar la Unidad de Medida seleccionada?"))
    {
      document.getElementById("cam_idunidad_medida").value=id;
      document.form_unidad_medida.submit();
    }
  }
    function restaurar(id)
  {
     if(confirm("¿Esta seguro que desea restaurar la Unidad de Medida seleccionada?"))
    {
      document.getElementById("cam_idunidad_medida").value=id;
      document.getElementById("cam_operacion").value='restaurar_unidad_medida';
      document.form_unidad_medida.submit();
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
    <h3>Unidad de Medida</h3>
   <div class="alert alert-info">
        <ul>
            En este módulo podrá registrar, consultar, editar, desactivar y activar la Unidad de Medida en el sistema.
        </ul>
    </div>
    <form action="../controlador/control_unidad_medida.php" method="POST" name="form_unidad_medida">
        <input type="hidden" value="eliminar_unidad_medida" name="operacion" id="cam_operacion"/>
        <input type="hidden"  name="idunidad_medida" id="cam_idunidad_medida"/>
        <?php
        if($registrar)
        {
            echo '<a id="btn_registrar" class="btn btn-success" href="?vista=archivo/registrar_unidad_medida"><i class="icon-plus icon-white"></i> Registrar Unidad de Medida</a>';
        }
        ?>
        <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable dataTable" id="filtro">
            <thead>
                <th>Código</th><th>Nombre</th><th>Estatus</th><?php if($consultar || $eliminar)
                        { echo '<th>Acción</th>';}?>
            </thead>
            <tbody>
            <?php
                    require_once('../clases/clase_unidad_medida.php');
                    $lobjUnidad_Medida=new clsUnidad_Medida;
                    $launidad_medidas=$lobjUnidad_Medida->consultar_unidad_medidas_inactivos();
                    for($i=0;$i<count($launidad_medidas);$i++)
                    {
                        $dependencia=false;
                        $lobjUnidad_Medida->set_Unidad_Medida($launidad_medidas[$i][0]);
                        $dependencia=$lobjUnidad_Medida->consultar_dependencia();
                        if($launidad_medidas[$i][2])
                        {
                            $launidad_medidas[$i][2]='Activo';
                        }
                        elseif(!$launidad_medidas[$i][2]) 
                        {
                            $launidad_medidas[$i][2]='Inactivo';
                        }

                        echo '<tr>';
                        echo '<td>'.$launidad_medidas[$i][0].'</td>';
                        echo '<td>'.$launidad_medidas[$i][1].'</td>';
                        echo '<td>'.$launidad_medidas[$i][2].'</td>';
                        if($consultar || $eliminar)
                        {
                            echo '<td>';
                            if($consultar && $launidad_medidas[$i][2]=='Activo')
                            {
                                echo '<a class="btn btn-info" href="#" title="Consultar" onclick="buscar('.$launidad_medidas[$i][0].')"><i class="icon-search icon-white"></i></a> ';
                            }
                            if($eliminar && $dependencia==false)
                            {
                                if($launidad_medidas[$i][2]=='Activo')
                                {
                                    echo '<a class="btn btn-danger" href="#" title="Desactivar" onclick="eliminar('.$launidad_medidas[$i][0].')" ><i class="icon-remove icon-white"></i></a> ';
                                    
                                }
                                elseif ($launidad_medidas[$i][2]=='Inactivo') 
                                {
                                    echo '<a class="btn btn-warning" title="Restaurar" href="#" onclick="restaurar('.$launidad_medidas[$i][0].')" ><i class="icon-refresh icon-white"></i></a>';
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