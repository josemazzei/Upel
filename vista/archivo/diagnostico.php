<?php
$consultar= $registrar= $eliminar=false;
for($i=0;$i<count($laModulos);$i++) 
    {
         
        $laServicios=$lobjRol->consultar_servicios_menu($laModulos[$i][0]); 
        for ($j=0; $j <count($laServicios) ; $j++) //Se recorre un ciclo para poder extraer los datos de cada uno de los servicios que tiene asignado el modulo para poder constuir el menú
        {
            if($laServicios[$j][2]=='archivo/consultar_diagnostico')
            {
                $consultar=true;
            }
            if($laServicios[$j][2]=='archivo/registrar_diagnostico')
            {
                $registrar=true;
            }
            if($laServicios[$j][2]=='archivo/eliminar_diagnostico')
            {
                $eliminar=true;
            }
        }
    }
?>
<script>
 function buscar(id)
 {
    window.location.href="?vista=archivo/consultar_diagnostico&id="+id;
 }
  function eliminar(id)
  {
     if(confirm("¿Esta seguro que desea desactivar la Condición visual seleccionado?"))
    {
      document.getElementById("cam_iddiagnostico").value=id;
      document.form_diagnostico.submit();
    }
  }
  function restaurar(id)
  {
     if(confirm("¿Esta seguro que desea restaurar la Condición visual seleccionado?"))
    {
      document.getElementById("cam_iddiagnostico").value=id;
      document.getElementById("cam_operacion").value='restaurar_diagnostico';
      document.form_diagnostico.submit();
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
    <h3>Condición visual</h3>
    <div class="alert alert-info">
        <ul>
            En este módulo podrá registrar, consultar, editar, desactivar y activar la condición visual del participante, docente y fammiliar.  
        </ul>
    </div>
    <form action="../controlador/control_diagnostico.php" method="POST" name="form_diagnostico">
        <input type="hidden" value="eliminar_diagnostico" name="operacion" id="cam_operacion"/>
        <input type="hidden"  name="iddiagnostico" id="cam_iddiagnostico"/>
        <?php
        if($registrar)
        {
            echo '<a id="btn_registrar" class="btn btn-success" href="?vista=archivo/registrar_diagnostico"><i class="icon-plus icon-white"></i> Registrar Condición visual</a>';
        }
        ?>
        <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable dataTable" id="filtro">
            <thead>
                <th>Código</th><th>Nombre</th><th>Estatus</th><?php if($consultar || $eliminar)
                        { echo '<th>Acción</th>';}?>
            </thead>
            <tbody>
            <?php
                    require_once('../clases/clase_diagnostico.php');
                    $lobjDiagnostico=new clsDiagnostico;
                    $laDiagnosticos=$lobjDiagnostico->consultar_diagnosticos_inactivos();
                    for($i=0;$i<count($laDiagnosticos);$i++)
                    {
                        $dependencia=false;
                        $lobjDiagnostico->set_Diagnostico($laDiagnosticos[$i][0]);
                        $dependencia=$lobjDiagnostico->consultar_dependencia();
                        if($laDiagnosticos[$i][2])
                        {
                            $laDiagnosticos[$i][2]='Activo';
                        }
                        elseif(!$laDiagnosticos[$i][2]) 
                        {
                            $laDiagnosticos[$i][2]='Inactivo';
                        }

                        echo '<tr>';
                        echo '<td>'.$laDiagnosticos[$i][0].'</td>';
                        echo '<td>'.$laDiagnosticos[$i][1].'</td>';
                        echo '<td>'.$laDiagnosticos[$i][2].'</td>';
                         if($consultar || $eliminar)
                        {
                            echo '<td>';
                            if($consultar && $laDiagnosticos[$i][2]=='Activo')
                            {
                                echo '<a class="btn btn-info" href="#" title="Consultar" onclick="buscar('.$laDiagnosticos[$i][0].')"><i class="icon-search icon-white"></i></a> ';
                            }
                            if($eliminar && $dependencia==false)
                            {
                                if($laDiagnosticos[$i][2]=='Activo')
                                {
                                    echo '<a class="btn btn-danger" href="#" title="Desactivar" onclick="eliminar('.$laDiagnosticos[$i][0].')" ><i class="icon-remove icon-white"></i></a> ';
                                }
                                elseif ($laDiagnosticos[$i][2]=='Inactivo')
                                {
                                    echo '<a class="btn btn-warning" title="Restaurar" href="#" onclick="restaurar('.$laDiagnosticos[$i][0].')" ><i class="icon-refresh icon-white"></i></a>';
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