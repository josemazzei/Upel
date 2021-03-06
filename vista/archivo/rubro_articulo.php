<?php
$consultar= $registrar= $eliminar=false;
for($i=0;$i<count($laModulos);$i++) 
    {
         
        $laServicios=$lobjRol->consultar_servicios_menu($laModulos[$i][0]); 
        for ($j=0; $j <count($laServicios) ; $j++) //Se recorre un ciclo para poder extraer los datos de cada uno de los servicios que tiene asignado el modulo para poder constuir el menú
        {
            if($laServicios[$j][2]=='archivo/consultar_municipio')
            {
                $consultar=true;
            }
            if($laServicios[$j][2]=='archivo/registrar_municipio')
            {
                $registrar=true;
            }
            if($laServicios[$j][2]=='archivo/eliminar_municipio')
            {
                $eliminar=true;
            }
        }
    }
?>
<script>
 function buscar(id)
 {
    window.location.href="?vista=archivo/consultar_municipio&id="+id;
 }
  function eliminar(id)
  {
     if(confirm("¿Esta seguro que desea desactivar el municipio seleccionado?"))
    {
      document.getElementById("cam_idmunicipio").value=id;
      document.form_municipio.submit();
    }
  }
    function restaurar(id)
  {
     if(confirm("¿Esta seguro que desea restaurar el municipio seleccionado?"))
    {
      document.getElementById("cam_idmunicipio").value=id;
      document.getElementById("cam_operacion").value='restaurar_municipio';
      document.form_municipio.submit();
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
    <h3>Municipio</h3>
   <div class="alert alert-info">
        <ul>
            En este módulo podrá registrar, consultar, editar, desactivar y activar el municipio en el sistema.
        </ul>
    </div>
    <form action="../controlador/control_municipio.php" method="POST" name="form_municipio">
        <input type="hidden" value="eliminar_municipio" name="operacion" id="cam_operacion"/>
        <input type="hidden"  name="idmunicipio" id="cam_idmunicipio"/>
        <?php
        if($registrar)
        {
            echo '<a id="btn_registrar" class="btn btn-success" href="?vista=archivo/registrar_municipio"><i class="icon-plus icon-white"></i> Registrar municipio</a>';
        }
        ?>
        <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable dataTable" id="filtro">
            <thead>
                <th>Código</th><th>Nombre</th><th>Estatus</th><?php if($consultar || $eliminar)
                        { echo '<th>Acción</th>';}?>
            </thead>
            <tbody>
            <?php
                    require_once('../clases/clase_Municipio.php');
                    $lobjMunicipio=new clsMunicipio;
                    $lamunicipios=$lobjMunicipio->consultar_municipios_inactivos();
                    for($i=0;$i<count($lamunicipios);$i++)
                    {
                        $dependencia=false;
                        $lobjMunicipio->set_Municipio($lamunicipios[$i][0]);
                        $dependencia=$lobjMunicipio->consultar_dependencia();
                        if($lamunicipios[$i][2])
                        {
                            $lamunicipios[$i][2]='Activo';
                        }
                        elseif(!$lamunicipios[$i][2]) 
                        {
                            $lamunicipios[$i][2]='Inactivo';
                        }

                        echo '<tr>';
                        echo '<td>'.$lamunicipios[$i][0].'</td>';
                        echo '<td>'.$lamunicipios[$i][1].'</td>';
                        echo '<td>'.$lamunicipios[$i][2].'</td>';
                        if($consultar || $eliminar)
                        {
                            echo '<td>';
                            if($consultar && $lamunicipios[$i][2]=='Activo')
                            {
                                echo '<a class="btn btn-info" href="#" title="Consultar" onclick="buscar('.$lamunicipios[$i][0].')"><i class="icon-search icon-white"></i></a> ';
                            }
                            if($eliminar && $dependencia==false)
                            {
                                if($lamunicipios[$i][2]=='Activo')
                                {
                                    echo '<a class="btn btn-danger" href="#" title="Desactivar" onclick="eliminar('.$lamunicipios[$i][0].')" ><i class="icon-remove icon-white"></i></a> ';
                                    
                                }
                                elseif ($lamunicipios[$i][2]=='Inactivo') 
                                {
                                    echo '<a class="btn btn-warning" title="Restaurar" href="#" onclick="restaurar('.$lamunicipios[$i][0].')" ><i class="icon-refresh icon-white"></i></a>';
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