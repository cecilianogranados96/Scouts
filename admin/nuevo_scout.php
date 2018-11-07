<?php 

include "header.php"; 

if (isset($_GET['nuevo'])){
    

$insertar_persona = "INSERT INTO `persona`(
`cedula`, `nombre`, `seccion`, `fecha_nacimiento`, `fecha_ingreso`, `nivel_educacion`, `distrito`, `direccion_exacta`, `genero`) 
VALUES (
    '".$_POST['cedula']."',
    '".$_POST['nombre']."',
    '".$_POST['seccion']."',
    '".$_POST['nacimiento']."',
    '".$_POST['ingreso']."',
    '".$_POST['nivel_educativo']."',
    '".$_POST['distrito']."',
    '".$_POST['direccion_exacta']."',
    '".$_POST['genero']."'
);";

 mysql_query($insertar_persona, $conexion) or die(mysql_error());
     
$insertar_formualario = "
INSERT INTO `formulario_medico`( cedula, `tipo_sangre`, `descripcion`) VALUES (
    '".$_POST['cedula']."',
    '".$_POST['sangre']."',
    '".$_POST['descripcion_enfermedad']."'
);
    ";


 mysql_query($insertar_formualario, $conexion) or die(mysql_error());
$id_form = mysql_insert_id();
         
         


if (isset($_POST['enfermedades'])){
    foreach ($_POST['enfermedades'] as $clave => $valor) {
        mysql_query( "INSERT INTO `enfermedad_x_fomulario`(`id_enfermedad`, `id_formulario`) VALUES ($valor,$id_form);", $conexion) or die(mysql_error()); 

    }
}

if (isset($_POST['alergias'])){
    foreach ($_POST['alergias'] as $clave => $valor) {
        mysql_query("INSERT INTO `alergia_x_formulario`(`id_alergia`, `id_formulario`) VALUES ($valor,$id_form);", $conexion) or die(mysql_error()); 

    }
}
    
    
    
if (isset($_POST['medicamento'])){
    foreach ($_POST['medicamento'] as $clave => $valor) {
        mysql_query("INSERT INTO `medicamento_x_formulario`(`id_medicamento`, `id_formulario`) VALUES ($valor,$id_form);", $conexion) or die(mysql_error()); 

    }
}



$encargados = "";
    foreach ($_POST['nombre_encargado'] as $clave => $valor) {
        
        $encargados  = "INSERT INTO `encargado`(`nombre`, `correo`, `telefono`, `scout`, `parentesco`, `cedula_persona`) VALUES (
        
        '".$_POST['nombre_encargado'][$clave]."',
        '".$_POST['email_encargado'][$clave]."',
        '".$_POST['telefono_encargado'][$clave]."',
        '".$_POST['scout_o_no'][$clave]."',
        '".$_POST['parentesco'][$clave]."',
        
        '".$_POST['cedula']."' 
        );";
        
    }
    
    
    
 mysql_query($encargados, $conexion) or die(mysql_error()); 

    echo "<script>alert('Insertado con exito!');</script>";    
}

?>

<head>
    <style>
        body {
            padding-top: 100px;

        }

    </style>
</head>
<center>
    <h1> Nuevo Scout</h1>
</center>


