<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Guias Scouts - Registro de Reclutas</title>
    <!-- Bootstrap core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">      
  </head>
  <body onload="window.print();">
    <?php 
        include '../config.php'; 
        $queEmp = "SELECT * FROM `persona` where cedula = ".$_GET['ced']."";	
        $resEmp = mysql_query($queEmp, $conexion) or die(mysql_error());
        $persona = mysql_fetch_assoc($resEmp);
    ?>
<center>
    <h1>Historial Médico</h1>
</center>
<div class="container">
    <div class="register-form">
        <form action="nuevo_scout.php?nuevo=1" method="post">

            <table class="table">
                <tr>
                    <td>
                        <center>
                            <h3><i>Informacion General</i></h3>
                        </center>
                        <br>

                        
                             <div class="form-group">
                            <label class="col-md-12 control-label" for="textinput">Cédula</label>
                            <div class="col-md-12">
                                <center><b><h2><?php echo $persona['cedula']; ?></h2></b></center>
                            </div>
                        </div>

                        
                        
                        <div class="form-group">
                            <label class="col-md-12 control-label" for="textinput">Nombre completo</label>
                            <div class="col-md-12">
                               <center><b><h2><?php echo $persona['nombre']; ?></h2></b></center>
                            </div>
                        </div>



                   

                        <div class="form-group">
                            <label class="col-md-12 control-label" for="textinput">Seleccione un distrito</label>
                            <div class="col-md-12">
                                    
        <?php 
            $queEmp = "SELECT CONCAT(provincia.nombre,' -> ',canton.nombre, ' -> ',distrito.nombre) as distrito  from canton,distrito,provincia WHERE canton.id_provincia = provincia.id_provincia and distrito.id_canton = canton.id_canton and distrito.id_distrito = ".$persona['distrito']."";
			$resEmp = mysql_query($queEmp, $conexion) or die(mysql_error());
            $rowEmp = mysql_fetch_assoc($resEmp);
        ?> 
				<center><b><h2><?php echo $rowEmp['distrito']; ?></h2></b></center>
						
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-12 control-label" for="textinput">Direccion Exacta</label>
                            <div class="col-md-12">
                                <center><b><h2><?php echo $persona['direccion_exacta']; ?></h2></b></center>
                            </div>
                        </div>
                    </td>


                    <td>
                        <center>
                            <h3><i>Otros Datos</i></h3>
                        </center>
                        <br>
                        <div class="form-group">
                            <label class="col-md-12 control-label" for="textinput">Nivel Educativo:</label>
                            <div class="col-md-12">


                                             
     <?php 
            $queEmp = "SELECT * FROM `educacion` where id_educacion = ".$persona['nivel_educacion']."";	
			$resEmp = mysql_query($queEmp, $conexion) or die(mysql_error());
           $rowEmp = mysql_fetch_assoc($resEmp);
       
        ?>                       
