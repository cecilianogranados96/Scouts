<?php 
    include '../config.php'; 
    $queEmp = "SELECT * FROM usuario where id_usuario = '".$_SESSION["usuario"]."'";
    $resEmp = mysql_query($queEmp, $conexion) or die(mysql_error());
    $rowEmp = mysql_fetch_assoc($resEmp);
?>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Guias Scouts - Registro de Reclutas</title>
    <!-- Bootstrap core CSS -->
    <link href="../css/css/bootstrap.min.css" rel="stylesheet">      
    <link href="../css/css//sticky-footer-navbar.css" rel="stylesheet">   
    <link rel="shortcut icon" type="image/x-icon" href="http://remusacr.com/images/logo.png" />
  <link rel="stylesheet" href="https://selectize.github.io/selectize.js/css/selectize.bootstrap3.css">
  </head>
  <body>
          <header>
      <!-- Fixed navbar -->
      <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
        <a class="navbar-brand" href="index.php">Scout's</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
          <ul class="navbar-nav mr-auto">
           <li class="nav-item"><a class="nav-link" href="scout.php">Participantes</a></li>
                <li class="nav-item"><a class="nav-link" href="catalogos.php">Catalogos</a></li>
                <li class="nav-item"><a class="nav-link" href="usuario.php">Usuarios</a></li>              
                <li class="nav-item"><a class="nav-link" href="reportes.php">Reportes</a></li>
              
          </ul>
          <form class="form-inline mt-2 mt-md-0">
            <a href="../aut_salir.php" class="btn btn-outline-success">Salir</a>
          </form>
        </div>
      </nav>
    </header>
      
