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

  <?php include "nav_jugador.php"; ?>

  <?php
  if (isset($_GET['id'])) {
    $id = mysqli_real_escape_string($cone, $_GET['id']);
    $sql = "SELECT * FROM t_manager WHERE id_manager = $id";
    $result = mysqli_query($cone, $sql);
  } else {
    echo "<h1>Error: ID de manager faltante.</h1>";
  }
  $row = mysqli_fetch_assoc($result);
  ?>


  <!DOCTYPE html>
  <html lang="es">

  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eliminar manager</title>
    <link rel="stylesheet" href="styles.css">
  </head>

  <body>
    <section class="tarjeta-container">
      <div class="tarjeta">
        <h1>Eliminar manager</h1>
        <form method="post" action="">
          <input type="hidden" name="id" value=" <?php echo $row['id_manager'] ?> ">
          <div>
            <label><?php echo $row['nombre_manager'] ?></label>
            <div class="button-container">
              <div class="elemento-izquierda elemento-izquierda-texto">
                <img src="img/eliminar_jugador.jpg" width="40" height="40">
                <button type="submit" name="eliminar">Eliminar manager</button>
              </div>
              <div class="elemento-izquierda elemento-izquierda-texto">
                <img src="img/atras.jpg" width="40" height="40">
                <a href="equipos.php"><button type="button">Volver</button></a>
              </div>
            </div>
    </section>

    <?php
    if (isset($_POST['eliminar'])) {
      $deletemanager = isset($_POST['delete_manager']) ? $_POST['delete_manager'] : false;
      $sql = "DELETE FROM t_manager WHERE id_manager = $id";
      mysqli_query($cone, $sql);
      header("location:equipos.php");
      ob_end_flush();
    }
    ?>

    </form>
    </div>
  </body>

  </html>