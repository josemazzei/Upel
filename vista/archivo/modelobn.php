<?php
$consultar= $registrar= $eliminar=false;
for($i=0;$i<count($laModulos);$i++) 
    {
         
        $laServicios=$lobjRol->consultar_servicios_menu($laModulos[$i][0]); 
        for ($j=0; $j <count($laServicios) ; $j++) //Se recorre un ciclo para poder extraer los datos de cada uno de los servicios que tiene asignado el modulo para poder constuir el menú
        {
            if($laServicios[$j][2]=='archivo/consultar_localidad')
            {
                $consultar=true;
            }
            if($laServicios[$j][2]=='archivo/registrar_localidad')
            {
                $registrar=true;
            }
            if($laServicios[$j][2]=='archivo/eliminar_localidad')
            {
                $eliminar=true;
            }
        }
    }
?>
<script>
 function buscar(id)
 {
    window.location.href="?vista=archivo/consultar_localidad&id="+id;
 }
  function eliminar(id)
  {
     if(confirm("¿Esta seguro que desea desactivar la Localidad seleccionada?"))
    {
      document.getElementById("cam_idlocalidad").value=id;
      document.form_localidad.submit();
    }
  }
function restaurar(id)
  {
     if(confirm("¿Esta seguro que desea restaurar el localidad seleccionado?"))
    {
      document.getElementById("cam_idlocalidad").value=id;
      document.getElementById("cam_operacion").value='restaurar_localidad';
      document.form_localidad.submit();
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
    <h3>Localidad</h3>
     <div class="alert alert-info">
            <ul>
                En este formulario podrá registrar, consultar, editar, desactivar y activar la localidad de los municipios.
            </ul>
        </div>
    <form action="../controlador/control_localidad.php" method="POST" name="form_localidad">
        <input type="hidden" value="eliminar_localidad" name="operacion" id="cam_operacion" />
        <input type="hidden"  name="idlocalidad" id="cam_idlocalidad"/>
        <?php
        if($registrar)
        {
            echo '<a id="btn_registrar" class="btn btn-success" href="?vista=archivo/registrar_localidad"><i class="icon-plus icon-white"></i> Registrar localidad</a>';
        }
        ?>
        <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable dataTable" id="filtro">
            <thead>
                <th>Código</th><th>Nombre</th><th>Municipio</th><th>Estatus</th><?php if($consultar || $eliminar)
                        { echo '<th>Acción</th>';}?>
            </thead>
            <tbody>
            <?php
                    require_once('../clases/clase_localidad.php');
                    $lobjLocalidad=new clsLocalidad;
                    $laLocalidades=$lobjLocalidad->consultar_localidades_inactivas();
                    for($i=0;$i<count($laLocalidades);$i++)
                    {
                        $dependencia=false;
                        $lobjLocalidad->set_Localidad($laLocalidades[$i][0]);
                        $dependencia=$lobjLocalidad->consultar_dependencia();
                        if($laLocalidades[$i][2])
                        {
                            $laLocalidades[$i][2]='Activo';
                        }
                        elseif(!$laLocalidades[$i][2]) 
                        {
                            $laLocalidades[$i][2]='Inactivo';
                        }

                        echo '<tr>';
                        echo '<td>'.$laLocalidades[$i][0].'</td>';
                        echo '<td>'.$laLocalidades[$i][1].'</td>';
                        echo '<td>'.$laLocalidades[$i][4].'</td>';
                        echo '<td>'.$laLocalidades[$i][2].'</td>';
                        if($consultar || $eliminar)
                        {
                            echo '<td>';
                            if($consultar && $laLocalidades[$i][2]=='Activo')
                            {
                                echo '<a class="btn btn-info" href="#" title="Consultar" onclick="buscar('.$laLocalidades[$i][0].')"><i class="icon-search icon-white"></i></a> ';
                            }
                            if($eliminar && $dependencia==false)
                            {
                                if($laLocalidades[$i][2]=='Activo')
                                {
                                    echo '<a class="btn btn-danger" href="#" title="Desactivar" onclick="eliminar('.$laLocalidades[$i][0].')" ><i class="icon-remove icon-white"></i></a> ';
                                }
                                elseif ($laLocalidades[$i][2]=='Inactivo') 
                                {
                                    echo '<a class="btn btn-warning" title="Restaurar" href="#" onclick="restaurar('.$laLocalidades[$i][0].')" ><i class="icon-refresh icon-white"></i></a>';
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