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
    <main>
        <div class="container">
            <h2>Inicio de sesion</h2>
            <section class="tarjeta-container">
                <div class="tarjeta">
                    <form method="post" action="login.php">

                        <?php
                        if (isset(($_GET['error']))) {
                        ?>
                            <p class="error">
                                <?php echo $_GET['error'] ?>
                            </p>
                        <?php
                        }
                        ?>

                        <label for="nombre_usuario">Nombre de usuario:</label>
                        <input type="text" id="nombre_usuario" name="nombre_usuario" required>

                        <label for="password">Contraseña:</label>
                        <input type="password" id="password" name="password" required>

                        <div class="button-container">
                            <div class="elemento-izquierda elemento-izquierda-texto">
                                <img src="img/iniciar_sesion.jpg" width="40" height="40">
                                <button type="submit" name="" value="iniciar_sesion">Iniciar sesión</button>
                            </div>
                            <div class="elemento-izquierda elemento-izquierda-texto">
                                <img src="img/insertar_jugador.jpg" width="40" height="40">
                                <a href="crear_usuario.html"><button type="button">Crear usuario</button></a>
                            </div>
                        </div>
                    </form>
                </div>
            </section>
        </div>
    </main>

    <footer>
        <div class="container">
            <p>&copy; 2024 Béisbol Venezolano</p>
        </div>
    </footer>
</body>

</html>