<div class="container">


    <div class="register-form">
        <form action="nuevo_scout.php?nuevo=1" method="post">

            <table class="table">
                <tr>
                    <td>
                        <center>
                            <h3>Informacion General</h3>
                        </center>
                        <br>

                        
                             <div class="form-group">
                            <label class="col-md-12 control-label" for="textinput">Cédula</label>
                            <div class="col-md-12">
                                <input id="textinput" name="cedula" type="text" placeholder="Cédula" class="form-control input-md">
                            </div>
                        </div>

                        
                        
                        <div class="form-group">
                            <label class="col-md-12 control-label" for="textinput">Nombre completo</label>
                            <div class="col-md-12">
                                <input id="textinput" name="nombre" type="text" placeholder="Nombre Completo" class="form-control input-md">
                            </div>
                        </div>



                   

                        <div class="form-group">
                            <label class="col-md-12 control-label" for="textinput">Seleccione un distrito</label>
                            <div class="col-md-12">



                                <select id="select-distrito" name="distrito" class="demo-default" class="form-control input-md" placeholder="Seleccione una distritro">
				
			<?php 
            $queEmp = "SELECT * FROM `distrito`";	
			$resEmp = mysql_query($queEmp, $conexion) or die(mysql_error());
            while ($rowEmp = mysql_fetch_assoc($resEmp)) {
                        echo "<option value='".$rowEmp['id_distrito']."' >".$rowEmp['nombre']." </option>";
                }
        ?> 
				
						</select>

                                <script>
                                    $('#select-distrito').selectize({
                                        maxItems: 1
                                    });

                                </script>





                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-12 control-label" for="textinput">Direccion Exacta</label>
                            <div class="col-md-12">
                                <textarea class="form-control input-md" name="direccion_exacta"></textarea>
                            </div>
                        </div>
                    </td>


                    <td>
                        <center>
                            <h3>Otros Datos</h3>
                        </center>
                        <br>
                        <div class="form-group">
                            <label class="col-md-12 control-label" for="textinput">Nivel Educativo:</label>
                            <div class="col-md-12">


                                <select class="form-control input-md" name="nivel_educativo">
                                     
                                             
     <?php 
            $queEmp = "SELECT * FROM `educacion`";	
			$resEmp = mysql_query($queEmp, $conexion) or die(mysql_error());
            while ($rowEmp = mysql_fetch_assoc($resEmp)) {
                        echo " <option value='".$rowEmp['id_educacion']."'>".$rowEmp['nombre']."</option>";
                }
        ?>                       

      </select>
                            </div>
                        </div>



                        <table class="table">
                            <tr>
                                <td>
                                    <div class="form-group">
                                        <label class="col-md-12 control-label" for="textinput">Seccion</label>
                                        <div class="col-md-12">
                                            <select class="form-control input-md" name="seccion">
                                              <option value="Manada">Manada</option>
                                              <option value="Tropa">Tropa</option>
                                              <option value="Wak">Wak</option>
                                              <option value="Comunidad">Comunidad</option>
                                          </select>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="form-group">
                                        <label class="col-md-12 control-label" for="textinput">Fecha de Ingreso</label>
                                        <div class="col-md-12">
                                            <input id="textinput" name="ingreso" type="date" value="<?php echo date("Y-m-d");?>" class="form-control input-md">
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <table class="table">
                            <tr>
                                <td>

                                    <div class="form-group">
                                        <label class="col-md-12 control-label" for="textinput">Fecha nacimiento</label>
                                        <div class="col-md-12">
                                            <input id="textinput" name="nacimiento" type="date" placeholder="Fecha de nacimiento" class="form-control input-md">
                                        </div>
                                    </div>
                                </td>
                                <td>

                                    <div class="form-group">
                                        <label class="col-md-12 control-label" for="textinput">Genero</label>
                                        <div class="col-md-12">
                                            <select class="form-control input-md" name="genero">
         <option value="1">Masculino</option>
         <option value="2">Femenino</option>
      </select>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </table>


                    </td>


                </tr>
                <tr>
                    <td colspan="3">
                        <center>
                            <h3>Datos Medicos</h3>
                        </center>
                        <br>

                        <table class="table">
                            <tr>
                                <td>
                                    <center>
                                        <h2>Enfermedades</h2>
                                    </center>


                                    <select id="select-enfermedad" name="enfermedades[]" multiple class="demo-default" style="width:70%" placeholder="Seleccione una enfermedad">
					
			<?php 
            $queEmp = "SELECT * FROM `enfermedad`";	
			$resEmp = mysql_query($queEmp, $conexion) or die(mysql_error());
            while ($rowEmp = mysql_fetch_assoc($resEmp)) {
                        echo "<option value='".$rowEmp['id_enfermedad']."' >".$rowEmp['nombre']." </option>";
                }
        ?> 
				
						</select>


                                    <script>
                                        $('#select-enfermedad').selectize({});

                                    </script>


                                </td>
                                <td>
                                    <center>
                                        <h2>Medicamentos</h2>
                                    </center>


                                    <select id="select-medicamento" name="medicamento[]" multiple class="demo-default" style="width:70%" placeholder="Seleccione un medicamento">
						
			<?php 
            $queEmp = "SELECT * FROM `medicamento`";	
			$resEmp = mysql_query($queEmp, $conexion) or die(mysql_error());
            while ($rowEmp = mysql_fetch_assoc($resEmp)) {
                        echo "<option value='".$rowEmp['id_medicamento']."' >".$rowEmp['nombre']." </option>";
                }
        ?> 
				
						</select>


                                    <script>
                                        $('#select-medicamento').selectize({});

                                    </script>



                                </td>
                                <td>
                                    <center>
                                        <h2>Alergias</h2>
                                    </center>



                                    <select id="select-alergia" name="alergias[]" multiple class="demo-default" style="width:70%" placeholder="Seleccione una alergia">
					
			<?php 
            $queEmp = "SELECT * FROM `alergia`";	
			$resEmp = mysql_query($queEmp, $conexion) or die(mysql_error());
            while ($rowEmp = mysql_fetch_assoc($resEmp)) {
                        echo "<option value='".$rowEmp['id_alergia']."' >".$rowEmp['nombre']." </option>";
                }
        ?> 
				
						</select>


                                    <script>
                                        $('#select-alergia').selectize({});

                                    </script>


                                </td>

                                <td>
                                    <center>
                                        <h2>Tipo de Sangre</h2>
                                    </center>

                                    <select class="form-control input-md" name="sangre" style="width:50%">