<center><b><h2><?php echo $rowEmp['nombre']; ?></h2></b></center>
                            </div>
                        </div>



                        <table class="table">
                            <tr>
                                <td>
                                    <div class="form-group">
                                        <label class="col-md-12 control-label" for="textinput">Seccion</label>
                                        <div class="col-md-12">
                                             <center><b><h2><?php echo $persona['seccion']; ?></h2></b></center>
                                          
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="form-group">
                                        <label class="col-md-12 control-label" for="textinput">Fecha de Ingreso</label>
                                        <div class="col-md-12">
                                            <center><b><h2><?php echo $persona['fecha_ingreso']; ?></h2></b></center>
                                            
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
                                            <center><b><h2><?php echo $persona['fecha_nacimiento']; ?></h2></b></center>
                                         
                                        </div>
                                    </div>
                                </td>
                                <td>

                                    <div class="form-group">
                                        <label class="col-md-12 control-label" for="textinput">Genero</label>
                                        <div class="col-md-12">
                                             <center><b><h2><?php echo ($persona['genero'] == 1) ? "Masculino" : "Femenino"; ?></h2></b></center>
                                          
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </table>


                    </td>


                </tr>
                
                <?php 
                    $formulario = mysql_query("SELECT * FROM `formulario_medico` where cedula = ".$_GET['ced']." ", $conexion) or die(mysql_error());
                    $formulario = mysql_fetch_assoc($formulario);
                ?>
                <tr>
                    <td colspan="3">
                        <center>
                            <h3><i>Datos Medicos</i></h3>
                        </center>
                        <br>

                        <table class="table">
                            <tr>
                                <td>
                                    <center>
                                        <h2><i><u>Enfermedades</u></i></h2>
                                    </center>
			<?php 
            $queEmp = "SELECT enfermedad.nombre from enfermedad_x_fomulario,enfermedad WHERE enfermedad_x_fomulario.id_enfermedad = enfermedad.id_enfermedad AND enfermedad_x_fomulario.id_formulario = ".$formulario['id_formulario']." ";	
			$resEmp = mysql_query($queEmp, $conexion) or die(mysql_error());
            while ($rowEmp = mysql_fetch_assoc($resEmp)) {
                        echo " <center><b><h2>".$rowEmp['nombre']."</h2></b></center>";
                }
            ?> 
                                </td>
                                <td>
                                    <center>
                                        <h2><i><u>Medicamentos</u></i></h2>
                                    </center>
	<?php 
            $queEmp = "SELECT medicamento.nombre from medicamento_x_formulario,medicamento WHERE medicamento_x_formulario.id_medicamento = medicamento.id_medicamento AND medicamento_x_formulario.id_formulario = ".$formulario['id_formulario']." ";	
			$resEmp = mysql_query($queEmp, $conexion) or die(mysql_error());
            while ($rowEmp = mysql_fetch_assoc($resEmp)) {
                        echo " <center><b><h2>".$rowEmp['nombre']."</h2></b></center>";
                }
            ?> 

                                </td>
                                <td>
                                    <center>
                                        <h2><i><u>Alergias</u></i></h2>
                                    </center>



                                    	<?php 
            $queEmp = "SELECT alergia.nombre from alergia_x_formulario,alergia WHERE alergia_x_formulario.id_alergia = alergia.id_alergia AND alergia_x_formulario.id_formulario = ".$formulario['id_formulario']." ";	
			$resEmp = mysql_query($queEmp, $conexion) or die(mysql_error());
            while ($rowEmp = mysql_fetch_assoc($resEmp)) {
                        echo " <center><b><h2>".$rowEmp['nombre']."</h2></b></center>";
                }
            ?> 
                                   
                                </td>

                                <td>
                                    <center>
                                        <h2><i><u>Rh</u></i></h2>
                                    </center>
<center><b><h2><?php echo $formulario['tipo_sangre']; ?></h2></b></center>
                                    
                                    
                           
                                </td>




                            </tr>
                            
                            <tr>
                                <td colspan="4">
                                      <center>
                                          <h2><i>Descripción</i></h2>
                                    </center>
<center><b><h2><?php echo $formulario['descripcion']; ?></h2></b></center>
                               
                                    
                                </td>
                            </tr>

                        </table>

                    </td>

                </tr>
                <tr>
                    <td colspan="3">
                        <center>
                            <h2><i>Padres o Encargados</i></h2>
                        </center>
                        <br>
                        <table class="table encargados" id="formulario">
                            <tr>
                                <td>Nombre</td>
                                <td>Parentesco</td>
                                <td>Scout</td>
                                <td>Telefono</td>
                                <td>Email</td>
                            </tr>
                            <tr>              
                            <?php 
                            $resEmp = mysql_query("SELECT * FROM `encargado` where cedula_persona = ".$_GET['ced']." ", $conexion) or die(mysql_error());
                            while ($rowEmp = mysql_fetch_assoc($resEmp)) {
                                    $scout =  ($rowEmp['scout'] == 1) ? "Si": "No" ;
                                        echo "<td><h2>".$rowEmp['nombre']."</td>
                                                <td><h2>".$rowEmp['parentesco']."</td>
                                                <td><h2>".$scout."</td>
                                                <td><h2>".$rowEmp['telefono']."</td>
                                                <td><h3>".$rowEmp['correo']."</td>";
                                }
                            ?> 
                                
                            </tr>
                            </table>
                    </td>
                    </tr>
            </table>
    <br>
    <?php include "fotter.php"; ?>
