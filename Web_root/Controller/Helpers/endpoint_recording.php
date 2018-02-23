<?PHP
include "D:\\xampp\\htdocs\\wa\\config.php";

header('Cache-Control: no-cache');
error_reporting (0);

$fname = $_REQUEST["fname"];
// $reqID = $_REQUEST["reqID"];
echo "$Audio_Processing_Dir";
// echo $Audio_Processing_Dir."endpoint.bat ".$fname;
$WshShell = new COM("WScript.Shell");
$oExec = $WshShell->Run($Audio_Processing_Dir."endpoint2.bat " . $Audio_Processing_Dir ." ".$fname, 7, false); 
var_dump($$oExec);
?>
