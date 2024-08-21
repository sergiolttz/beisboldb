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
    $sql = "SELECT * FROM t_ligas WHERE id_liga = $id";
    $result = mysqli_query($cone, $sql);
  } else {
    echo "<h1>Error: ID de liga faltante.</h1>";
  }
  $row = mysqli_fetch_assoc($result);
  ?>
  <section class="tarjeta-container">
    <div class="tarjeta">
      <h1>Eliminar Liga</h1>
      <form method="post" action="">
        <input type="hidden" name="id" value=" <?php echo $row['id_liga'] ?> ">
        <div>
          <label><?php echo $row['nombre_liga'] ?></label>
          <div class="button-container">
            <div class="elemento-izquierda elemento-izquierda-texto">
              <img src="img/eliminar_liga.jpg" width="40" height="40">
              <button type="submit" name="eliminar">Eliminar Liga</button>
            </div>
            <div class="elemento-izquierda elemento-izquierda-texto">
              <img src="img/atras.jpg" width="40" height="40">
              <a href="ligas.php"><button type="button">Volver</button></a>
            </div>
          </div>
  </section>

  <?php
  if (isset($_POST['eliminar'])) {
    $deleteLiga = isset($_POST['delete_liga']) ? $_POST['delete_liga'] : false;
    $sql = "DELETE FROM t_ligas WHERE id_liga = $id";
    mysqli_query($cone, $sql);
    header("location:ligas.php");
  }
  ?>

  </form>
  </div>
</body>

</html>