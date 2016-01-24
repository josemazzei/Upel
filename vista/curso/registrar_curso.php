<?php
/*
if($_POST)
{
    $idlapso        =(isset($_POST['idlapso']))?$_POST['idlapso']:"";
    $idgrupo        =(isset($_POST['idgrupo']))?$_POST['idgrupo']:"";
    $cantidad_cursos=(isset($_POST['cantidad_cursos']))?$_POST['cantidad_cursos']:1;
    $ocultar='hide';
    $ocultar2='show';
}
else
{
    $ocultar  ='';
    $ocultar2  ='hide';
}*/
?>

<div style="float: left" class="col-lg-8 span8 pull-left hide">
    <h3>Planificar curso</h3>
    <form class="formulario" action="?vista=curso/registrar_curso" method="POST" >
        <input type="hidden" value="<?php print($operacion);?>" name="operacion" />
        
        <div class="row-fluid">
            <div class="col-lg-4 span4">
                <label>Grupo </label>
            </div>
             <div class="col-lg-4 span4">
                <label>Cantidad de cursos</label>
            </div>
            <div class="col-lg-4 span4">
                <label>Cantidad de aspirantes</label>
            </div>
        </div>
          
        <div class="row-fluid">
            <div class="col-lg-4 span4">
                    
            </div>
             <div class="col-lg-5 span4">
                <input type="text" class="span3"  name="cantidad_cursos[]" id="cam_cantidad_cursos" required value="0"/>
            </div>
            <div class="col-lg-5 span4">
                <input type="text" class="span3"  name="cantidad_aspirantes[]" id="cam_cantidad_aspirantes" required value="" placeholder="<?php print($Cantidad_Aspirantes[3]); ?>" readOnly/>
            </div>

        </div>
        <div class="botonera">
            <input type="submit" class="btn btn-success" name="btn_enviar" id="btn_enviar" value="Aceptar">
            <input type="button" class="btn btn-danger" name="btn_regresar" id="btn_regresar" value="Regresar" onclick="window.location.href='?vista=curso/registrar_curso'">
        </div>
    </form>
</div>

