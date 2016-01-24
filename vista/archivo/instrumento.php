<?php
$consultar= $registrar= $eliminar=false;
for($i=0;$i<count($laModulos);$i++) 
    {
         
        $laServicios=$lobjRol->consultar_servicios_menu($laModulos[$i][0]); 
        for ($j=0; $j <count($laServicios) ; $j++) //Se recorre un ciclo para poder extraer los datos de cada uno de los servicios que tiene asignado el modulo para poder constuir el menú
        {
            if($laServicios[$j][2]=='archivo/consultar_instrumento')
            {
                $consultar=true;
            }
            if($laServicios[$j][2]=='archivo/registrar_instrumento')
            {
                $registrar=true;
            }
            if($laServicios[$j][2]=='archivo/eliminar_instrumento')
            {
                $eliminar=true;
            }
        }
    }
?>
<script>
 function buscar(id)
 {
    window.location.href="?vista=archivo/consultar_instrumento&id="+id;
 }
    function eliminar(id)
  {
      document.getElementById("cam_idinstrumento").value=id;
  }

  function descativar()
  {
     if(confirm("¿Esta seguro que desea desactivar la Instrumento seleccionada?"))
    {
      document.form_instrumento.submit();
    }
  }
  function restaurar(id)
  {
     if(confirm("¿Esta seguro que desea restaurar el instrumento seleccionado?"))
    {
      document.getElementById("cam_idinstrumento").value=id;
      document.getElementById("cam_operacion").value='restaurar_instrumento';
      document.form_instrumento.submit();
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
    <h3>Instrumento</h3>
    <div class="alert alert-info">
        <ul>
            En este módulo podrá registrar, consultar, editar, desactivar y activar el instrumento que será aplicado en la evaluación.
        </ul>
    </div>
    <form action="../controlador/control_instrumento.php" method="POST" name="form_instrumento">
        <input type="hidden" value="eliminar_instrumento" name="operacion" id="cam_operacion"/>
        <input type="hidden"  name="idinstrumento" id="cam_idinstrumento"/>        
        <?php
        if($registrar)
        {
            echo '<a id="btn_registrar" class="btn btn-success" href="?vista=archivo/registrar_instrumento"><i class="icon-plus icon-white"></i> Registrar instrumento</a>';
        }
        ?>
        <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable dataTable" id="filtro">
            <thead>
                <th>Código</th><th>Nombre</th><th>Asignatura</th><th>Estatus</th><?php if($consultar || $eliminar)
                        { echo '<th>Acción</th>';}?>
            </thead>
            <tbody>
            <?php
                    require_once('../clases/clase_instrumento.php');
                    $lobjInstrumento=new clsInstrumento;
                    $laInstrumentos=$lobjInstrumento->consultar_instrumentos_inactivas();
                    for($i=0;$i<count($laInstrumentos);$i++)
                    {
                        $dependencia=false;
                        $lobjInstrumento->set_Instrumento($laInstrumentos[$i][0]);
                        $dependencia=$lobjInstrumento->consultar_dependencia();
                        if($laInstrumentos[$i][3])
                        {
                            $laInstrumentos[$i][3]='Activo';
                        }
                        elseif(!$laInstrumentos[$i][3]) 
                        {
                            $laInstrumentos[$i][3]='Inactivo';
                        }
                        echo '<tr>';
                        echo '<td>'.$laInstrumentos[$i][0].'</td>';
                        echo '<td>'.$laInstrumentos[$i][1].'</td>';
                        echo '<td>'.$laInstrumentos[$i][2].'</td>';
                        echo '<td>'.$laInstrumentos[$i][3].'</td>';
                        if($consultar || $eliminar)
                        {
                            echo '<td>';
                            if($consultar && $laInstrumentos[$i][3]=='Activo')
                            {
                                echo '<a class="btn btn-info" href="#" title="Consultar" onclick="buscar('.$laInstrumentos[$i][0].')"><i class="icon-search icon-white"></i></a> ';
                            }
                            if($eliminar && $dependencia==false)
                            {
                                if($laInstrumentos[$i][3]=='Activo')
                                {
                                    echo '<a class="btn btn-danger" href="#" title="Desactivar" data-toggle="modal" data-target="#myModal" onclick="eliminar('.$laInstrumentos[$i][0].')" ><i class="icon-remove icon-white"></i></a> ';
                                }
                                elseif ($laInstrumentos[$i][3]=='Inactivo') 
                                {
                                    echo '<a class="btn btn-warning" title="Restaurar" href="#" onclick="restaurar('.$laInstrumentos[$i][0].')" ><i class="icon-refresh icon-white"></i></a>';
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
                <h4 class="modal-title" id="myModalLabel">Descactivar instrumento</h4>
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