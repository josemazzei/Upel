<?php
$consultar= $registrar= $eliminar=false;
for($i=0;$i<count($laModulos);$i++) 
    {
         
        $laServicios=$lobjRol->consultar_servicios_menu($laModulos[$i][0]); 
        for ($j=0; $j <count($laServicios) ; $j++) //Se recorre un ciclo para poder extraer los datos de cada uno de los servicios que tiene asignado el modulo para poder constuir el menú
        {
            if($laServicios[$j][2]=='persona/consultar_familiar')
            {
                $consultar=true;
            }
            if($laServicios[$j][2]=='persona/registrar_familiar')
            {
                $registrar=true;
            }
            if($laServicios[$j][2]=='persona/eliminar_familiar')
            {
                $eliminar=true;
            }
        }
    }
?>
<script>
 function buscar(id)
 {
    window.location.href="?vista=persona/consultar_familiar&id="+id;
 }
  function eliminar(id)
  {
      document.getElementById("cam_idfamiliar").value=id;
  }

  function descativar()
  {
     if(confirm("¿Esta seguro que desea desactivar el familiar seleccionado?"))
    {
      document.form_familiar.submit();
    }
  }
  function restaurar(id)
  {
     if(confirm("¿Esta seguro que desea restaurar el familiar seleccionado?"))
    {
      document.getElementById("cam_idfamiliar").value=id;
      document.getElementById("cam_operacion").value='restaurar_familiar';
      document.form_familiar.submit();
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
<div style="float: left" class="col-lg-11 span11 pull-left">
    <h3>Familiar</h3>
    <div class="alert alert-info">
        <ul>
            En este módulo podrá registrar, consultar, editar, desactivar y activar el familiar del participante.
        </ul>
    </div>
    <form action="../controlador/control_familiar.php" method="POST" name="form_familiar">
        <input type="hidden" value="eliminar_familiar" name="operacion" id="cam_operacion"/>
        <input type="hidden"  name="idfamiliar" id="cam_idfamiliar"/>
        <?php
        if($registrar)
        {
            echo '<a id="btn_registrar" class="btn btn-success" href="?vista=persona/registrar_familiar"><i class="icon-plus icon-white"></i> Registrar familiar</a>';
        }
        ?>
        <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable dataTable" id="filtro">
            <thead>
                <th>Cédula</th><th>Apellido Nombre</th><th>Dirección</th><th>Telefono</th><th>Estatus</th><?php if($consultar || $eliminar)
                        { echo '<th>Acción</th>';}?>
            </thead>
            <tbody>
            <?php
                    require_once('../clases/clase_familiar.php');
                    $lobjFamiliar=new clsFamiliar;
                    $lafamiliares=$lobjFamiliar->consultar_familiares_inactivos();
                    for($i=0;$i<count($lafamiliares);$i++)
                    {
                        if($lafamiliares[$i][11])
                        {
                            $lafamiliares[$i][11]='Activo';
                        }
                        elseif(!$lafamiliares[$i][11]) 
                        {
                            $lafamiliares[$i][11]='Inactivo';
                        }

                        echo '<tr>';
                        echo '<td>'.$lafamiliares[$i][0].'</td>';
                        echo '<td>'.$lafamiliares[$i][3].' '.$lafamiliares[$i][1].'</td>';
                        echo '<td>'.$lafamiliares[$i][7].'</td>';
                        echo '<td>'.$lafamiliares[$i][8].'</td>';
                        echo '<td>'.$lafamiliares[$i][11].'</td>';
                        if($consultar || $eliminar)
                        {
                            echo '<td>';
                            if($consultar && $lafamiliares[$i][11]=='Activo')
                            {
                                echo '<a class="btn btn-info" href="#" title="Consultar" onclick="buscar('.$lafamiliares[$i][0].')"><i class="icon-search icon-white"></i></a> ';
                            }
                            if($eliminar)
                            {
                                if($lafamiliares[$i][11]=='Activo')
                                {
                                    echo '<a class="btn btn-danger" href="#" title="Desactivar" data-toggle="modal" data-target="#myModal" onclick="eliminar('.$lafamiliares[$i][0].')" ><i class="icon-remove icon-white"></i></a> ';
                                }
                                elseif ($lafamiliares[$i][11]=='Inactivo') 
                                {
                                    echo '<a class="btn btn-warning" title="Restaurar" href="#" onclick="restaurar('.$lafamiliares[$i][0].')" ><i class="icon-refresh icon-white"></i></a>';
                                }
                            }
                            echo "</td>";
                        }

                        echo '</tr>';
                    }
                ?>
                </tbody>
        </table>
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Desactivar familiar</h4>
              </div>
              <div class="modal-body">
                   <div class="row">
                        <div class="col-lg-3 span3">
                            <label>Razón <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Razón por la cual desea desactivar a este familiar."><i class="fa fa-question" ></i></span></label>
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