<option value="Ap">A+</option>
                  <option value="A-">A-</option>
                  <option value="B+">B+</option>
                  <option value="B-">B-</option>
                  <option value="O+">O+</option>
                  <option value="O-">O-</option>
                  <option value="AB+">AB+</option>
                  <option value="AB+">AB-</option>
      </select>

                                </td>




                            </tr>
                            
                            <tr>
                                <td colspan="4">
                                      <center>
                                        <h2>Descripcion</h2>
                                    </center>

                                      <textarea class="form-control input-md" name="descripcion_enfermedad"></textarea>
                                </td>
                            </tr>

                        </table>

                    </td>

                </tr>




                <tr>
                    <td colspan="3">


                        <center>
                            <h3>Padres o Encargados</h3>
                        </center>
                        <br>


                        <table class="table encargados" id="formulario">
                            <tr>
                                <td>Nombre</td>
                                <td>Parentesco</td>
                                <td>Scout</td>
                                <td>Telefono</td>
                                <td>Email</td>
                                <td>Nuevo</td>
                            </tr>
                            <tr>


                                <tr id="clonedInput1" class="clonedInput">
                                    <td>
                                        <input id="nombre" name="nombre_encargado[]" type="text" placeholder="Nombre del Campo" class="form-control input-md" required/>
                                    </td>
                                    <td>
                                        <select id="tipo1" name="parentesco[]" class="tipo form-control input-md" required>
                                            <option value="">Seleccionar</option>
                                            <option value="Padre">Padre</option>
                                            <option value="Madre">Madre</option>
                                            <option value="Abuel@">Abuel@</option>
                                            <option value="Ti@">Ti@</option>
                                            <option value="Otro">Otro</option>
                                        </select>
                                    </td>


                                    <td>
                                        <select id="requerido1" name="scout_o_no[]" class="form-control input-md">
                           <option value="1">Sí</option>
                           <option value="2">No</option>
                        </select>
                                    </td>
                                    <td>
                                        <input id="textinput" name="telefono_encargado[]" type="text" placeholder="Teléfono" class="form-control input-md">
                                    </td>
                                    <td>
                                        <input id="textinput" name="email_encargado[]" type="text" placeholder="Email" class="form-control input-md">
                                    </td>
                                    <td>
                                        <button type="button" class="clone btn btn-success">Nuevo Familiar</button>
                                    </td>

                                </tr>




                        </table>



                    </td>


                    </tr>





            </table>

            <center>
                <input type="submit" value="Registrar" class="btn btn-success">
            </center>






        </form>


        <script type="text/javascript">
            $(window).load(function() {
                var regex = /^(.+?)(\d+)$/i;
                var cloneIndex = $(".clonedInput").length + 1;

                function clone() {
                    $(this).parents(".clonedInput").clone()
                        .appendTo("table .encargados")
                        .attr("id", "clonedInput" + cloneIndex)
                        .find("*")
                        .each(function() {
                            var id = this.id || "";
                            var match = id.match(regex) || [];
                            if (match.length == 3) {
                                this.id = match[1] + (cloneIndex);
                            }
                        })
                        .on('click', 'button.clone', clone);
                    cloneIndex++;
                }

                function remove() {
                    $(this).parents(".clonedInput").remove();
                }
                $("button.clone").on("click", clone);
            });

        </script>



    </div>
    <br>
    <?php include "fotter.php"; ?>
