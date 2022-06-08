<?php
header('Content-Type: application/json');
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Access-Control-Allow-Origin, Accept");
include "../api/db.php";

$id = $_POST['id'];
$title = $_POST['title'];
$subTitle = $_POST['subTitle'];
$imagePath = $_POST['imgPath'];
$news = $_POST['news'];

$stmt = $db->prepare("UPDATE news SET title=?, subTitle=?, imgPath=?, news=? WHERE id=?");
$result = $stmt->execute([$title, $subTitle, $imagePath, $news, $id]);

echo json_encode([
'success' => $result
]);

?>