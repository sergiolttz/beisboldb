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
  ob_start();
  if (isset($_GET['id'])) {
    $id = mysqli_real_escape_string($cone, $_GET['id']);
    $sql = "SELECT * FROM t_manager WHERE id_manager = $id";
    $result = mysqli_query($cone, $sql);
  } else {
    echo "<h1>Error: ID de manager faltante.</h1>";
  }
  $row = mysqli_fetch_assoc($result);
  ?>
  <div class="container">
    <h1>Editar Jugador</h1>
    <section class="tarjeta-container">
      <div class="tarjeta">
        <form method="post" action="">
          <input type="hidden" name="id" value="<?php echo $row['id_manager'] ?>">
          <div>
            <h3>Nombre</h3>
            <input type="text" name="nombre_manager" value="<?php echo $row['nombre_manager'] ?>">
          </div>
          <div>
            <h3>Fecha de Nacimiento</h3>
            <input type="date" name="fecha_nacimiento_manager" value="<?php echo $row['fecha_nacimiento_manager'] ?>">
          </div>
          <div>
            <h3>Nacionalidad</h3>
            <select name="nacionalidad_manager">
              <option value="afganistan">afganistan</option>
              <option value="albania">albania</option>
              <option value="alemania">alemania</option>
              <option value="andorra">andorra</option>
              <option value="angola">angola</option>
              <option value="antarctica">antarctica</option>
              <option value="antigua y barbuda">antigua y barbuda</option>
              <option value="arabia saudi">arabia saudi</option>
              <option value="argelia">argelia</option>
              <option value="argentina">argentina</option>
              <option value="armenia">armenia</option>
              <option value="aruba">aruba</option>
              <option value="australia">australia</option>
              <option value="austria">austria</option>
              <option value="azerbaijan">azerbaijan</option>
              <option value="bahamas">bahamas</option>
              <option value="bahrein">bahrein</option>
              <option value="bangladesh">bangladesh</option>
              <option value="barbados">barbados</option>
              <option value="belgica">belgica</option>
              <option value="belice">belice</option>
              <option value="benin">benin</option>
              <option value="bhutan">bhutan</option>
              <option value="bielorrusia">bielorrusia</option>
              <option value="bolivia">bolivia</option>
              <option value="bosnia">bosnia</option>
              <option value="burkina faso">burkina faso</option>
              <option value="chad">chad</option>
              <option value="corea del norte">corea del norte</option>
              <option value="cuba">cuba</option>
              <option value="el salvador">el salvador</option>
              <option value="botswana">botswana</option>
              <option value="cabo verde">cabo verde</option>
              <option value="chile">chile</option>
              <option value="corea del sur">corea del sur</option>
              <option value="dinamarca">dinamarca</option>
              <option value="brasil">brasil</option>
              <option value="brunei">brunei</option>
              <option value="bulgaria">bulgaria</option>
              <option value="cambodia">cambodia</option>
              <option value="camerun">camerun</option>
              <option value="canada">canada</option>
              <option value="china">china</option>
              <option value="chipre">chipre</option>
              <option value="colombia">colombia</option>
              <option value="costa de marfil">costa de marfil</option>
              <option value="costa rica">costa rica</option>
              <option value="curazao">curazao</option>
              <option value="croacia">croacia</option>
              <option value="EAU">EAU</option>
              <option value="ecuador">ecuador</option>
              <option value="egipto">egipto</option>
              <option value="escocia">escocia</option>
              <option value="eslovaquia">eslovaquia</option>
              <option value="eslovenia">eslovenia</option>
              <option value="españa">españa</option>
              <option value="estonia">estonia</option>
              <option value="etiopia">etiopia</option>
              <option value="europa">europa</option>
              <option value="filipinas">filipinas</option>
              <option value="finlandia">finlandia</option>
              <option value="francia">francia</option>
              <option value="gabon">gabon</option>
              <option value="gales">gales</option>
              <option value="gambia">gambia</option>
              <option value="georgia">georgia</option>
              <option value="ghana">ghana</option>
              <option value="grecia">grecia</option>
              <option value="guatemala">guatemala</option>
              <option value="guinea bissau">guinea bissau</option>
              <option value="guinea">guinea</option>
              <option value="guyana">guyana</option>
              <option value="honduras">honduras</option>
              <option value="hong kong">hong kong</option>
              <option value="hungria">hungria</option>
              <option value="india">india</option>
              <option value="indonesia">indonesia</option>
              <option value="inglaterra">inglaterra</option>
              <option value="iran">iran</option>
              <option value="iraq">iraq</option>
              <option value="irlanda">irlanda</option>
              <option value="islandia">islandia</option>
              <option value="israel">israel</option>
              <option value="italia">italia</option>
              <option value="jamaica">jamaica</option>
              <option value="japon">japon</option>
              <option value="jordania">jordania</option>
              <option value="letonia">letonia</option>
              <option value="lgbt">lgbt</option>
              <option value="libano">libano</option>
              <option value="liberia">liberia</option>
              <option value="luxemburgo">luxemburgo</option>
              <option value="marruecos">marruecos</option>
              <option value="mexico">mexico</option>
              <option value="nicaragua">nicaragua</option>
              <option value="niger">niger</option>
              <option value="nigeria">nigeria</option>
              <option value="paises bajos">paises bajos</option>
              <option value="pakistan">pakistan</option>
              <option value="palestina">palestina</option>
              <option value="polonia">polonia</option>
              <option value="portugal">portugal</option>
              <option value="republica dominicana">republica dominicana</option>
              <option value="ruanda">ruanda</option>
              <option value="serbia">serbia</option>
              <option value="sudafrica">sudafrica</option>
              <option value="tailandia">tailandia</option>
              <option value="sierra leona">sierra leona</option>
              <option value="sudan">sudan</option>
              <option value="taiwan">taiwan</option>
              <option value="puerto rico">puerto rico</option>
              <option value="rumania">rumania</option>
              <option value="singapur">singapur</option>
              <option value="suecia">suecia</option>
              <option value="tanzania">tanzania</option>
              <option value="tunez">tunez</option>
              <option value="usa">usa</option>
              <option value="turquia">turquia</option>
              <option value="venezuela">venezuela</option>
              <option value="paraguay">paraguay</option>
              <option value="RD congo">RD congo</option>
              <option value="rusia">rusia</option>
              <option value="siria">siria</option>
              <option value="suiza">suiza</option>
              <option value="togo">togo</option>
              <option value="trinidad y tobago">trinidad y tobago</option>
              <option value="ucrania">ucrania</option>
              <option value="uk">uk</option>
              <option value="uruguay">uruguay</option>
              <option value="vietnam">vietnam</option>
              <option value="yemen">yemen</option>
              <option value="zambia">zambia</option>
              <option value="monte negro">monte negro</option>
              <option value="noruega">noruega</option>
              <option value="mozambique">mozambique</option>
              <option value="nueva zelanda">nueva zelanda</option>
              <option value="peru">peru</option>
              <option value="republica checa">republica checa</option>
              <option value="senegal">senegal</option>
              <option value="somalia">somalia</option>
              <option value="surinam">surinam</option>
              <option value="zimbawe">zimbawe</option>
            </select>
          </div>
          <div class="button-container">
            <div class="elemento-izquierda elemento-izquierda-texto">
              <img src="img/guardar.jpg" width="40" height="40">
              <button type="submit" name="guardar">Guardar cambios</button>
            </div>
            <div class="elemento-izquierda elemento-izquierda-texto">
              <img src="img/atras.jpg" width="40" height="40">
              <a href="ligas.php>"><button type="button">Volver</button></a>
            </div>
          </div>
        </form>
      </div>
    </section>

    <?php
    if (isset($_POST['guardar'])) {
      $nombre = $_POST['nombre_manager'];
      $fecha_nacimiento = $_POST['fecha_nacimiento_manager'];
      $nacionalidad = $_POST['nacionalidad_manager'];
      $sql_guardar = "UPDATE t_manager SET
                    nombre_manager = '$nombre',
                    fecha_nacimiento_manager = '$fecha_nacimiento',
                    nacionalidad_manager = '$nacionalidad'
                    WHERE id_manager = $id";

      mysqli_query($cone, $sql_guardar);
      header("location:equipos.php");
      ob_end_flush();
    }
    ?>
</body>

</html>