<?php
$consultar= $registrar= $eliminar=false;
for($i=0;$i<count($laModulos);$i++) 
    {
         
        $laServicios=$lobjRol->consultar_servicios_menu($laModulos[$i][0]); 
        for ($j=0; $j <count($laServicios) ; $j++) //Se recorre un ciclo para poder extraer los datos de cada uno de los servicios que tiene asignado el modulo para poder constuir el menú
        {
            if($laServicios[$j][2]=='archivo/consultar_asignatura')
            {
                $consultar=true;
            }
            if($laServicios[$j][2]=='archivo/registrar_asignatura')
            {
                $registrar=true;
            }
            if($laServicios[$j][2]=='archivo/eliminar_asignatura')
            {
                $eliminar=true;
            }
        }
    }
?>
<script>
 function buscar(id)
 {
    window.location.href="?vista=archivo/consultar_asignatura&id="+id;
 }
  function eliminar(id)
  {
      document.getElementById("cam_idasignatura").value=id;
  }

  function descativar()
  {
     if(confirm("¿Esta seguro que desea desactivar la asignatura seleccionada?"))
    {
      document.form_asignatura.submit();
    }
  }
  function restaurar(id)
  {
     if(confirm("¿Esta seguro que desea restaurar la asignatura seleccionada?"))
    {
      document.getElementById("cam_idasignatura").value=id;
      document.getElementById("cam_operacion").value='restaurar_asignatura';
      document.form_asignatura.submit();
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
    <h3>Asignatura</h3>
     <div class="alert alert-info">
        <ul>
            En este módulo podrá registrar, consultar, editar, desactivar y activar la asignatura con las unidades y los objetivos que serán inscrito en el curso.
        </ul>
    </div>
    <form action="../controlador/control_asignatura.php" method="POST" name="form_asignatura">
        <input type="hidden" value="eliminar_asignatura" name="operacion" id="cam_operacion"/>
        <input type="hidden"  name="idasignatura" id="cam_idasignatura"/>        
        <?php
        if($registrar)
        {
            echo '<a id="btn_registrar" class="btn btn-success" href="?vista=archivo/registrar_asignatura"><i class="icon-plus icon-white"></i> Registrar asignatura</a>';
        }
        ?>
        <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable dataTable" id="filtro">
            <thead>
                <th>Código</th><th>Nombre</th><th>Area de conocimiento</th><th>Estatus</th><?php if($consultar || $eliminar)
                        { echo '<th>Acción</th>';}?>
            </thead>
            <tbody>
            <?php
                    require_once('../clases/clase_asignatura.php');
                    $lobjAsignatura=new clsAsignatura;
                    $laAsignaturas=$lobjAsignatura->consultar_asignaturas_inactivas();
                    for($i=0;$i<count($laAsignaturas);$i++)
                    {
                        $dependencia=false;
                        $lobjAsignatura->set_Asignatura($laAsignaturas[$i][0]);
                        $dependencia=$lobjAsignatura->consultar_dependencia();
                        if($laAsignaturas[$i][3])
                        {
                            $laAsignaturas[$i][3]='Activo';
                        }
                        elseif(!$laAsignaturas[$i][3]) 
                        {
                            $laAsignaturas[$i][3]='Inactivo';
                        }
                        echo '<tr>';
                        echo '<td>'.$laAsignaturas[$i][0].'</td>';
                        echo '<td>'.$laAsignaturas[$i][1].'</td>';
                        echo '<td>'.$laAsignaturas[$i][6].'</td>';
                        echo '<td>'.$laAsignaturas[$i][3].'</td>';
                        if($consultar || $eliminar)
                        {
                            echo '<td>';
                            if($consultar && $laAsignaturas[$i][3]=='Activo')
                            {
                                echo '<a class="btn btn-info" href="#" title="Consultar" onclick="buscar('.$laAsignaturas[$i][0].')"><i class="icon-search icon-white"></i></a> ';
                            }
                            if($eliminar && $dependencia==false)
                            {
                                if($laAsignaturas[$i][3]=='Activo')
                                {
                                    echo '<a class="btn btn-danger" href="#" title="Desactivar" data-toggle="modal" data-target="#myModal" onclick="eliminar('.$laAsignaturas[$i][0].')" ><i class="icon-remove icon-white"></i></a> ';
                                }
                                elseif ($laAsignaturas[$i][3]=='Inactivo') 
                                {
                                    echo '<a class="btn btn-warning" title="Restaurar" href="#" onclick="restaurar('.$laAsignaturas[$i][0].')" ><i class="icon-refresh icon-white"></i></a>';
                                }
                            }
                            echo "</td>";
                        }
                       
                        echo '</tr>';
                    }
                ?>
                </tbody>
        </table>
        <!-- Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Descactivar asignatura</h4>
              </div>
              <div class="modal-body">
                   <div class="row">
                        <div class="col-lg-3 span3">
                            <label>Razón <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Razón por la cual desea desactivar la asignatura."><i class="fa fa-question" ></i></span></label>
                            <input type="text" class="span3"  name="razondesactiva" id="cam_razondesactiva" value=""/>
                        </div>
                   </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-danger" onclick="descativar()">Desactivar</button>
              </div>
            </div>
          </div>
      </div>
    </form>
</div>
<script>
    $('#myModal').on('shown.bs.modal', function () {
        $('#myInput').focus()
      })
</script>