<?php
header("Content-Type: application/json");

function conectarBanco()
{
    $host = "localhost";
    $db   = "invencivel";
    $user = "root";
    $pass = "root";

    try {
        $pdo = new PDO("mysql:host=$host;dbname=$db;charset=utf8", $user, $pass);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return $pdo;
    } catch (PDOException $e) {
        echo json_encode(["erro" => $e->getMessage()]);
        exit;
    }
}

$rota   = $_GET['rota'] ?? '';
$metodo = $_SERVER['REQUEST_METHOD'];
$pdo    = conectarBanco();

// -------------------- ROTAS ---------------------
if ($rota === "usuarios" && $metodo === "GET") {
    // SELECT * FROM usuarios
    $sql = $pdo->query("SELECT id, nome, email FROM usuarios");
    $usuarios = $sql->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($usuarios);
} elseif (preg_match("#^usuarios/([0-9]+)$#", $rota, $matches) && $metodo === "GET") {
    // SELECT * FROM usuarios WHERE id = ?
    $id = $matches[1];
    $sql = $pdo->prepare("SELECT id, nome, email FROM usuarios WHERE id = ?");
    $sql->execute([$id]);
    $usuario = $sql->fetch(PDO::FETCH_ASSOC);
    echo json_encode($usuario ?: ["erro" => "Usuário não encontrado"]);
} elseif ($rota === "cadastroUsuario" && $metodo === "POST") {
    // Pega JSON do body
    $dados = json_decode(file_get_contents("php://input"), true);
    $sql = $pdo->prepare("INSERT INTO usuarios (nome, email) VALUES (?, ?)");
    $sql->execute([$dados["nome"], $dados["email"]]);

    echo json_encode(["msg" => "Usuário cadastrado com sucesso"]);
} else {
    http_response_code(404);
    echo json_encode(["erro" => "Rota não encontrada"]);
}
