
<script>
  function eliminar(id)
  {
     if(confirm("¿Esta seguro que desea quitar este servicio seleccionado?"))
    {
      document.getElementById("cam_idservicio").value=id;
      document.form_servicio.submit();
    }
  }
</script>    
<div style="float: left" class="col-lg-10 span10 pull-left">
    <h3>Asignación de módulos/servicios</h3>
    <form action="../controlador/control_servicio.php" method="POST" name="form_servicio">
        <input type="hidden" value="quitar_servicio" name="operacion" />
        <input type="hidden"  name="idservicio" id="cam_idservicio"/>

        <?php
            require_once('../clases/clase_rol.php');
            $lobjRol=new clsrol;
            $laroles=$lobjRol->consultar_roles();
            echo '<ul class="nav nav-tabs" id="myTab">';
            for($i=0;$i<count($laroles);$i++)
            {
                echo '<li '.$active.'><a href="#'.$laroles[$i][1].'">'.$laroles[$i][1].'</a></li>';
            }
            echo '</ul>';
            echo '<div class="tab-content">';                   
            for($i=0;$i<count($laroles);$i++)
            {
                echo '<div class="tab-pane" id="'.$laroles[$i][1].'">';
                    $lobjRol->set_Rol($laroles[$i][0]);
                    $laModulos=$lobjRol->consultar_modulos();
                    for($j=0;$j<count($laModulos);$j++)
                    {
                        echo '<div class="col-lg-4 span4 pull-left">';
                        echo '<h5>'.$laModulos[$j][1].'</h5>';
                            echo '<ul style="font-size: 15px;">';
                                $laServicios=$lobjRol->consultar_servicios($laModulos[$j][0]);
                                
                                for($k=0; $k <count($laServicios) ; $k++)
                                {
                                    echo '<li><a href="">'.$laServicios[$k][1].'</a></li>';
                                }
                                if($k==0)
                                    echo '<p class="text-danger">Este rol no tiene servicios registrados a este módulo.</p>';
                            echo '</ul>';
                        echo '</div>';
                    }
                echo '</div>';                
            }
                echo '</div>';
            ?>

        <script>                
            $('#myTab a').click(function (e) 
            {
                e.preventDefault()
                $(this).tab('show')
            })
            $(function () 
            {
                $('#myTab a:first').tab('show')
            })
        </script>
    </form>
    <div class="botonera">
        <a class="btn btn-success" href="?vista=seguridad/asignar_modulo"><i class="icon-plus icon-white"></i> Asignar módulos</a>
        <a class="btn btn-success" href="?vista=seguridad/asignar_servicio"><i class="icon-plus icon-white"></i> Asignar servicio</a>
    </div>

</div>