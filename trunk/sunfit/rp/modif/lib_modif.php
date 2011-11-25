<?php
function getLesson($id)
{
	global $db;
	$fnk_result = array();
	
	$query = "SELECT `lid` as id, `name`, `color`, `duration` FROM `lessons` WHERE `lid` = '".mysql_real_escape_string( trim($id) )."'";

	$result = mysql_query($query) or die (OUT(mysql_error()));
	$row = mysql_fetch_array($result, MYSQL_ASSOC);
	//TODO if (mysql result count) != 1 then ERROR
		
	return $row;
}

function getTraining($id)
{
	global $db;
	
$query = "SELECT tt.id, tt.date, WEEKDAY(tt.`date`) as `weekday`, DATE_FORMAT(tt.`time_start`, '%H:%i') as time_start, DATE_FORMAT(tt.`time_end`, '%H:%i') as time_end, tt.hall, tt.trainer, tt.lesson, tr.name as trainer_name, tr.phone, le.name as lesson_name, le.color
FROM `training_times` as tt JOIN (`trainers` as tr, `lessons` as le) ON ( tt.trainer = tr.tid AND tt.lesson = le.lid)
WHERE tt.id = $id";

//OUT($query);

	$result = mysql_query($query) or die (OUT(mysql_error()));
	$row = mysql_fetch_array($result, MYSQL_ASSOC);
	//TODO if (mysql result count) != 1 then ERROR

	return $row;
}
?>