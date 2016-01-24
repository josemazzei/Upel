<?php
$consultar= $registrar= $eliminar=false;
for($i=0;$i<count($laModulos);$i++) 
    {
         
        $laServicios=$lobjRol->consultar_servicios_menu($laModulos[$i][0]); 
        for ($j=0; $j <count($laServicios) ; $j++) //Se recorre un ciclo para poder extraer los datos de cada uno de los servicios que tiene asignado el modulo para poder constuir el menú
        {
            if($laServicios[$j][2]=='sistema/consultar_slider')
            {
                $consultar=true;
            }
            if($laServicios[$j][2]=='sistema/registrar_slider')
            {
                $registrar=true;
            }
            if($laServicios[$j][2]=='sistema/eliminar_slider')
            {
                $eliminar=true;
            }
        }
    }
?>
<script>
 function buscar(id)
 {
    window.location.href="?vista=sistema/consultar_slider&id="+id;
 }
  function eliminar(id)
  {
     if(confirm("¿Esta seguro que desea eliminar la slider seleccionada?"))
    {
      document.getElementById("cam_idslider").value=id;
      document.form_slider.submit();
    }
  }
  function restaurar(id)
  {
     if(confirm("¿Esta seguro que desea restaurar la slider seleccionada?"))
    {
      document.getElementById("cam_idslider").value=id;
      document.getElementById("cam_operacion").value='restaurar_slider';
      document.form_slider.submit();
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
    <h3>Slider</h3>
    <div class="alert alert-info">
        <ul>
            En este módulo podrás registrar, consultar, editar, desactivar y activar la imagen deslizante (slider) del home page o pagina de inicio.
        </ul>
    </div>
    <form action="../controlador/control_slider.php" method="POST" name="form_slider">
        <input type="hidden" value="eliminar_slider" name="operacion" id="cam_operacion" />
        <input type="hidden"  name="idslider" id="cam_idslider"/>
        <?php
        if($registrar)
        {
            echo '<a id="btn_registrar" class="btn btn-success" href="?vista=sistema/registrar_slider"><i class="icon-plus icon-white"></i> Registrar slider</a>';
        }
        ?>
        <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable dataTable" id="filtro">
            <thead>
                <th>Codigo</th><th>Titulo</th><th>Estatus</th><?php if($consultar || $eliminar)
                        { echo '<th>Acción</th>';}?>
            </thead>
            <tbody>
            <?php
                    require_once('../clases/clase_slider.php');
                    $lobjslider=new clsSlider;
                    $lasliders=$lobjslider->consultar_sliders();
                    for($i=0;$i<count($lasliders);$i++)
                    {
                         if($lasliders[$i][4])
                        {
                            $lasliders[$i][4]='Activo';
                        }
                        elseif(!$lasliders[$i][4]) 
                        {
                            $lasliders[$i][4]='Inactivo';
                        }

                        echo '<tr>';
                        echo '<td>'.$lasliders[$i][0].'</td>';
                        echo '<td>'.$lasliders[$i][1].'</td>';
                        echo '<td>'.$lasliders[$i][4].'</td>';
                        if($consultar || $eliminar)
                        {
                            echo '<td>';
                            if($consultar && $lasliders[$i][4]=='Activo')
                            {
                                echo '<a class="btn btn-info" href="#" title="Consultar" onclick="buscar('.$lasliders[$i][0].')"><i class="icon-search icon-white"></i></a> ';
                            }
                            if($eliminar)
                            {
                                if($lasliders[$i][4]=='Activo')
                                {
                                    echo '<a class="btn btn-danger" href="#" title="Eliminar" onclick="eliminar('.$lasliders[$i][0].')" ><i class="icon-remove icon-white"></i></a> ';
                                }
                                elseif ($lasliders[$i][4]=='Inactivo') 
                                {
                                    echo '<a class="btn btn-warning" title="Restaurar" href="#" onclick="restaurar('.$lasliders[$i][0].')" ><i class="icon-refresh icon-white"></i></a>';
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