<div style="float: left; border:none;" class="col-lg-8 span8 pull-left show">
    <h3>Planificar curso</h3>
      <div class="alert alert-info">
        <ul>
            <li>En este formulario podrá planificar el curso a dictar.</li>
            <li>Sí necesitas ayuda para usar este formulario haz clic en el botón <button class="btn btn-warning" type="button" onclick="javascript:introJs().start();"><i class="fa fa-question-circle"></i> Ayuda</button>.</li>
        </ul>
    </div>
        </ul>
    </div>
    <form style="border:none;" class="formulario" action="../controlador/control_curso.php" method="POST" name="form_curso">
        <input type="hidden" value="registrar_curso" name="operacion" />
        <input type="hidden" id="cam_contador" value="1" name="contador" />
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label>Seleccione un lapso <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Lapso activo en el cual se planificará los cursos."><i class="fa fa-question" ></i></span></label>
                <select name="idlapso" id="cam_idlapso" class="span12" required>
                    <?php
                        $contador=0;

                        require_once('../clases/clase_lapso.php');
                        $ObjLapso = new clsLapso();
                        $Lista_Lapsos= $ObjLapso->consultar_lapsos_activo();
                        if($Lista_Lapsos)
                        {
                            for($i=0;$i<count($Lista_Lapsos);$i++)
                            {
                                print('<option value="'.$Lista_Lapsos[$i][0].'">'.$Lista_Lapsos[$i][1].'</option>');
                            }
                        }
                        else
                        {
                                print('<option value="">No existen lapsos aperturados, debe aperturar un lapso.</option>');
                        }                       
                    ?>
                </select>
            </div>
        </div>
        <?php
            require_once('../libreria/utilidades.php');
            require_once('../clases/clase_asignatura.php');
            require_once('../clases/clase_aula.php');
            require_once('../clases/clase_grupo.php');
            require_once('../clases/clase_docente.php');
            $ObjUtil = new clsUtil();
            $lobjAsignatura = new clsAsignatura;
            $ObjGrupo = new clsGrupo();
            $lobjAula = new clsAula;
            $lobjDocente = new clsDocente;
            $laAsignaturas = $lobjAsignatura->consultar_asignaturas();
            $laAulas = $lobjAula->consultar_aulas();
            $Lista_Grupos= $ObjGrupo->consultar_grupos();
            $laDocentes= $lobjDocente->consultar_docentes();
        ?>
        <label>Aspirantes por grupo <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Cantidad de posibles aspirantes por cada grupo."><i class="fa fa-question" ></i></span></label>
        <table class="table table-striped table-hover table-bordered">
            <thead>
                <?php
                    for($i=0;$i<count($Lista_Grupos);$i++)
                    {
                        echo '<th>'.$Lista_Grupos[$i][1].'</th>';
                       
                    }
                ?>
            </thead>
            <tbody>
                <tr>
                    <?php
                    for($i=0;$i<count($Lista_Grupos);$i++)
                    {
                        $ObjGrupo->set_Idgrupo($Lista_Grupos[$i][0]);
                        $Cantidad_Aspirantes = $ObjGrupo->consultar_aspirantes();
                        echo '<td style="text-align:center">'.$Cantidad_Aspirantes[3].'</td>';
                    }
                ?>
                </tr>
            </tbody>
        <table class="table table-striped table-hover table-bordered">
            <thead>
                <th>Grupo <span class="label label-warning" style="width:10px; display:inline;;color:#fff" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Grupo al cual se planificará el curso."><i class="fa fa-question" ></i></span></th>
                <th>Asignatura <span class="label label-warning" style="width:10px; display:inline;;color:#fff" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Asignatura que se planificará el curso."><i class="fa fa-question" ></i></span></th>
                <th>Nombre <span class="label label-warning" style="width:10px; display:inline;;color:#fff" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Nombre del curso a planificarar."><i class="fa fa-question" ></i></span></th>
                <th>Docente <span class="label label-warning" style="width:10px; display:inline;color:#fff" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Docente que se asignará el curso."><i class="fa fa-question" ></i></span></th>
                <th>Aula <span class="label label-warning" style="width:10px; display:inline;;color:#fff" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Aula en la cual asignará el curso."><i class="fa fa-question" ></i></span></th>
                <th>Cap. <span class="label label-warning" style="width:10px; display:inline;;color:#fff" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Cantidad de participantes que soportará el curso."><i class="fa fa-question" ></i></span></th>
                <th>Operación </th>
            </thead>
            <tbody id="filas">
                <tr>
                    <td>

                        <select class="span2" id="grupos_0" name="grupos[]"  required onchange="concatenar(this)" >
                            <option value="">Seleccione un grupo.</option>
                            <?php
                                for($i=0;$i<count($Lista_Grupos);$i++)
                                {
                                 ?>
                                    <option id="<?php print($Lista_Grupos[$i][1]);?>" value="<?php print($Lista_Grupos[$i][0]);?>"><?php print($Lista_Grupos[$i][1]);?></option>
                                 <?php
                                }
                            ?>
                        </select>
                    </td>
                    <td>
                        <select class="span2" id="asignatura_curso_0" required name="asignatura_curso[]"  onchange="concatenar(this)" >
                            <option value="">Seleccione una asignatura.</option>
                           <?php
                            $tmpvar='';
                            for($k=0;$k<count($laAsignaturas);$k++)
                            {
                                if($laAsignaturas[$k][4]!=$tmpvar)
                                {
                                    if($tmpvar)
                                    {
                                        print('</optgroup>');
                                    }
                                    $tmpvar=$laAsignaturas[$k][4];
                                    print('<optgroup label="'.$laAsignaturas[$k][4].'">');
                                }//Fin IF
                                ?><option value="<?php print($laAsignaturas[$k][0])?>" id="<?php print($laAsignaturas[$k][1])?>" ><?php print($laAsignaturas[$k][1])?></option>
                            <?php 
                            } //Fin For?>
                        </select> 
                    </td>
                    <td>
                        <input class="form-control span2 " type="text" name="nombre_curso[]" required />
                    </td>
                    <td>
                        <select class="span2" id="docente_curso_0" name="docente_curso[]" required>
                            <option value="">Seleccione un Docente.</option>
                           <?php
                            $tmpvar='';
                            for($a=0;$a<count($laDocentes);$a++)
                            {
                                ?><option value="<?php print($laDocentes[$a][0])?>" id="<?php print($laDocentes[$a][3])?>" ><?php print($laDocentes[$a][0].' - '.$laDocentes[$a][1].'  '.$laDocentes[$a][3])?></option>
                            <?php 
                            } //Fin For?>
                        </select> 
                    </td>
                    <td>
                        <select class="span1" id="aula_curso_0" name="aula_curso[]" onchange="cargar_capacidad(this)" required>
                            <option value="">Seleccione un aula.</option>
                           <?php
                            $tmpvar='';
                            for($a=0;$a<count($laAulas);$a++)
                            {
                                ?><option value="<?php print($laAulas[$a][0])?>" id="<?php print($laAulas[$a][3])?>" ><?php print($laAulas[$a][1])?></option>
                            <?php 
                            } //Fin For?>
                        </select> 
                    </td>
                    <td><input type="text" class="span1" id="capacidad_curso_0" name="capacidad_curso[]" required value="" placeholder="Capacidad" onkeypress="return SoloNumeros(event)"/></td>
                    <td>
                        <button type="button" class="btn-mini btn-success" id="btn_sumar" onclick="agregar()" ><i class="icon-plus"></i></button>
                    </td>
                </tr>
            </tbody>
        </table>
        <div class="botonera">
            <input type="submit" class="btn btn-success" name="btn_enviar" id="btn_enviar" onclick="return validar();" value="Aceptar">
            <input type="button" class="btn btn-danger" name="btn_regresar" id="btn_regresar" value="Regresar" onclick="window.location.href='intranet.php';">
        </div>
    </form>
