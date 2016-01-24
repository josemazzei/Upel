<?php
$consultar= $registrar= $eliminar=false;
for($i=0;$i<count($laModulos);$i++) 
    {
         
        $laServicios=$lobjRol->consultar_servicios_menu($laModulos[$i][0]); 
        for ($j=0; $j <count($laServicios) ; $j++) //Se recorre un ciclo para poder extraer los datos de cada uno de los servicios que tiene asignado el modulo para poder constuir el menú
        {
            if($laServicios[$j][2]=='sistema/consultar_noticia')
            {
                $consultar=true;
            }
            if($laServicios[$j][2]=='sistema/registrar_noticia')
            {
                $registrar=true;
            }
            if($laServicios[$j][2]=='sistema/eliminar_noticia')
            {
                $eliminar=true;
            }
        }
    }
?>
<script>
 function buscar(id)
 {
    window.location.href="?vista=sistema/consultar_noticia&id="+id;
 }
  function eliminar(id)
  {
     if(confirm("¿Esta seguro que desea eliminar la noticia seleccionada?"))
    {
      document.getElementById("cam_idnoticia").value=id;
      document.form_noticia.submit();
    }
  }
  function restaurar(id)
  {
     if(confirm("¿Esta seguro que desea restaurar la noticia seleccionada?"))
    {
      document.getElementById("cam_idnoticia").value=id;
      document.getElementById("cam_operacion").value='restaurar_noticia';
      document.form_noticia.submit();
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
    <h3>Noticia</h3>
    <div class="alert alert-info">
        <ul>
            En este módulo podrás registrar, consultar, editar, desactivar y activar la noticia del home page o pagina de inicio.
        </ul>
    </div>
    <form action="../controlador/control_noticia.php" method="POST" name="form_noticia">
        <input type="hidden" value="eliminar_noticia" name="operacion" id="cam_operacion" />
        <input type="hidden"  name="idnoticia" id="cam_idnoticia"/>
        <?php
        if($registrar)
        {
            echo '<a id="btn_registrar" class="btn btn-success" href="?vista=sistema/registrar_noticia"><i class="icon-plus icon-white"></i> Registrar noticia</a>';
        }
        ?>
        <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable dataTable" id="filtro">
            <thead>
                <th>Codigo</th><th>Titulo</th><th>Fecha</th><th>Estatus</th><?php if($consultar || $eliminar)
                        { echo '<th>Acción</th>';}?>
            </thead>
            <tbody>
            <?php
                    require_once('../clases/clase_noticia.php');
                    $lobjNoticia=new clsNoticia;
                    $laNoticias=$lobjNoticia->consultar_noticias();
                    for($i=0;$i<count($laNoticias);$i++)
                    {
                         if($laNoticias[$i][5])
                        {
                            $laNoticias[$i][5]='Activo';
                        }
                        elseif(!$laNoticias[$i][5]) 
                        {
                            $laNoticias[$i][5]='Inactivo';
                        }

                        echo '<tr>';
                        echo '<td>'.$laNoticias[$i][0].'</td>';
                        echo '<td>'.$laNoticias[$i][1].'</td>';
                        echo '<td>'.$laNoticias[$i][4].'</td>';
                        echo '<td>'.$laNoticias[$i][5].'</td>';
                        if($consultar || $eliminar)
                        {
                            echo '<td>';
                            if($consultar && $laNoticias[$i][5]=='Activo')
                            {
                                echo '<a class="btn btn-info" href="#" title="Consultar" onclick="buscar('.$laNoticias[$i][0].')"><i class="icon-search icon-white"></i></a> ';
                            }
                            if($eliminar)
                            {
                                if($laNoticias[$i][5]=='Activo')
                                {
                                    echo '<a class="btn btn-danger" href="#" title="Eliminar" onclick="eliminar('.$laNoticias[$i][0].')" ><i class="icon-remove icon-white"></i></a> ';
                                }
                                elseif ($laNoticias[$i][5]=='Inactivo') 
                                {
                                    echo '<a class="btn btn-warning" title="Restaurar" href="#" onclick="restaurar('.$laNoticias[$i][0].')" ><i class="icon-refresh icon-white"></i></a>';
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