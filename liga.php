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
    <?php
    if (isset($_GET['id'])) {
        $id = mysqli_real_escape_string($cone, $_GET['id']);
        $sql_equipos = "SELECT 
                            e.*,
                            m.nombre_manager AS nombre_manager
                            FROM 
                                t_equipos e
                            INNER JOIN 
                                t_manager m ON e.id_manager = m.id_manager
                            WHERE 
                            e.id_liga = $id";
        $resultado_equipo = mysqli_query($cone, $sql_equipos);
        $sql_liga = "SELECT
                        l.*,
                        (SELECT COUNT(*) FROM t_equipos e WHERE e.id_liga = l.id_liga) AS total_equipos
                        FROM
                            t_ligas l
                        WHERE
                            l.id_liga = $id";;
        $resultado_liga = mysqli_query($cone, $sql_liga);
    } else {
        echo "<h1>Error: ID de liga faltante.</h1>";
    }
    $row_liga = mysqli_fetch_assoc($resultado_liga);
    ?>

    <main>
        <div class="contenedor">
            <a href="ligas.php">
                <div class="button-container button-container-texto">
                    <img src="img/atras.jpg" width="40" height="40">
                    <span>Volver</span>
                </div>
            </a>
        </div>
        <div class="container">
            <section class="tabla-container">
                <table>

                    <tr>
                        <td>
                            <img src="<?php echo $row_liga["ruta_img_liga"]; ?>" width="150" height="150">
                        </td>
                        <td>
                            <h2><?php echo $row_liga["nombre_liga"]; ?></h2>
                            <p>Año de fundación: <?php echo $row_liga["fundacion_liga"]; ?></p>
                            <p>Numero de equipos: <?php echo $row_liga["total_equipos"]; ?> </p>
                        </td>
                        <td>
                            <?php
                            if ($permiso == 2) {
                                echo '<div class="botones-tarjeta">
                                    <a href="editar_liga.php?id=' . $row_liga["id_liga"] . '">
                                    <img src="img/editar_liga.jpg">
                                    </a>
                                    </div>';
                            }
                            if ($permiso == 3) {
                                echo '<div class="botones-tarjeta">
                                    <a href="editar_liga.php?id=' . $row_liga["id_liga"] . '">
                                    <img src="img/editar_liga.jpg">
                                    </a>
                                    <a href="eliminar_liga.php?id=' . $row_liga["id_liga"] . '">
                                    <img src="img/eliminar_liga.jpg">
                                    </a>
                                    </div>';
                            }
                            ?>
                        </td>
                    </tr>
                </table>
                <table>
                    <thead>
                        <tr>
                            <th></th>
                            <th>Nombre</th>
                            <th>Estadio</th>
                            <th>Manager</th>
                            <?php
                            if ($permiso >= 2) {
                                echo '<th>Acciones</th>';
                            }
                            ?>
                        </tr>
                    </thead>
                    <tbody>
                        <?php while ($row_equipo = mysqli_fetch_assoc($resultado_equipo)) { ?>
                            <tr>
                                <td>
                                    <a href="equipo.php?id=<?php echo $row_equipo["id_equipo"]; ?>">
                                        <img src="<?php echo $row_equipo["ruta_img_equipo"]; ?>" width="60" height="60">
                                    </a>
                                </td>
                                <td>
                                    <a href="equipo.php?id=<?php echo $row_equipo["id_equipo"]; ?>">
                                        <b><?php echo $row_equipo["nombre_equipo"]; ?></b>
                                    </a>
                                </td>
                                <td>
                                    <?php echo $row_equipo["estadio"]; ?>
                                </td>
                                <td>
                                    <?php echo $row_equipo["nombre_manager"]; ?>
                                </td>
                                <?php
                                if ($permiso == 2) {
                                    echo '<td class="botones-tarjeta">
                                            <a href="editar_equipo.php?id=' . $row_equipo["id_equipo"] . '">
                                            <img src="img/editar_equipo.jpg">
                                            </a>
                                            </td>';
                                }
                                if ($permiso == 3) {
                                    echo '<td class="botones-tarjeta">
                                            <a href="editar_equipo.php?id=' . $row_equipo["id_equipo"] . '">
                                            <img src="img/editar_equipo.jpg">
                                            </a>
                                            <a href="eliminar_equipo.php?id=' . $row_equipo["id_equipo"] . '">
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
            <p>&copy; 2024 Béisbol Venezolano</p>
        </div>
    </footer>
</body>

</html>