</div>

<script type="text/javascript">
    function concatenar(valor)
    {
        id=valor.id;
        nombre_curso = document.getElementsByName('nombre_curso[]');
        nombre_asignatura = document.getElementsByName('asignatura_curso[]');
        nombre_grupos = document.getElementsByName('grupos[]');
        contador = document.form_curso.contador;
        for(i=0;i<contador.value;i++)
        {
            x=nombre_asignatura[i].selectedIndex;
            x2=nombre_grupos[i].selectedIndex;

            asignatura = nombre_asignatura[i].options[x].id;
            grupo = nombre_grupos[i].options[x2].id;

            if((nombre_asignatura[i].id==id) || (nombre_grupos[i].id==id))
            {
                 nombre_curso[i].value = grupo+' - '+asignatura;
            }
            else
            {
                nombre_curso[i].value=nombre_curso[i].value;
            }
        }
    }
    function validar()
    {
        nombre_curso = document.getElementsByName('nombre_curso[]');
        nombre_asignatura = document.getElementsByName('asignatura_curso[]');
        nombre_grupos = document.getElementsByName('grupos[]');
        aulas = document.getElementsByName('aula_curso[]');
        docentes = document.getElementsByName('docente_curso[]');
        capacidades = document.getElementsByName('capacidad_curso[]');

        for(i=0;i<nombre_curso.length;i++)
        {

            if((capacidades[i].value==" ") || (aulas[i].value==" ") || (nombre_grupos[i].value==" ") || (nombre_asignatura[i].value==" ") || (nombre_curso[i].value==" ") || (docentes[i].value==" "))
            {
                alert('Debe ingresar cada uno de los campos.');
                return false;
            }
            else if(parseInt(capacidades[i].value)=="0")
            {
                alert('Debe ingresar una capacidad mayor a 0.');
                capacidades[i].focus();
                return false;
            }
            cont=1;
            for(j=0;j<nombre_curso.length;j++)
            {
                if(nombre_curso[i].value==nombre_curso[j].value && nombre_curso[i].id!=nombre_curso[j].id)
                {
                    cont++;
                    nombre_curso[j].value=nombre_curso[j].value+"-"+cont;
                }
                if(cont>=2)
                {
                    nombre_curso[i].value=nombre_curso[i].value+"-1";
                }
            }
        }
        
    }
    function validar_capacidad(parametro)
    {
        id = parametro.id;
        aulas = document.getElementsByName('aula_curso[]');
        capacidades = document.getElementsByName('capacidad_curso[]');
        for(i=0;i<aulas.length;i++)
        {
            x=aulas[i].selectedIndex;
            capacidad_aula = aulas[i].options[x].id;

            capacidad_escrita = parseInt(capacidades[i].value);
            if((aulas[i].id==id) || (capacidades[i].id==id))
            {
                if(capacidad_aula)
                {
                        if(capacidad_escrita>capacidad_aula)
                        {
                            alert('No puede ingresar una cantidad mayor a la permitida para esta aula: '+capacidad_aula);
                            capacidades[i].value=capacidad_aula;
                        }
                    
                }
                else
                {
                    alert('Debe seleccionar primero el aula en la cual se dictará este curso.');
                    capacidades[i].value='';
                }
            }

        }   
    }

    function cargar_capacidad(e)
    {
        id = e.id;
        i=id.substring(id.length-1,id.length);
        capacidad_curso=document.getElementById("capacidad_curso_"+i);

        x=e.selectedIndex;
        capacidad_aula = e.options[x].id;
        capacidad_curso.value=capacidad_aula;
    }
    function agregar()    
   {     

    var grupos = document.getElementById("grupos_0");
    var cursos = document.getElementById("asignatura_curso_0");
    var aulas = document.getElementById("aula_curso_0");
    var docentes = document.getElementById("docente_curso_0");

    var cam_contador = document.getElementById("cam_contador");
      contador=parseInt(cam_contador.value)+1;

      var filas = document.getElementById("filas");
      var nueva_fila =document.createElement("tr");
      var grupos_select = grupos.cloneNode(true);
      var cursos_select = cursos.cloneNode(true);
      var aulas_select = aulas.cloneNode(true);
      var docentes_select = docentes.cloneNode(true);
      var columna0 =document.createElement("td");
      var columna1 =document.createElement("td");
      var columna2 =document.createElement("td");
      var columna3 =document.createElement("td");
      var columna4 =document.createElement("td");
      var columna5 =document.createElement("td");
      var columna6 =document.createElement("td");
      nueva_fila.setAttribute("id", "filas");
      grupos_select.setAttribute("id", "cam_idgrupo_"+contador+"");
      cursos_select.setAttribute("id", "cam_idcursos_"+contador+"");
      aulas_select.setAttribute("id", "cam_idaulas_"+contador+"");
      aulas_select.setAttribute("class", "span1");
      docentes_select.setAttribute("id", "cam_iddocentes_"+contador+"");
        columna0.appendChild(grupos_select);
        columna1.appendChild(cursos_select);
        columna3.appendChild(docentes_select);
        columna4.appendChild(aulas_select);

      columna2.innerHTML='<input class="span2" type="text" name="nombre_curso[]" id="nombre_curso_'+contador+'"  />';

      columna5.innerHTML='<input type="text" class="span1" id="capacidad_curso_'+contador+'" onkeypress="return SoloNumeros(event)" name="capacidad_curso[]" required value="" placeholder="Capacidad" onchange="validar_capacidad(this)"/>';
      columna6.innerHTML='<button type="button" class="btn-mini btn-danger" onclick="quitar(this)"><i class="icon-remove"></i></button>';

      nueva_fila.appendChild(columna0);
      nueva_fila.appendChild(columna1);
      nueva_fila.appendChild(columna2);
      nueva_fila.appendChild(columna3);
      nueva_fila.appendChild(columna4);
      nueva_fila.appendChild(columna5);
      nueva_fila.appendChild(columna6);
      filas.appendChild(nueva_fila);
      cam_contador.value=contador;
   }
   function quitar(e)
     {
        var filas = document.getElementById("filas");          
        var td = e.parentNode;
        var tr = td.parentNode;
        filas.removeChild(tr);
     }

     function SoloNumeros(e)
    {
        var tecla = (document.all) ? e.keyCode : e.which;
        if((tecla==8)||(tecla==0))return true;
        patron = /[1234567890]/;
        te = String.fromCharCode(tecla);
        return patron.test(te);
    }
</script>