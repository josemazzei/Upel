<?php
$consultar= $registrar= $eliminar=false;
for($i=0;$i<count($laModulos);$i++) 
    {
         
        $laServicios=$lobjRol->consultar_servicios_menu($laModulos[$i][0]); 
        for ($j=0; $j <count($laServicios) ; $j++) //Se recorre un ciclo para poder extraer los datos de cada uno de los servicios que tiene asignado el modulo para poder constuir el menú
        {
            if($laServicios[$j][2]=='archivo/consultar_item')
            {
                $consultar=true;
            }
            if($laServicios[$j][2]=='archivo/registrar_item')
            {
                $registrar=true;
            }
            if($laServicios[$j][2]=='archivo/eliminar_item')
            {
                $eliminar=true;
            }
        }
    }
?>
<script>
 function buscar(id)
 {
    window.location.href="?vista=archivo/consultar_item&id="+id;
 }
  function eliminar(id)
  {
     if(confirm("¿Esta seguro que desea desactivar el item seleccionado?"))
    {
      document.getElementById("cam_iditem").value=id;
      document.form_item.submit();
    }
  }
  function restaurar(id)
  {
     if(confirm("¿Esta seguro que desea restaurar el item seleccionado?"))
    {
      document.getElementById("cam_iditem").value=id;
      document.getElementById("cam_operacion").value='restaurar_item';
      document.form_item.submit();
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
<div style="float: left" class="col-lg-10 span10 pull-left">
    <h3>Criterio de evaluación</h3>
     <div class="alert alert-info">
        <ul>
            En este módulo podrá registrar, consultar, editar, desactivar y activar el criterio de evaluación que se utilizará en el instrumento para aplicar la evaluación.
        </ul>
    </div>
    <form action="../controlador/control_item.php" method="POST" name="form_item">
        <input type="hidden" value="eliminar_item" name="operacion" id="cam_operacion"/>
        <input type="hidden"  name="iditem" id="cam_iditem"/>        
        <?php
        if($registrar)
        {
            echo '<a id="btn_registrar" class="btn btn-success" href="?vista=archivo/registrar_item"><i class="icon-plus icon-white"></i>Registrar Criterio</a>';
        }
        ?>
        <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable dataTable" id="filtro">
            <thead>
                <th>Código</th><th>Nombre</th><th>Descripción</th><th>Estatus</th><?php if($consultar || $eliminar)
                        { echo '<th>Acción</th>';}?>
            </thead>
            <tbody>
            <?php
                    require_once('../clases/clase_item.php');
                    $lobjItem=new clsItem;
                    $laItems=$lobjItem->consultar_items_inactivas();
                    for($i=0;$i<count($laItems);$i++)
                    {
                        $dependencia=false;
                        $lobjItem->set_Item($laItems[$i][0]);
                        $dependencia=$lobjItem->consultar_dependencia();
                        if($laItems[$i][4])
                        {
                            $laItems[$i][4]='Activo';
                        }
                        elseif(!$laItems[$i][4]) 
                        {
                            $laItems[$i][4]='Inactivo';
                        }
                        echo '<tr>';
                        echo '<td>'.$laItems[$i][0].'</td>';
                        echo '<td>'.$laItems[$i][1].'</td>';
                        echo '<td>'.$laItems[$i][3].'</td>';
                        echo '<td>'.$laItems[$i][4].'</td>';
                        if($consultar || $eliminar)
                        {
                            echo '<td>';
                            if($consultar && $laItems[$i][4]=='Activo')
                            {
                                echo '<a class="btn btn-info" href="#" title="Consultar" onclick="buscar('.$laItems[$i][0].')"><i class="icon-search icon-white"></i></a> ';
                            }
                            if($eliminar && $dependencia==false)
                            {
                                if($laItems[$i][4]=='Activo')
                                {
                                    echo '<a class="btn btn-danger" href="#" title="Desactivar" onclick="eliminar('.$laItems[$i][0].')" ><i class="icon-remove icon-white"></i></a> ';
                                }
                                elseif ($laItems[$i][4]=='Inactivo') 
                                {
                                    echo '<a class="btn btn-warning" title="Restaurar" href="#" onclick="restaurar('.$laItems[$i][0].')" ><i class="icon-refresh icon-white"></i></a>';
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