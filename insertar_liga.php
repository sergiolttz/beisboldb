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

    <div class="container">
        <h1>Insertar Liga</h1>
        <section class="tarjeta-container">
            <div class="tarjeta">
                <form method="post">
                    <h3>Nombre</h3><br>
                    <input type="text" name="nombre_liga"><br>
                    <h3>Ruta de la imagen</h3><br>
                    <input type="text" name="ruta_img_liga"><br>
                    <h3>Año de fundación</h3><br>
                    <input type="text" name="fundacion_liga"><br>

                    <div class="button-container">
                        <button type="submit" name="" value="insertar">Insertar</button>
                        <a href="ligas.php"><button type="button">Volver</button></a>
                    </div>
            </div>
            </form>


            <?php
            $nom = isset($_POST['nombre_liga']) ? $_POST['nombre_liga'] : '';
            $img = isset($_POST['ruta_img_liga']) ? $_POST['ruta_img_liga'] : '';
            $fun = isset($_POST['fundacion_liga']) ? $_POST['fundacion_liga'] : '';
            if ($nom != null) {
                if ($img == null) {
                    $img = 'img/ligas/placeholder_liga.png';
                }
                $sql = "insert into t_ligas(nombre_liga, ruta_img_liga, fundacion_liga) Value('$nom','$img','$fun')";
                mysqli_query($cone, $sql);
                if ($nom = 1) {
                    header("location:ligas.php");
                }
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