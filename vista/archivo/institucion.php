<?php
$consultar= $registrar= $eliminar=false;
for($i=0;$i<count($laModulos);$i++) 
    {
         
        $laServicios=$lobjRol->consultar_servicios_menu($laModulos[$i][0]); 
        for ($j=0; $j <count($laServicios) ; $j++) //Se recorre un ciclo para poder extraer los datos de cada uno de los servicios que tiene asignado el modulo para poder constuir el menú
        {
            if($laServicios[$j][2]=='archivo/consultar_institucion')
            {
                $consultar=true;
            }
            if($laServicios[$j][2]=='archivo/registrar_institucion')
            {
                $registrar=true;
            }
            if($laServicios[$j][2]=='archivo/eliminar_institucion')
            {
                $eliminar=true;
            }
        }
    }
?>
<script>
 function buscar(id)
 {
    window.location.href="?vista=archivo/registrar_institucion&id="+id;
 }
  function eliminar(id)
  {
     if(confirm("¿Esta seguro que desea desactivar la institución seleccionada?"))
    {
      document.getElementById("cam_idinstitucion").value=id;
      document.form_institucion.submit();
    }
  }
  function restaurar(id)
  {
     if(confirm("¿Esta seguro que desea restaurar el institución seleccionado?"))
    {
      document.getElementById("cam_idinstitucion").value=id;
      document.getElementById("cam_operacion").value='restaurar_institucion';
      document.form_institucion.submit();
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
    <h3>Institución</h3>
    <div class="alert alert-info">
        <ul>
            En este módulo podrá registrar, consultar, editar, desactivar y activar la institución en el sistema.
        </ul>
    </div>
    <form action="../controlador/control_institucion.php" method="POST" name="form_institucion">
        <input type="hidden" value="eliminar_institucion" name="operacion" id="cam_operacion" />
        <input type="hidden"  name="idinstitucion" id="cam_idinstitucion"/>
        <?php
        if($registrar)
        {
            echo '<a id="btn_registrar" class="btn btn-success" href="?vista=archivo/registrar_institucion"><i class="icon-plus icon-white"></i> Registrar institución</a>';
        }
        ?>
        <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable dataTable" id="filtro">
            <thead>
                <th>Código</th><th>Nombre</th><th>Director</th><th>Dirección</th><th>Estatus</th><?php if($consultar || $eliminar)
                        { echo '<th>Acción</th>';}?>
            </thead>
            <tbody>
            <?php
                    require_once('../clases/clase_institucion.php');
                    $lobjInstitucion=new clsInstitucion;
                    $laInstituciones=$lobjInstitucion->consultar_instituciones();
                    for($i=0;$i<count($laInstituciones);$i++)
                    {
                        $dependencia=false;
                        $lobjInstitucion->set_Institucion($laInstituciones[$i][0]);
                        $dependencia=$lobjInstitucion->consultar_dependencia();
                         if($laInstituciones[$i][4])
                        {
                            $laInstituciones[$i][4]='Activo';
                        }
                        elseif(!$laInstituciones[$i][4]) 
                        {
                            $laInstituciones[$i][4]='Inactivo';
                        }

                        echo '<tr>';
                        echo '<td>'.$laInstituciones[$i][0].'</td>';
                        echo '<td>'.$laInstituciones[$i][1].'</td>';
                        echo '<td>'.$laInstituciones[$i][3].'</td>';
                        echo '<td>'.$laInstituciones[$i][2].'</td>';
                        echo '<td>'.$laInstituciones[$i][4].'</td>';
                        if($consultar || $eliminar)
                        {
                            echo '<td>';
                            if($consultar && $laInstituciones[$i][4]=='Activo')
                            {
                                echo '<a class="btn btn-info" href="#" title="Consultar" onclick="buscar('.$laInstituciones[$i][0].')"><i class="icon-search icon-white"></i></a> ';
                            }
                            if($eliminar && $dependencia==false)
                            {
                                if($laInstituciones[$i][4]=='Activo')
                                {
                                    echo '<a class="btn btn-danger" href="#" title="Desactivar" onclick="eliminar('.$laInstituciones[$i][0].')" ><i class="icon-remove icon-white"></i></a> ';
                                }
                                elseif ($laInstituciones[$i][4]=='Inactivo') 
                                {
                                    echo '<a class="btn btn-warning" title="Restaurar" href="#" onclick="restaurar('.$laInstituciones[$i][0].')" ><i class="icon-refresh icon-white"></i></a>';
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