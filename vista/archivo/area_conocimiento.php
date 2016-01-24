<?php
$consultar= $registrar= $eliminar=false;
for($i=0;$i<count($laModulos);$i++) 
    {
         
        $laServicios=$lobjRol->consultar_servicios_menu($laModulos[$i][0]); 
        for ($j=0; $j <count($laServicios) ; $j++) //Se recorre un ciclo para poder extraer los datos de cada uno de los servicios que tiene asignado el modulo para poder constuir el menú
        {
            if($laServicios[$j][2]=='archivo/consultar_area')
            {
                $consultar=true;
            }
            if($laServicios[$j][2]=='archivo/registrar_area')
            {
                $registrar=true;
            }
            if($laServicios[$j][2]=='archivo/eliminar_area')
            {
                $eliminar=true;
            }
        }
    }
?>
<script>
 function buscar(id)
 {
    window.location.href="?vista=archivo/consultar_area&id="+id;
 }
  function eliminar(id)
  {
     if(confirm("¿Esta seguro que desea desactivar el área de conocimiento seleccionada ?"))
    {
      document.getElementById("cam_idarea_conocimiento").value=id;
      document.form_area_conocimiento.submit();
    }
  }
  function restaurar(id)
  {
     if(confirm("¿Esta seguro que desea restaurar el área de conocimiento seleccionado?"))
    {
      document.getElementById("cam_idarea_conocimiento").value=id;
      document.getElementById("cam_operacion").value='restaurar_area';
      document.form_area_conocimiento.submit();
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
    <h3>Área de conocimiento</h3>
     <div class="alert alert-info">
        <ul>
            En este módulo podrá registrar, consultar, editar, desactivar y activar el área de conocimiento para la asignatura.
        </ul>
    </div>
    <form action="../controlador/control_areaconocimiento.php" method="POST" name="form_area_conocimiento">
        <input type="hidden" value="eliminar_area" name="operacion" id="cam_operacion" />
        <input type="hidden"  name="idarea_conocimiento" id="cam_idarea_conocimiento"/>
        <?php
        if($registrar)
        {
            echo '<a id="btn_registrar" class="btn btn-success" href="?vista=archivo/registrar_area"><i class="icon-plus icon-white"></i> Registrar área de conocimiento</a>';
        }
        ?>
        <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable dataTable" id="filtro">
            <thead>
                <th>Código</th><th>Nombre</th><th>Estatus</th><?php if($consultar || $eliminar)
                        { echo '<th>Acción</th>';}?>
            </thead>
            <tbody>
            <?php
                    require_once('../clases/clase_areaconocimiento.php');
                    $lobjArea=new clsAreaconocimiento;
                    $laAreas=$lobjArea->consultar_areas_inactivas();
                    for($i=0;$i<count($laAreas);$i++)
                    {
                        $dependencia=false;
                        $lobjArea->set_Area($laAreas[$i][0]);
                        $dependencia=$lobjArea->consultar_dependencia();
                        if($laAreas[$i][2])
                        {
                            $laAreas[$i][2]='Activo';
                        }
                        elseif(!$laAreas[$i][2]) 
                        {
                            $laAreas[$i][2]='Inactivo';
                        }
                        echo '<tr>';
                        echo '<td>'.$laAreas[$i][0].'</td>';
                        echo '<td>'.$laAreas[$i][1].'</td>';
                        echo '<td>'.$laAreas[$i][2].'</td>';
                        if($consultar || $eliminar)
                        {
                            echo '<td>';
                            if($laAreas[$i][2]=='Activo' && $consultar)
                            {
                                echo '<a class="btn btn-info" href="#" title="Consultar" onclick="buscar('.$laAreas[$i][0].')"><i class="icon-search icon-white"></i></a> ';
                            }
                            if($eliminar && $dependencia==false)
                            {
                                if($laAreas[$i][2]=='Activo')
                                {
                                    echo '<a class="btn btn-danger" href="#" title="Desactivar" onclick="eliminar('.$laAreas[$i][0].')" ><i class="icon-remove icon-white"></i></a> ';
                                }
                                elseif ($laAreas[$i][2]=='Inactivo') 
                                {
                                    echo '<a class="btn btn-warning" title="Restaurar" href="#" onclick="restaurar('.$laAreas[$i][0].')" ><i class="icon-refresh icon-white"></i></a>';
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