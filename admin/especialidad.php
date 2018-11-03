<?php 

include "header.php"; 



if (isset($_GET['borrar'])){
    mysql_query("DELETE FROM `usuario_lista` WHERE `id_usuario` =  ".$_GET['borrar']." ", $conexion) or die(mysql_error());
    echo "<script>alert('Borrado con exito!');</script>";
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
    <h1>Especialidad</h1>
</center>
<div class="container">

    <?php 
if (!isset($_GET['id_especialidad'])){
            $queEmp = "SELECT * FROM `tipo_especialidad` order by id_tipo";	
            $resEmp = mysql_query($queEmp, $conexion) or die(mysql_error());	
            while ($rowEmp = mysql_fetch_assoc($resEmp)) {
                 echo "  <center>
                            <a class='btn btn-warning' href='especialidad.php?cedula=".$_GET['cedula']."&id_especialidad=".$rowEmp['id_tipo']."'><span class='glyphicon glyphicon-edit'></span> ".$rowEmp['nombre']."</a>
                        </center> <br> 
                        ";
            }    
}else{ 
    
    if (isset($_GET['registrar'])){
        
        $insertar_registro = " INSERT INTO `especialidad`(`cedula`, `tipo`,reto,`fecha`,`aprobado`) VALUES (
          '".$_GET['cedula']."',
         '".$_GET['id_especialidad']."',
         '".$_POST['reto']."',
         '".$_POST['fecha']."',
         '".$_POST['aprobado']."'
         );";
        mysql_query($insertar_registro, $conexion) or die(mysql_error());
        //echo '<script>location.href = "especialidad.php?cedula='.$_GET['cedula'].'&id_especialidad='.$_GET['id_especialidad'].'";</script>';
    }
    
?>


    <script>
        $('#collapseExample').hide();

        function mostrar() {
            $('#collapseExample').show();
        }

    </script>




    <center>
        <a class="btn btn-success" onclick="mostrar();">
    Nuevo Reto
  </a>
    </center>

    <div class="collapse" id="collapseExample"><br><br>
        <center>
            <form class="form-horizontal" action="especialidad.php?cedula=<?php echo $_GET['cedula'];?>&id_especialidad=<?php echo $_GET['id_especialidad'];?>&registrar=1" method="post">
                <fieldset>

                    <legend>Registro de retos</legend>

                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Reto</label>
                        <div class="col-md-4">
                            <select name="reto" class="form-control">
                                <?php        
                                    $queEmp = "SELECT * FROM `reto_especialidad` where id_tipo = ".$_GET['id_especialidad']." order by id_tipo";	
                                    $resEmp = mysql_query($queEmp, $conexion) or die(mysql_error());	
                                    while ($rowEmp = mysql_fetch_assoc($resEmp)) {
                                         echo "<option value='".$rowEmp['id_reto']."'>".$rowEmp['nombre']."</option> ";             
                                    }
                                ?>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Fecha</label>
                        <div class="col-md-4">
                            <input id="textinput" name="fecha" type="date" value="<?php echo date(" Y-m-d ");?>" class="form-control input-md">
                        </div>
                    </div>


                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Aprobado</label>
                        <div class="col-md-4">
                            <select id="selectbasic" name="aprobado" class="form-control">
        <option value='1'>Si</option>
        <option value='0'>No</option>
    </select>

                        </div>
                    </div>

                </fieldset>



                <center>
                    <input type="submit" value="Registrar" class="btn btn-success">
                </center>

            </form>
        </center>
    </div>

    <br>
    <br>

    <table class='table'>
        <tr>
            <td>
                <center>
                    <h2><b>Reto</b></h2>
                </center>
            </td>
            <td>
                <center>
                    <h2><b>Fecha</b></h2>
                </center>
            </td>
            <td>
                <center>
                    <h2><b>Aprobado</b></h2>
                </center>
            </td>
        </tr>
        <?php           
        $resEmp3 = mysql_query("SELECT *,reto_especialidad.nombre AS nombre_reto FROM `especialidad`, reto_especialidad where especialidad.reto = reto_especialidad.id_reto and cedula =  ".$_GET['cedula']."  and tipo=".$_GET['id_especialidad']." ", $conexion) or die(mysql_error());	
        while ($rowEmp3 = mysql_fetch_assoc($resEmp3)) {
            $aprovado = ($rowEmp3['aprobado'] == 1) ? "SÍ" : "No";
            
           
                echo "<tr>
                    <td><h4>".$rowEmp3['nombre_reto']."</h4></td>
                    <td><h4>".$rowEmp3['fecha']."</h4></td>
                    <td><h4>".$aprovado."</h4></td>
                </tr>";
        }    
        ?>
    </table>

    <?php } ?>

</div>
<br>
<?php include "fotter.php"; ?>
