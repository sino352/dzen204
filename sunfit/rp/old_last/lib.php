<?php

// get timetable for week of pointed day
function getTimeTableForWeek($date, $filter)
{
	global $db;
	$fnk_result = array(array(),array(),array(),array(),array(),array(),array());
	
	//$query = "SELECT *, WEEKDAY(`date`) as `weekday`, WEEK(`date`,1) as `week` FROM `training_times` WHERE WEEK(`date`,1) = WEEK($date,1) ORDER BY `date`";
	/*
	$query = "SELECT `training_times`.`id`, `date`, DATE_FORMAT(`time_start`, '%H:%i') as time_start, `length`, DATE_FORMAT(`time_end`, '%H:%i') as time_end, `hall`, `trainer`, `training_name`, `color`,
WEEKDAY(`date`) as `weekday`, WEEK(`date`,1) as `week` 
FROM `training_times` JOIN (`trainings`) ON (`trainings`.`id` = `training_id`) 
WHERE WEEK(`date`,1) = WEEK($date,1)  $filter ORDER BY `date` ";
*/
$query = "SELECT tt.id, tt.date, WEEKDAY(tt.`date`) as `weekday`, DATE_FORMAT(tt.`time_start`, '%H:%i') as time_start, DATE_FORMAT(tt.`time_end`, '%H:%i') as time_end, tt.hall, tr.name as trainer_name, tr.phone, le.name as lesson_name, le.color
FROM `training_times` as tt JOIN (`trainers` as tr, `lessons` as le) ON ( tt.trainer = tr.tid AND tt.lesson = le.lid)
WHERE WEEK(`date`,1) = WEEK($date,1)  $filter ORDER BY `date`";

//OUT($query);

	$result = mysql_query($query) or die (OUT(mysql_error()));
	while( $row = mysql_fetch_array($result, MYSQL_ASSOC) )
	{
		$fnk_result[$row['date']][] = $row;
	}
	return $fnk_result;
}

function getTrainers()
{
	global $db;
	$fnk_result = array();
	
	$query = "SELECT DISTINCT `tid`, `name` FROM `trainers` ORDER BY `name`";

	$result = mysql_query($query) or die (OUT(mysql_error()));
	while( $row = mysql_fetch_array($result, MYSQL_ASSOC) )
	{
		$fnk_result[$row['tid']] = $row['name'];
	}
	return $fnk_result;
}

function getLessons()
{
	global $db;
	$fnk_result = array();
	
	$query = "SELECT `lid`, `name` FROM `lessons` ORDER BY `name`";

	$result = mysql_query($query) or die (OUT(mysql_error()));
	while( $row = mysql_fetch_array($result, MYSQL_ASSOC) )
	{
		$fnk_result[$row['lid']] = $row['name'];
	}
	return $fnk_result;
}


function OUT($s)
{
    $handle = fopen("errors.txt", 'a');
//    if(type($s) == 'array')
    	fwrite($handle, json_encode($s)."\n");
//   else
//		fwrite($handle, $s."\n");
    fclose($handle);
}

?>