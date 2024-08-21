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

    if (isset($_GET['id'])) {
        $id = mysqli_real_escape_string($cone, $_GET['id']);

        $sql_equipos = "SELECT 
                                e.*, 
                                m.nombre_manager AS nombre_manager,
                                m.fecha_nacimiento_manager,
                                m.nacionalidad_manager,
                                l.nombre_liga AS nombre_liga
                            FROM 
                                t_equipos e
                            INNER JOIN 
                                t_manager m ON e.id_manager = m.id_manager
                            INNER JOIN 
                                t_ligas l ON e.id_liga = l.id_liga
                            WHERE 
                                e.id_equipo = $id";

        $resultado_equipo = mysqli_query($cone, $sql_equipos);
        $row_equipos = mysqli_fetch_assoc($resultado_equipo);
        $pagina_anterior = $row_equipos["id_liga"];



        $sql_jugadores = "SELECT * FROM t_jugadores WHERE id_equipo = $id";
        $resultado_jugadores = mysqli_query($cone, $sql_jugadores);

        $sql_contar_jugadores = "SELECT COUNT(*) AS total_jugadores FROM t_jugadores WHERE id_equipo = $id";
        $resultado_contar_jugadores = mysqli_query($cone, $sql_contar_jugadores);
        $row_contar_jugadores = mysqli_fetch_assoc($resultado_contar_jugadores);
        $total_jugadores = $row_contar_jugadores['total_jugadores'];

        $sql_campeonatos = "SELECT c.nombre_campeonato, MAX(ec.numero_campeonatos) AS numero_veces
                   FROM t_equipo_campeonato ec
                   INNER JOIN t_campeonatos c ON ec.id_campeonato = c.id_campeonato
                   WHERE ec.id_equipo = $id
                   GROUP BY c.nombre_campeonato";
        $resultado_campeonatos = mysqli_query($cone, $sql_campeonatos);
    } else {
        echo "<h1>Error: ID de Equipo faltante.</h1>";
    }
    ?>

    <main>
        <div class="contenedor">
            <a href="liga.php?id=<?php echo $pagina_anterior; ?>">
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
                            <img src="<?php echo $row_equipos["ruta_img_equipo"]; ?>" width="150" height="150">
                        </td>
                        <td>
                            <h2><?php echo $row_equipos["nombre_equipo"]; ?></h2>
                            <p>Año de fundación: <?php echo $row_equipos["fundacion_equipo"]; ?></p>
                            <p>Estadio: <?php echo $row_equipos["estadio"]; ?>, <?php echo $row_equipos["ciudad"]; ?> </p>
                            <p>Liga: <b><a href="liga.php?id=<?php echo $row_equipos["id_liga"]; ?>"><?php echo $row_equipos["nombre_liga"]; ?></p></b></a>
                            <p>Campeonatos:</p>
                            <?php while ($row_campeonatos = mysqli_fetch_assoc($resultado_campeonatos)) { ?>
                                <p><?php echo $row_campeonatos['nombre_campeonato']; ?> (x<?php echo $row_campeonatos['numero_veces']; ?>)</p>
                            <?php } ?>
                            <p>Numero de jugadores: <?php echo $total_jugadores; ?></p>
                        </td>
                        <?php
                        if ($permiso == 2) {
                            echo '<td class="botones-tarjeta">
                                    <a href="editar_equipo.php?id=' . $row_equipos["id_equipo"] . '">
                                    <img src="img/editar_equipo.jpg">
                                    </a>
                                    </td>';
                        }
                        if ($permiso == 3) {
                            echo '<td class="botones-tarjeta">
                            <a href="editar_equipo.php?id=' . $row_equipos["id_equipo"] . '">
                            <img src="img/editar_equipo.jpg">
                            </a>
                            <a href="eliminar_equipo.php?id=' . $row_equipos["id_equipo"] . '">
                            <img src="img/eliminar_equipo.jpg">
                            </a>
                            </td>';
                        }
                        ?>
                    </tr>
                </table>
                <table>
                    <thead>
                        <tr>
                            <th></th>
                            <th>Nombre</th>
                            <th>Fecha de nacimiento</th>
                            <th>Nacionalidad</th>
                            <th>Posición</th>
                            <?php
                            if ($permiso >= 2) {
                                echo '<th>Acciones</th>';
                            }
                            ?>
                        </tr>
                    </thead>
                    <tbody>
                        <?php while ($row_jugadores = mysqli_fetch_assoc($resultado_jugadores)) { ?>
                            <tr>
                                <td>
                                    <a href="jugador.php?id=<?php echo $row_jugadores["id_jugador"]; ?>">
                                        <b><?php echo $row_jugadores["numero"]; ?></b>
                                    </a>
                                </td>
                                <td>
                                    <a href="jugador.php?id=<?php echo $row_jugadores["id_jugador"]; ?>">
                                        <b><?php echo $row_jugadores["nombre_jugador"]; ?></b>
                                    </a>
                                </td>
                                <td>
                                    <?php echo $row_jugadores["fecha_nacimiento_jugador"]; ?>
                                </td>
                                <td>
                                    <img src="img/banderas/<?php echo strtolower($row_jugadores['nacionalidad_jugador']) . '.png'; ?>" height="20" alt="<?php echo $row_jugadores['nacionalidad_jugador']; ?>">
                                </td>
                                <td>
                                    <?php echo $row_jugadores["posicion"]; ?>
                                </td>
                                <?php
                                if ($permiso == 2) {
                                    echo '<td class="botones-tarjeta">
                                            <a href="editar_jugador.php?id=' . $row_jugadores["id_jugador"] . '">
                                            <img src="img/editar_jugador.jpg">
                                            </a>
                                            </td>';
                                }
                                if ($permiso == 3) {
                                    echo '<td class="botones-tarjeta">
                                            <a href="editar_jugador.php?id=' . $row_jugadores["id_jugador"] . '">
                                            <img src="img/editar_jugador.jpg">
                                            </a>
                                            <a href="eliminar_jugador.php?id=' . $row_jugadores["id_jugador"] . '">
                                            <img src="img/eliminar_jugador.jpg">
                                            </a>
                                            </td>';
                                }
                                ?>
                            </tr>

                        <?php } ?>
                    </tbody>
                    <thead>
                        <tr>
                            <th></th>
                            <th>Nombre</th>
                            <th>Fecha de nacimiento</th>
                            <th>Nacionalidad</th>
                            <th>Cargo</th>
                            <?php
                            if ($permiso >= 2) {
                                echo '<th>Acciones</th>';
                            }
                            ?>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td></td>
                            <td>
                                <b><?php echo $row_equipos["nombre_manager"]; ?></b>
                            </td>
                            <td>
                                <?php echo $row_equipos["fecha_nacimiento_manager"]; ?>
                            </td>
                            <td>
                                <img src="img/banderas/<?php echo strtolower($row_equipos['nacionalidad_manager']) . '.png'; ?>" height="20" alt="<?php echo $row_equipos['nacionalidad_manager']; ?>">
                            </td>
                            <td>
                                Manager
                            </td>
                            <?php
                            if ($permiso == 2) {
                                echo '<td class="botones-tarjeta">
                                        <a href="editar_manager.php?id=' . $row_equipos["id_manager"] . '">
                                        <img src="img/editar_equipo.jpg">
                                        </a>
                                        </td>';
                            }
                            if ($permiso == 3) {
                                echo '<td class="botones-tarjeta">
                                        <a href="editar_manager.php?id=' . $row_equipos["id_manager"] . '">
                                        <img src="img/editar_jugador.jpg">
                                        </a>
                                        <a href="eliminar_manager.php?id=' . $row_equipos["id_manager"] . '">
                                        <img src="img/eliminar_jugador.jpg">
                                        </a>
                                        </td>';
                            }
                            ?>
                        </tr>
                    </tbody>
                </table>
            </section>
        </div>
        <div class="contenedor">
            <?php
            if ($permiso >= 2) {
                echo '<a href="insertar_jugador.php">
                    <div class="button-container button-container-texto">
                    <img src="img/insertar_jugador.jpg" width="40" height="40">
                    <span>Insertar jugador</span>
                    </div>
                    </a>';
            }
            ?>
            <a href="liga.php?id=<?php echo $pagina_anterior; ?>">
                <div class="button-container button-container-texto">
                    <img src="img/atras.jpg" width="40" height="40">
                    <span>Volver</span>
                </div>
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