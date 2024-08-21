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
    session_start();
    $permiso = $_SESSION['nivel_permiso'];
    ?>
    <?php
    $sql = "SELECT e.*, l.nombre_liga, m.nombre_manager
                FROM t_equipos e
                INNER JOIN t_ligas l ON e.id_liga = l.id_liga
                INNER JOIN t_manager m ON e.id_manager = m.id_manager;";

    $resultado = mysqli_query($cone, $sql);
    ?>
    <main>
        <div class="container">
            <h2>Todos los equipos</h2>
            <section class="tabla-container">
                <table>
                    <thead>
                        <tr>
                            <th></th>
                            <th>Nombre</th>
                            <th>Liga</th>
                            <th>Estadio</th>
                            <th>Manager</th>
                            <?php
                            if ($permiso != 1) {
                                echo '<th>Acciones</th>';
                            }
                            ?>
                        </tr>
                    </thead>
                    <tbody>
                        <?php while ($row = mysqli_fetch_assoc($resultado)) { ?>
                            <tr>
                                <td>
                                    <a href="equipo.php?id=<?php echo $row["id_equipo"]; ?>">
                                        <img src="<?php echo $row["ruta_img_equipo"]; ?>" width="60" height="60">
                                    </a>
                                </td>
                                <td>
                                    <a href="equipo.php?id=<?php echo $row["id_equipo"]; ?>">
                                        <b><?php echo $row["nombre_equipo"]; ?></b>
                                    </a>
                                </td>
                                <td>
                                    <a href="liga.php?id=<?php echo $row["id_liga"]; ?>">
                                        <b><?php echo $row["nombre_liga"]; ?></b>
                                    </a>
                                </td>
                                <td>
                                    <?php echo $row["estadio"]; ?>
                                </td>
                                <td>
                                    <?php echo $row["nombre_manager"]; ?>
                                </td>
                                <?php
                                if ($permiso == 2) {
                                    echo '<td class="botones-tarjeta">
                                            <a href="editar_equipo.php?id=' . $row["id_equipo"] . '">
                                            <img src="img/editar_equipo.jpg">
                                            </a>
                                            </td>';
                                }
                                if ($permiso == 3) {
                                    echo '<td class="botones-tarjeta">
                                            <a href="editar_equipo.php?id=' . $row["id_equipo"] . '">
                                            <img src="img/editar_equipo.jpg">
                                            </a>
                                            <a href="eliminar_equipo.php?id=' . $row["id_equipo"] . '">
                                            <img src="img/eliminar_equipo.jpg">
                                            </a>
                                            </td>';
                                }
                                ?>
                            </tr>

                        <?php } ?>
                    </tbody>
                </table>
            </section>
        </div>
        <div class="contenedor">
            <?php
            if ($permiso >= 2) {
                echo '<a href="insertar_equipo.php">
                    <div class="button-container button-container-texto">
                    <img src="img/insertar_equipo.jpg" width="40" height="40">
                    <span>Insertar equipo</span>
                    </div>
                    </a>';
            }
            ?>
            </a>
        </div>

    </main>
    <footer>
        <div class="container">
            <p>&copy; 2024 Beisbol DB</p>
        </div>
    </footer>
</body>

</html>