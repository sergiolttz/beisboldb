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
  ob_start();
  if (isset($_GET['id'])) {
    $id = mysqli_real_escape_string($cone, $_GET['id']);
    $sql = "SELECT * FROM t_equipos WHERE id_equipo = $id";
    $result = mysqli_query($cone, $sql);
  } else {
    echo "<h1>Error: ID de equipo faltante.</h1>";
  }
  $row = mysqli_fetch_assoc($result);
  $pagina_anterior = $row["id_liga"];
  ?>
  <div class="container">
    <h1>Editar Equipo</h1>
    <section class="tarjeta-container">
      <div class="tarjeta">
        <form method="post" action="">
          <input type="hidden" name="id" value=" <?php echo $row['id_equipo'] ?> ">
          <div>
            <h3>Nombre</h3>
            <input type="text" name="nombre_equipo" id="nombre" value="<?php echo $row['nombre_equipo'] ?>">
          </div>
          <div>
            <h3>Ruta de la imagen</h3>
            <input type="text" name="ruta_img_equipo" id="ruta_img_equipo" value="<?php echo $row['ruta_img_equipo'] ?>">
          </div>
          <div>
            <h3>Año de fundación</h3>
            <input type="text" name="fundacion_equipo" id="fundacion_equipo" value="<?php echo $row['fundacion_equipo'] ?>">
          </div>
          <div>
            <h3>Estadio</h3>
            <input type="text" name="estadio" id="estadio" value="<?php echo $row['estadio'] ?>">
          </div>
          <div>
            <h3>Ciudad</h3>
            <input type="text" name="ciudad" id="nombciudadre" value="<?php echo $row['ciudad'] ?>">
          </div>
          <div>
            <h3>Liga</h3>
            <select name="id_liga">
              <option value="<?php echo $row['id_liga'] ?>"></option>
              <?php
              $sql_ligas = "SELECT id_liga, nombre_liga FROM t_ligas";
              $result = mysqli_query($cone, $sql_ligas);
              if (mysqli_num_rows($result) > 0) {
                while ($row = mysqli_fetch_assoc($result)) {
                  $idl = $row['id_liga'];
                  $name = $row['nombre_liga'];
                  echo "<option value='$idl'>$name</option>";
                }
              }
              ?>
            </select>
          </div>
          <div>
            <h3>Manager</h3><br>
            <select name="id_manager">
              <option value="<?php echo $row['id_manager'] ?>"></option>
              <?php
              $sql_manager = "SELECT id_manager, nombre_manager FROM t_manager";
              $result = mysqli_query($cone, $sql_manager);
              if (mysqli_num_rows($result) > 0) {
                while ($row = mysqli_fetch_assoc($result)) {
                  $idm = $row['id_manager'];
                  $name = $row['nombre_manager'];
                  echo "<option value='$idm'>$name</option>";
                }
              }
              ?>
            </select>
          </div>
          <div class="button-container">
            <div class="elemento-izquierda elemento-izquierda-texto">
              <img src="img/guardar.jpg" width="40" height="40">
              <button type="submit" name="" value="guardar cambios">Guardar cambios</button>
            </div>
            <div class="elemento-izquierda elemento-izquierda-texto">
              <img src="img/atras.jpg" width="40" height="40">
              <a href="liga.php?id=<?php echo $pagina_anterior; ?>"><button type="button">Volver</button></a>
            </div>
          </div>
        </form>
      </div>
    </section>

    <?php
    if (isset($_POST['nombre_equipo'])) {
      $nom = $_POST['nombre_equipo'];
      $img = $_POST['ruta_img_equipo'];
      $lig = $_POST['id_liga'];
      $est = $_POST['estadio'];
      $ciu = $_POST['ciudad'];
      $man = $_POST['id_manager'];
      $fun = $_POST['fundacion_equipo'];
      $id = $_POST['id'];
      $sql = "UPDATE t_equipos SET
              nombre_equipo = '$nom',
              ruta_img_equipo = '$img',
              id_liga='$lig',
              fundacion_equipo='$fun',
              estadio='$est',
              ciudad='$est',
              id_manager='$man'
              WHERE id_equipo = $id;";
      mysqli_query($cone, $sql);
      $pagina_anterior = $lig;
      header("location:liga.php?id=$pagina_anterior");
      ob_end_flush();
    }
    ?>
    <footer>
      <div class="container">
        <p>&copy; 2024 Béisbol Venezolano</p>
      </div>
    </footer>
</body>

</html>