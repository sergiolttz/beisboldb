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

    <?php
    include "nav_equipo.php";
    ob_start(); ?>

    <div class="container">
        <h1>Insertar Equipo</h1>
        <section class="tarjeta-container">
            <div class="tarjeta">
                <form method="post">
                    <h3>Nombre</h3><br>
                    <input type="text" name="nombre_equipo"><br>
                    <h3>Ruta de la imagen</h3><br>
                    <input type="text" name="ruta_img_equipo"><br>
                    <h3>Año de fundación</h3><br>
                    <input type="text" name="fundacion_equipo"><br>
                    <h3>Liga</h3><br>
                    <select name="id_liga">
                        <option value="">Selecciona Liga</option>
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
                    <h3>Estadio</h3><br>
                    <input type="text" name="estadio"><br>
                    <h3>Ciudad</h3><br>
                    <input type="text" name="ciudad"><br>
                    <h3>Manager</h3><br>
                    <select name="id_manager">
                        <option value="">Selecciona Manager</option>
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

                    <div class="button-container">
                        <div class="elemento-izquierda elemento-izquierda-texto">
                            <img src="img/guardar.jpg" width="40" height="40">
                            <button type="submit" name="" value="insertar">Insertar</button>
                        </div>
                        <div class="elemento-izquierda elemento-izquierda-texto">
                            <img src="img/atras.jpg" width="40" height="40">
                            <a href="equipos.php"><button type="button">Volver</button></a>
                        </div>
                    </div>
            </div>
            </form>
        </section>


        <?php
        $nom = isset($_POST['nombre_equipo']) ? $_POST['nombre_equipo'] : '';
        $img = isset($_POST['ruta_img_equipo']) ? $_POST['ruta_img_equipo'] : '';
        $lig = isset($_POST['id_liga']) ? $_POST['id_liga'] : '';
        $est = isset($_POST['estadio']) ? $_POST['estadio'] : '';
        $ciu = isset($_POST['ciudad']) ? $_POST['ciudad'] : '';
        $man = isset($_POST['id_manager']) ? $_POST['id_manager'] : '';
        $fun = isset($_POST['fundacion_equipo']) ? $_POST['fundacion_equipo'] : '';
        if ($nom != null) {
            if ($img == null) {
                $img = 'img/equipos/placeholder_equipo.png';
            }
            $sql = "insert into t_equipos(nombre_equipo, ruta_img_equipo, id_liga, estadio, ciudad, id_manager, fundacion_equipo) Value('$nom','$img','$lig','$est','$ciu','$man','$fun')";
            mysqli_query($cone, $sql);
            $pagina_anterior = $lig;
            header("location:liga.php?id=$pagina_anterior");
            ob_end_flush();
        }
        ?>
    </div>
    </main>

    <footer>
        <div class="container">
            <p>&copy; 2024 Béisbol Venezolano</p>
        </div>
    </footer>
</body>

</html>