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
    <h1>Scout's</h1>
</center>
<center>
  <a class="btn btn-success"  href='nuevo_scout.php'>
    Nuevo Scout
  </a>
</center>

<div class="container">
    
    <table class="table table-striped ">
        <thead>

            <tr>
                <th>
                    <center>Cedula</center>
                </th>
             
                 <th>
                    <center>Nombre</center>
                </th>
                
                <th>
                    <center>Bitacora</center>
                </th>
                <th>
                    <center>Brujula</center>
                </th>
                <th>
                    <center>Especialidad</center>
                </th>
                
                
                <th>
                    <center>Editar/Borrar</center>
              
                    
                </th>
            </tr>
        </thead>
        
     <?php 
            $queEmp = "SELECT * FROM `persona` order by nombre ASC";	
			$resEmp = mysql_query($queEmp, $conexion) or die(mysql_error());
			$totEmp = mysql_num_rows($resEmp);	
            while ($rowEmp = mysql_fetch_assoc($resEmp)) {
                        echo "
                        <tr>
                            <td><center>".$rowEmp['cedula']."</center></td>
                            <td><center>".$rowEmp['nombre']."</center></td>
                            <td><center> <a href='bitacora.php?cedula=".$rowEmp['cedula']."' class='btn btn-danger'>Bitacora</a></center></td>
                            <td><center> <a href='brujula.php?cedula=".$rowEmp['cedula']."' class='btn btn-info'>Brujula</a></center></td>
                            <td><center> <a href='especialidad.php?cedula=".$rowEmp['cedula']."' class='btn btn-primary'>Especialidad</a></center></td>
                            <td>
                                <center>
                                    <a class='btn btn-warning' href='editar_scout.php?editar=".$rowEmp['cedula']."'><span class='glyphicon glyphicon-edit'></span> Editar</a>
                             
                                    <a class='btn btn-danger' href='?borrar=".$rowEmp['cedula']."' onclick=".'"'."javascript: return confirm('¿Estas seguro?');".'"'."><span class='glyphicon glyphicon-delete'></span> Eliminar</a>
                                </center>
                            </td>
                            
                            

                        </tr>";
                }
?>        
        
        
      <br><br><br>  
    </table>
</div>
<br>
<?php include "fotter.php"; ?>
