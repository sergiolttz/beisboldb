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

  <?php include "nav_equipo.php"; ?>

  <?php
  if (isset($_GET['id'])) {
    $id = mysqli_real_escape_string($cone, $_GET['id']);
    $sql = "SELECT * FROM t_jugadores WHERE id_jugador = $id";
    $result = mysqli_query($cone, $sql);
  } else {
    echo "<h1>Error: ID de jugador faltante.</h1>";
  }
  $row = mysqli_fetch_assoc($result);
  ?>


  <!DOCTYPE html>
  <html lang="es">

  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eliminar jugador</title>
    <link rel="stylesheet" href="styles.css">
  </head>

  <body>

    <section class="tarjeta-container">
      <div class="tarjeta">
        <h1>Eliminar jugador</h1>
        <form method="post" action="">
          <input type="hidden" name="id" value=" <?php echo $row['id_jugador'] ?> ">
          <div>
            <label><?php echo $row['nombre_jugador'] ?></label>
            <div class="button-container">
              <div class="elemento-izquierda elemento-izquierda-texto">
                <img src="img/eliminar_jugador.jpg" width="40" height="40">
                <button type="submit" name="eliminar">Eliminar jugador</button>
              </div>
              <div class="elemento-izquierda elemento-izquierda-texto">
                <img src="img/atras.jpg" width="40" height="40">
                <a href="jugadores.php"><button type="button">Volver</button></a>
              </div>
            </div>
    </section>

    <?php
    if (isset($_POST['eliminar'])) {
      $deletejugador = isset($_POST['delete_jugador']) ? $_POST['delete_jugador'] : false;
      $sql = "DELETE FROM t_jugadores WHERE id_jugador = $id";
      mysqli_query($cone, $sql);
      header("location:jugadores.php");
      ob_end_flush();
    }
    ?>

    </form>
    </div>
  </body>

  </html>