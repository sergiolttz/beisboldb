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
    include "nav_liga.php";
    session_start();
    $permiso = $_SESSION['nivel_permiso'];
    ?>

    <main>
        <div class="container">
            <h2>Ligas</h2>
            <section class="tarjeta-container">
                <?php while ($row = mysqli_fetch_assoc($resultado)) { ?>
                    <a href="liga.php?id=<?php echo $row["id_liga"]; ?>">
                        <div class="tarjeta tarjeta_img">
                            <img src="<?php echo $row["ruta_img_liga"]; ?>">
                            <h3><?php echo $row["nombre_liga"]; ?></h3>
                            <?php
                            if ($permiso == 2) {
                                echo '<div class="botones-tarjeta">
                                    <a href="editar_liga.php?id=' . $row["id_liga"] . '">
                                    <img src="img/editar_liga.jpg">
                                    </a>
                                    </div>';
                            }
                            if ($permiso == 3) {
                                echo '<div class="botones-tarjeta">
                                    <a href="editar_liga.php?id=' . $row["id_liga"] . '">
                                    <img src="img/editar_liga.jpg">
                                    </a>
                                    <a href="eliminar_liga.php?id=' . $row["id_liga"] . '">
                                    <img src="img/eliminar_liga.jpg">
                                    </a>
                                    </div>';
                            }
                            ?>

                        </div>
                    </a>
                <?php } ?>
            </section>
        </div>
        <div class="contenedor">
            <?php
            if ($permiso >= 2) {
                echo '<a href="insertar_liga.php">
                    <div class="button-container button-container-texto">
                    <img src="img/insertar_liga.jpg" width="40" height="40">
                    <span>Insertar liga</span>
                    </div>
                    </a>';
            }
            ?>
        </div>

    </main>

    <footer>
        <div class="container">
            <p>&copy; 2024 Beisbol DB</p>
        </div>
    </footer>
</body>

</html>