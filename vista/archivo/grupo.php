<?php
$consultar= $registrar= $eliminar=false;
for($i=0;$i<count($laModulos);$i++) 
    {
         
        $laServicios=$lobjRol->consultar_servicios_menu($laModulos[$i][0]); 
        for ($j=0; $j <count($laServicios) ; $j++) //Se recorre un ciclo para poder extraer los datos de cada uno de los servicios que tiene asignado el modulo para poder constuir el menú
        {
            if($laServicios[$j][2]=='archivo/consultar_grupo')
            {
                $consultar=true;
            }
            if($laServicios[$j][2]=='archivo/registrar_grupo')
            {
                $registrar=true;
            }
            if($laServicios[$j][2]=='archivo/eliminar_grupo')
            {
                $eliminar=true;
            }
        }
    }
?>
<script>
 function buscar(id)
 {
    window.location.href="?vista=archivo/consultar_grupo&id="+id;
 }
  function eliminar(id)
  {
     if(confirm("¿Esta seguro que desea desactivar el grupo seleccionado?"))
    {
      document.getElementById("cam_idgrupo").value=id;
      document.form_grupo.submit();
    }
  }
  function restaurar(id)
  {
     if(confirm("¿Esta seguro que desea restaurar el grupo seleccionado?"))
    {
      document.getElementById("cam_idgrupo").value=id;
      document.getElementById("cam_operacion").value='restaurar_grupo';
      document.form_grupo.submit();
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
    <h3>Grupo</h3>
      <div class="alert alert-info">
        <ul>
           En este módulo podrá registrar, consultar, editar, desactivar y activar el grupo de edad que pertenecerá el participante.
        </ul>
    </div>
    <form action="../controlador/control_grupo.php" method="POST" name="form_grupo">
        <input type="hidden" value="eliminar_grupo" name="operacion" id="cam_operacion"/>
        <input type="hidden"  name="idgrupo" id="cam_idgrupo"/>
        <?php
        if($registrar)
        {
            echo '<a id="btn_registrar" class="btn btn-success" href="?vista=archivo/registrar_grupo"><i class="icon-plus icon-white"></i> Registrar Grupo</a>';
        }
        ?>
        <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable dataTable" id="filtro">
            <thead>
                <th>Nombre</th><th>Descripción</th><th>Edad mínima</th><th>Edad máxima</th><th>Estatus</th><?php if($consultar || $eliminar)
                        { echo '<th>Acción</th>';}?>
            </thead>
            <tbody>
            <?php
                    require_once('../clases/clase_grupo.php');
                    $lobjGrupo=new clsGrupo;
                    $laGrupos=$lobjGrupo->consultar_grupos_inactivo();
                    for($i=0;$i<count($laGrupos);$i++)
                    {
                        $dependencia=false;
                        $lobjGrupo->set_Idgrupo($laGrupos[$i][0]);
                        $dependencia=$lobjGrupo->consultar_dependencia();
                        if($laGrupos[$i][3])
                        {
                            $laGrupos[$i][3]='Activo';
                        }
                        elseif(!$laGrupos[$i][3]) 
                        {
                            $laGrupos[$i][3]='Inactivo';
                        }
                        echo '<tr>';
                        echo '<td>'.$laGrupos[$i][1].'</td>';
                        echo '<td>'.$laGrupos[$i][2].'</td>';
                        echo '<td>'.$laGrupos[$i][4].'</td>';
                        echo '<td>'.$laGrupos[$i][5].'</td>';
                        echo '<td>'.$laGrupos[$i][3].'</td>';
                        if($consultar || $eliminar)
                        {
                            echo '<td>';
                            if($consultar && $laGrupos[$i][3]=='Activo')
                            {
                                echo '<a class="btn btn-info" href="#" title="Consultar" onclick="buscar('.$laGrupos[$i][0].')"><i class="icon-search icon-white"></i></a> ';
                            }
                            if($eliminar && $dependencia==false)
                            {
                                if($laGrupos[$i][3]=='Activo')
                                {
                                    echo '<a class="btn btn-danger" href="#" title="Desactivar" onclick="eliminar('.$laGrupos[$i][0].')" ><i class="icon-remove icon-white"></i></a> ';
                                }
                                elseif ($laGrupos[$i][3]=='Inactivo') 
                                {
                                    echo '<a class="btn btn-warning" title="Restaurar" href="#" onclick="restaurar('.$laGrupos[$i][0].')" ><i class="icon-refresh icon-white"></i></a>';
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