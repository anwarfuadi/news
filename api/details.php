<?php
header('Content-Type: application/json');
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Access-Control-Allow-Origin, Accept");
include "../api/db.php";

$id = (int) $_POST['id'];

$stmt = $db->prepare("SELECT * FROM news WHERE id = ?");
$stmt->execute([$id]);
$result = $stmt->fetch(PDO::FETCH_ASSOC);

echo json_encode([
'result' => $result
]);

?>