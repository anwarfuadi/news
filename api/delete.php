<?php
header('Content-Type: application/json');
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Access-Control-Allow-Origin, Accept");
include "../api/db.php";

$id = (int) $_POST['id'];
$stmt = $db->prepare("DELETE FROM news WHERE id = ?");
$result = $stmt->execute([$id]);

echo json_encode([
'id' => $id,
'success' => $result
]);

?>