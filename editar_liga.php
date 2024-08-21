<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Béisbol Venezolano</title>
  <link rel="stylesheet" href="style.css">
</head>

<body>
  <header>
    <div class="container">
      <img src="img/logo.png" class="logo">
      <h1> Base de datos del beisbol venezolano</h1>
    </div>
  </header>

  <?php include "nav_liga.php"; ?>

  <?php
  if (isset($_GET['id'])) {
    $id = mysqli_real_escape_string($cone, $_GET['id']);
    $sql = "SELECT * FROM t_ligas WHERE id_liga = $id";
    $result = mysqli_query($cone, $sql);
  } else {
    echo "<h1>Error: ID de liga faltante.</h1>";
  }
  $row = mysqli_fetch_assoc($result);
  ?>
  <div class="container">
    <h1>Editar Liga</h1>
    <section class="tarjeta-container">
      <div class="tarjeta">
        <form method="post" action="">
          <input type="hidden" name="id" value=" <?php echo $row['id_liga'] ?> ">
          <div>
            <h3>Nombre</h3>
            <input type="text" name="nombre_liga" id="nombre" value=" <?php echo $row['nombre_liga'] ?> ">
          </div>
          <div>
            <h3>Ruta de la imagen</h3>
            <input type="text" name="ruta_img_liga" id="ruta_img" value=" <?php echo $row['ruta_img_liga'] ?>">
          </div>
          <div>
            <h3>Año de fundación</h3>
            <input type="text" name="fundacion_liga" id="nombre" value=" <?php echo $row['fundacion_liga'] ?> ">
          </div>
          <div class="button-container">
            <div class="elemento-izquierda elemento-izquierda-texto">
              <img src="img/guardar.jpg" width="40" height="40">
              <button type="submit" name="" value="guardar">Guardar cambios</button>
            </div>
            <div class="elemento-izquierda elemento-izquierda-texto">
              <img src="img/atras.jpg" width="40" height="40">
              <a href="ligas.php"><button type="button">Volver</button></a>
            </div>
          </div>
        </form>
      </div>
    </section>



    <?php
    $nom = isset($_POST['nombre_liga']) ? $_POST['nombre_liga'] : '';
    $img = isset($_POST['ruta_img_liga']) ? $_POST['ruta_img_liga'] : '';
    $fun = isset($_POST['fundacion_liga']) ? $_POST['fundacion_liga'] : '';
    if ($nom != null || $img != null) {
      $sql = "UPDATE t_ligas SET nombre_liga = '$nom', ruta_img_liga = '$img', fundacion_liga='$fun'  WHERE id_liga = $id;";
      mysqli_query($cone, $sql);
      if ($nom = 1) {
        header("location:ligas.php");
      }
    }
    ?>
  </div>