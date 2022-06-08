<?php
header('Content-Type: application/json');
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Access-Control-Allow-Origin, Accept");
include "../api/db.php";


$title = $_POST['title'];
$subTitle = $_POST['subTitle'];
$imagePath = $_POST['imgPath'];
$news = $_POST['news'];

$stmt = $db->prepare("INSERT INTO news (title, subTitle, imgPath, news) VALUES (?, ?, ?, ?)");
$result = $stmt->execute([$title, $subTitle, $imagePath, $news]);

echo json_encode([
'success' => $result
]);

?>