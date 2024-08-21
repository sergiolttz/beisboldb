<?php
require_once 'cone.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nombre_usuario = $_POST['nombre_usuario'];
    $nivel_permiso = $_POST['nivel_permiso'];
    $password = $_POST['password'];
    $sql = "INSERT INTO t_usuarios (nombre_usuario, contrasena, nivel_permiso) VALUES (?, ?, ?)";
    $stmt = $cone->prepare($sql);
    $stmt->bind_param("ssi", $nombre_usuario, $password, $nivel_permiso);

    if ($stmt->execute()) {
        echo "Usuario registrado correctamente";
        header("Location: index.php");
    } else {
        echo "Error al registrar el usuario: " . $stmt->error;
        header("Location: crear_usuario.html");
    }

    $stmt->close();
}
?>

<!DOCTYPE html>