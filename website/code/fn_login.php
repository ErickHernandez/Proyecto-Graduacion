<?php

$user = $_POST['username'];
$pass = $_POST['password'];

if (empty($user) || empty($pass)) {
    $_POST['authenticated'] = false;
} else {
    $_POST['authenticated'] = true;
}

header("Location: ../index.php?hola");