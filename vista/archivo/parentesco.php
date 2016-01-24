<?php
$consultar= $registrar= $eliminar=false;
for($i=0;$i<count($laModulos);$i++) 
    {
         
        $laServicios=$lobjRol->consultar_servicios_menu($laModulos[$i][0]); 
        for ($j=0; $j <count($laServicios) ; $j++) //Se recorre un ciclo para poder extraer los datos de cada uno de los servicios que tiene asignado el modulo para poder constuir el menú
        {
            if($laServicios[$j][2]=='archivo/consultar_parentesco')
            {
                $consultar=true;
            }
            if($laServicios[$j][2]=='archivo/registrar_parentesco')
            {
                $registrar=true;
            }
            if($laServicios[$j][2]=='archivo/eliminar_parentesco')
            {
                $eliminar=true;
            }
        }
    }
?>
<script>
     function buscar(id)
     {
        window.location.href="?vista=archivo/consultar_parentesco&id="+id;
     }
  function eliminar(id)
  {
     if(confirm("¿Esta seguro que desea desactivar el parentesco seleccionado?"))
    {
      document.getElementById("cam_idparentesco").value=id;
      document.form_parentesco.submit();
    }
  }
   function restaurar(id)
  {
     if(confirm("¿Esta seguro que desea restaurar el parentesco seleccionado?"))
    {
      document.getElementById("cam_idparentesco").value=id;
      document.getElementById("cam_operacion").value='restaurar_parentesco';
      document.form_parentesco.submit();
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
    <h3>Parentesco</h3>
        <div class="alert alert-info">
        <ul>
            En este módulo podrá registrar, consultar, editar, desactivar y activar el parentesco del familiar hacia el participante.
        </ul>
    </div>
    <form action="../controlador/control_parentesco.php" method="POST" name="form_parentesco">
        <input type="hidden" value="eliminar_parentesco" name="operacion" id="cam_operacion"/>
        <input type="hidden"  name="idparentesco" id="cam_idparentesco"/>
        <?php
        if($registrar)
        {
            echo '<a id="btn_registrar" class="btn btn-success" href="?vista=archivo/registrar_parentesco"><i class="icon-plus icon-white"></i> Registrar parentesco</a>';
        }
        ?>
        <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable dataTable" id="filtro">
            <thead>
                <th>Código</th><th>Nombre</th><th>Estatus</th><?php if($consultar || $eliminar)
                        { echo '<th>Acción</th>';}?>
            </thead>
            <tbody>
            <?php
                    require_once('../clases/clase_Parentesco.php');
                    $lobjParentesco=new clsParentesco;
                    $laParentescos=$lobjParentesco->consultar_parentescos_inactivos();
                    for($i=0;$i<count($laParentescos);$i++)
                    {
                        $dependencia=false;
                        $lobjParentesco->set_Parentesco($laParentescos[$i][0]);
                        $dependencia=$lobjParentesco->consultar_dependencia();
                        echo '<tr>';
                        echo '<td>'.$laParentescos[$i][0].'</td>';
                        echo '<td>'.$laParentescos[$i][1].'</td>';
                        if($laParentescos[$i][2])
                        {
                            $laParentescos[$i][2]='Activo';
                        }
                        elseif(!$laParentescos[$i][2]) 
                        {
                            $laParentescos[$i][2]='Inactivo';
                        }
                        echo '<td>'.$laParentescos[$i][2].'</td>';
                         if($consultar || $eliminar)
                        {
                            echo '<td>';
                            if($consultar && $laParentescos[$i][2]=='Activo')
                            {
                                echo '<a class="btn btn-info" href="#" title="Consultar" onclick="buscar('.$laParentescos[$i][0].')"><i class="icon-search icon-white"></i></a> ';
                            }
                            if($eliminar && $dependencia==false)
                            {
                                if($laParentescos[$i][2]=='Activo')
                                {
                                    echo '<a class="btn btn-danger" href="#" title="Desactivar" onclick="eliminar('.$laParentescos[$i][0].')" ><i class="icon-remove icon-white"></i></a> ';
                                }
                                elseif ($laParentescos[$i][2]=='Inactivo') 
                                {
                                    echo '<a class="btn btn-warning" title="Restaurar" href="#" onclick="restaurar('.$laParentescos[$i][0].')" ><i class="icon-refresh icon-white"></i></a>';

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