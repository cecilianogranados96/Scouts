<?php 
include "header.php";
?>
<head>
<style>
body{padding-top:5%;}
</style>
</head>
<div class="container">
    
  <center>
        <h3>Orden de productos<br></h3>
        <table>
            <tr>
                <td>
                    <a onclick="window.history.back();" href="#" class="btn btn-info">Regresar</a>
                </td>
                <td>
                    <a href="orden.php" class="btn btn-danger">Orden Cliente</a>
                </td>
            </tr>
        </table>
        
        <br><br>
    
    
        <?php 
                    if(isset($_GET['cliente_seleccion'])){
                          $queEmp1 = "UPDATE `orden_agente` SET `id_cliente`='".$_GET['cliente_seleccion']."' WHERE `id_agente`  = '".$_SESSION["usuario"]."' ";    
                          $resEmp1 = mysql_query($queEmp1, $conexion) or die(mysql_error());
                    } 
                    if(isset($_GET['cambiar'])){
                          $queEmp1 = "UPDATE `orden_agente` SET `id_cliente`='0' WHERE `id_agente`  = '".$_SESSION["usuario"]."' ";    
                          $resEmp1 = mysql_query($queEmp1, $conexion) or die(mysql_error());
                    } 
                    $resEmp = mysql_query("SELECT id_usuario,nombre,tipo,id_compania FROM `usuario_lista` WHERE `tipo` = 3 order by nombre ASC", $conexion) or die(mysql_error());
                    $clientes ="";
                    while ($rowEmp = mysql_fetch_assoc($resEmp)) {
                            $clientes .= " <option value='".$rowEmp['id_usuario']."'>".$rowEmp['nombre']."</option>";
                    }
                    $queEmp1 = "
                        SELECT 
                            product_description.product_id,
                            product_description.name,
                            product.model,
                            product.quantity,
                            product.image,
                            product.price,
                            orden_agente.cantidad,
                            orden_agente.id_orden_agente,
                            orden_agente.id_cliente
                        FROM 
                            product,
                            product_to_category,
                            product_description,
                            orden_agente
                        WHERE
                            product.product_id = product_description.product_id and 
                            product_description.product_id = product.product_id AND
                            product_to_category.product_id = product.product_id and

                            product_to_category.product_id =  orden_agente.id_producto and 
                            orden_agente.id_agente = '".$_SESSION["usuario"]."'
                        order by product_description.name
                        ";    
                    $resEmp1 = mysql_query($queEmp1, $conexion) or die(mysql_error());
        
        
                    $id_cliente = "SELECT id_cliente FROM orden_agente WHERE id_agente = '".$_SESSION["usuario"]."' limit 1";
                    $id_cliente_res = mysql_query($id_cliente, $conexion) or die(mysql_error());
                    $cliente_n = mysql_num_rows($id_cliente_res);	
                    $id_cliente = mysql_fetch_assoc($id_cliente_res);
                    
                    $cliente = "SELECT * FROM usuario_lista WHERE id_usuario = '".$id_cliente["id_cliente"]."' ";
                    $cliente_res = mysql_query($cliente, $conexion) or die(mysql_error());
                    $cliente = mysql_fetch_assoc($cliente_res);
                            
                    if ($cliente_n == 0){
                        
                        echo "<center><h3>Sin productos en la orden</h3></center>";
                    }else {
                        
                        $queEmp1 = "SELECT 
                                product_description.product_id,
                                product_description.name,
                                product.model,
                                product.quantity,
                                product.image,
                                product.price,
                                orden_agente.cantidad,
                                orden_agente.id_orden_agente,
                                orden_agente.id_cliente
                            FROM 
                                product,
                                product_to_category,
                                product_description,
                                orden_agente
                            WHERE
                                product.product_id = product_description.product_id and 
                                product_description.product_id = product.product_id AND
                                product_to_category.product_id = product.product_id and

                                product_to_category.product_id =  orden_agente.id_producto and 
                                orden_agente.id_agente = '".$_SESSION["usuario"]."'
                            order by product_description.name
                            ";    
                        $resEmp1 = mysql_query($queEmp1, $conexion) or die(mysql_error());


                        $queEmp11 = "SELECT orden_agente.id_cliente FROM orden_agente WHERE orden_agente.id_agente = '".$_SESSION["usuario"]."' and orden_agente.id_cliente = 0";    
                        $resEmp11 = mysql_query($queEmp11, $conexion) or die(mysql_error());

                        $totEmp11 = mysql_num_rows($resEmp11);	

                        if ($totEmp11 != 0){                              
                            echo '<form class="form-horizontal" action="?cliente_seleccion=1" method="get" enctype="multipart/form-data">
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="Codigo">Selecciona un Cliente</label>
                                <div class="col-md-12">
                                    <select name="cliente_seleccion" class="form-control" >
                                       '.$clientes.'
                                    </select>
                                </div>
                            </div>

                            <center> <button type="submit" class="btn btn-success">Seleccionar</button> </center>
                            </form>
                            <br><hr><br>
                             <center><a href="cliente.php" class="btn btn-warning">Nuevo Cliente</a></center>



                            ';                        
                        }else{
                        echo "<table class='table-bordered' aling='left' >

                                <tr>
                                    <td>
                                        <h6><b>Nombre:</b></h6>
                                    </td>
                                    <td>
                                        <h5>".$cliente['nombre']."</h5>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <h6><b>Contacto</b></h6>
                                    </td>
                                    <td>
                                        <h5>".$cliente['nombre_contacto']."</h5>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <h6><b>Teléfono</b></h6>
                                    </td>
                                    <td>
                                        <h5>".$cliente['numero']."</h5>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <h6><b>Dirección</b></h6>
                                    </td>
                                    <td>
                                        <h5>".$cliente['direccion']."</h5>
                                    </td>

                                </tr>
                            </table>
                            <center><a href='orden.php?cambiar=1' class='btn btn-warning'>Cambiar Cliente</a></center>
                                <br><br>";
                            echo "<table class='table'>
                                    <tr>

                                        <td><b><center>Datos</center></b></td>
                                        <td><b><center>Cantidad</center></b></td>
                                        <td><b><center>Precio</center></b></td>


                                    </tr>";
                            $cantidad = '0';
                            $precio ='0'; 

                            while ($rowEmp1 = mysql_fetch_assoc($resEmp1)) {

                                echo "<tr>

                                        <td width='30%'>

                                            <b>Modelo:</b> ".$rowEmp1['model']." 
                                            <br><br>
                                            <b>Nombre:</b> ".$rowEmp1['name']." 

                                        </td>
                                        <td width='30%'>
                                            <form action='cart.php?prod=".$rowEmp1['product_id']."&act=1&orden=1' method='POST'> 
                                                <table>
                                                    <tr>
                                                        <td width='70%'>
                                                            <input type='number' min='1' value='".$rowEmp1['cantidad']."' max='".$rowEmp1['quantity']."' name='cantidad'  placeholder='Cantidad' class='form-control input-md' required>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width='30%'>
                                                            <button type='submit' class='btn btn-info'>Actualizar</button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width='30%'>
                                                            <a href='eliminar.php?id=".$rowEmp1['id_orden_agente']."' onclick=".'"'."javascript: return confirm('¿Estas seguro?');".'"'." class='btn btn-warning'>Eliminar</a>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </form>
                                        </td>
                                        <td width='30%'>

                                         <b>Precio Unitario:</b>  ".numero($rowEmp1['price'])." 
                                            <br><br>
                                          <b>Precio Total:</b> ".numero($rowEmp1['price']*$rowEmp1['cantidad'])." 


                                            </td>


                                    </tr>";
                                $cantidad += $rowEmp1['cantidad'];
                                $precio += $rowEmp1['price']; 
                            }
                            echo "</table> 
                            <hr>
                            </center>
                            <table class='table-bordered' align='right' >
                                <tr>
                                    <td>
                                        <h4><b>Articulos</b></h4>
                                    </td>
                                    <td>
                                        <h4>$cantidad</h4>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <h4><b>Monto total</b></h4>
                                    </td>
                                    <td>
                                        <h4>".numero($precio)."</h4>
                                    </td>

                                </tr>
                            </table>
                            <br><br>
                            <center>
                                <a href='enviar.php' onclick=".'"'."javascript: return confirm('¿Estas seguro?');".'"'." class='btn btn-danger'>Enviar Factura</a>
                            </center>";
                            }
                }        
?>        
</div>

<?php include "fotter.php"; ?>