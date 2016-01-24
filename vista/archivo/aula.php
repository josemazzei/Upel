<?php
$consultar= $registrar= $eliminar=false;
for($i=0;$i<count($laModulos);$i++) 
    {
         
        $laServicios=$lobjRol->consultar_servicios_menu($laModulos[$i][0]); 
        for ($j=0; $j <count($laServicios) ; $j++) //Se recorre un ciclo para poder extraer los datos de cada uno de los servicios que tiene asignado el modulo para poder constuir el menú
        {
            if($laServicios[$j][2]=='archivo/consultar_aula')
            {
                $consultar=true;
            }
            if($laServicios[$j][2]=='archivo/registrar_aula')
            {
                $registrar=true;
            }
            if($laServicios[$j][2]=='archivo/eliminar_aula')
            {
                $eliminar=true;
            }
        }
    }
?>
<script>
 function buscar(id)
 {
    window.location.href="?vista=archivo/consultar_aula&id="+id;
 }
  function eliminar(id)
  {
     if(confirm("¿Esta seguro que desea eliminar el aula seleccionada?"))
    {
      document.getElementById("cam_idaula").value=id;
      document.form_aula.submit();
    }
  }
  function restaurar(id)
  {
     if(confirm("¿Esta seguro que desea restaurar el aula seleccionada?"))
    {
      document.getElementById("cam_idaula").value=id;
      document.getElementById("cam_operacion").value='restaurar_aula';
      document.form_aula.submit();
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
    <h3>Aula</h3>
    <div class="alert alert-info">
        <ul>
            En este módulo podrá registrar, consultar, editar, desactivar y activar el aula donde se le dictará curso al participante.     
        </ul>
    </div>
    <form action="../controlador/control_aula.php" method="POST" name="form_aula">
        <input type="hidden" value="eliminar_aula" name="operacion" id="cam_operacion"/>
        <input type="hidden"  name="idaula" id="cam_idaula"/>
        <?php
        if($registrar)
        {
            echo '<a id="btn_registrar" class="btn btn-success" href="?vista=archivo/registrar_aula"><i class="icon-plus icon-white"></i> Registrar aula</a>';
        }
        ?>
        <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable dataTable" id="filtro">
            <thead>
                <th>Código</th><th>Nombre</th><th>Tipo</th><th>Capacidad</th><th>Estatus</th><?php if($consultar || $eliminar)
                        { echo '<th>Acción</th>';}?>
            </thead>
            <tbody>
            <?php
                    require_once('../clases/clase_aula.php');
                    $lobjaula=new clsAula;
                    $laAulas=$lobjaula->consultar_aulas_inactivas();
                    for($i=0;$i<count($laAulas);$i++)
                    {
                        $dependencia=false;
                        $lobjaula->set_Aula($laAulas[$i][0]);
                        $dependencia=$lobjaula->consultar_dependencia();
                        if($laAulas[$i][4])
                        {
                            $laAulas[$i][4]='Activo';
                        }
                        elseif(!$laAulas[$i][4]) 
                        {
                            $laAulas[$i][4]='Inactivo';
                        }
                        echo '<tr>';
                        echo '<td>'.$laAulas[$i][0].'</td>';
                        echo '<td>'.$laAulas[$i][1].'</td>';
                        echo '<td>'.$laAulas[$i][2].'</td>';
                        echo '<td>'.$laAulas[$i][3].'</td>';
                        echo '<td>'.$laAulas[$i][4].'</td>';
                        if($consultar || $eliminar)
                        {
                            echo '<td>';
                            if($consultar && $laAulas[$i][4]=='Activo')
                            {
                                echo '<a class="btn btn-info" href="#" title="Consultar" onclick="buscar('.$laAulas[$i][0].')"><i class="icon-search icon-white"></i></a> ';
                            }
                            if($eliminar && $dependencia==false)
                            {
                                if($laAulas[$i][4]=='Activo')
                                {
                                    echo '<a class="btn btn-danger" href="#" title="Desactivar" onclick="eliminar('.$laAulas[$i][0].')" ><i class="icon-remove icon-white"></i></a> ';
                                }
                                elseif ($laAulas[$i][4]=='Inactivo') 
                                {
                                    echo '<a class="btn btn-warning" title="Restaurar" href="#" onclick="restaurar('.$laAulas[$i][0].')" ><i class="icon-refresh icon-white"></i></a>';
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