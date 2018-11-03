<?php 
	include "config.php";
	if (isset($_SESSION['usuario'])){
		$queEmp = "SELECT * FROM usuario where id_usuario = '".$_SESSION["usuario"]."'";
		$resEmp = mysql_query($queEmp, $conexion) or die(mysql_error());
		$rowEmp = mysql_fetch_assoc($resEmp);
		
			echo "<script>window.location='admin/'</script>";
        

	}
?>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Guias Scouts - Registro de Reclutas</title>
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/sticky-footer-navbar.css" rel="stylesheet">
    <link rel="shortcut icon" type="image/x-icon" href="http://remusacr.com/images/logo.png" />
</head>

<body>

    <center>
        <div class="col-md-4 col-md-offset-4" style="margin-top:100px;">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <img src="img/logo-GuiasyScouts.jpg" style="width: 80%;">
                    <br>
                    <h4 class="panel-title">Registro de Reclutas</h4>
                </div>
                <br><br>
                <div class="panel-body">
                    <form accept-charset="UTF-8" role="form" action="aut_verifica.php" method="post" enctype="multipart/form-data">
                        <fieldset>
                            <div class="form-group">
                                <input class="form-control" placeholder="Usuario" name="user" type="text">
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="Contraseña" name="pass" type="password" value="">
                            </div>

                            <input class="btn btn-lg btn-success btn-block" type="submit" value="Entrar">
                        </fieldset>
                    </form>

                </div>
            </div>
        </div>
    </center>

    <footer class="footer">
        <div class="container">
            <span class="text-muted"><center>Desarrollo e integración: TEC - 20<?php echo date('y'); ?></center></span>
        </div>
    </footer>



    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script>
        window.jQuery || document.write('<script src="https://getbootstrap.com/assets/js/vendor/jquery-slim.min.js"><\/script>')

    </script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>

</html>
