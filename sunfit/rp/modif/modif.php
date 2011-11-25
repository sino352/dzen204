<?php
//mb_internal_encoding("UTF-8");
header('Content-type: text/html; charset=UTF-8');
include('../lib.php');
include('lib_modif.php');


$db_host = "127.0.0.1";
$db_name = "sunfit";
$db_login = "root";
$db_pass = "qwe";
/*
$db_host = "sunfit.mysql.ukraine.com.ua";
$db_name = "sunfit_db";
$db_login = "sunfit_db";
$db_pass = "sunfit09237";
*/
$db = mysql_connect( $db_host, $db_login, $db_pass ) or die ( mysql_error() );
if ( !mysql_select_db( $db_name, $db ) )
{
	echo "Error: select db fail";
}
mysql_query("SET NAMES 'utf8'");

if ( isset($_GET['m']) && ($_GET['m'] == 'table') )
{
	$where = " AND `hall` = '" . mysql_real_escape_string( trim($_GET['hall']) ) . "'";
	if ( isset($_GET['trainer']) && ($_GET['trainer'] != 'NULL'))
		$where .= " AND tr.tid ='" . mysql_real_escape_string( trim($_GET['trainer']) ) . "'";
	if ( isset($_GET['lesson']) && ($_GET['lesson'] != 'NULL'))
		$where .= " AND le.lid ='" . mysql_real_escape_string( trim($_GET['lesson']) ) . "'";

	$res = json_encode(getTimeTableForWeek("'".$_GET['pikDate']."'", $where));
	//OUT($res);
	echo $res;
}
elseif ( isset($_GET['m']) && ($_GET['m'] == 'trainers') )
{
	echo json_encode(getTrainers());
}
elseif ( isset($_GET['m']) && ($_GET['m'] == 'lessons') )
{
	echo json_encode(getLessons());
}
elseif ( isset($_GET['m']) && ($_GET['m'] == 'lesson') )
{
	$id = mysql_real_escape_string( trim($_GET['id']) );
	echo json_encode(getLesson($id));
}
elseif ( isset($_GET['m']) && ($_GET['m'] == 'training') )
{
	$id = mysql_real_escape_string( trim($_GET['id']) );
	echo json_encode(getTraining($id));
}
elseif ( isset($_GET['m']) && ($_GET['m'] == 'training_create') )
{
	$trainer = mysql_real_escape_string( trim($_GET['trainer']) );
	$lesson = mysql_real_escape_string( trim($_GET['lesson']) );
	$date = mysql_real_escape_string( trim($_GET['date']) );
	$hall = mysql_real_escape_string( trim($_GET['hall']) );
	$time_start = mysql_real_escape_string( trim($_GET['time_start']) );
	$time_end = mysql_real_escape_string( trim($_GET['time_end']) );
	
	$query = "INSERT INTO training_times VALUES (NULL, '$date', '$time_start', '$time_end', '$hall', '$trainer', '$lesson')";
	mysql_query($query) or die (json_encode(array('error'=> OUT(mysql_error()))));
	echo json_encode(array('error'=> "Success"));
}
elseif ( isset($_GET['m']) && ($_GET['m'] == 'training_save') )
{
	$id = mysql_real_escape_string( trim($_GET['id']) );
	$trainer = mysql_real_escape_string( trim($_GET['trainer']) );
	$lesson = mysql_real_escape_string( trim($_GET['lesson']) );
	$date = mysql_real_escape_string( trim($_GET['date']) );
	$hall = mysql_real_escape_string( trim($_GET['hall']) );
	$time_start = mysql_real_escape_string( trim($_GET['time_start']) );
	$time_end = mysql_real_escape_string( trim($_GET['time_end']) );
	
	if($id != "")
	{
		$query = "UPDATE training_times SET date='$date', time_start='$time_start', time_end='$time_end', hall='$hall', trainer='$trainer', lesson='$lesson' WHERE id=$id";
		mysql_query($query) or die (json_encode(array('error'=> OUT(mysql_error()))));
	}
	echo json_encode(array('error'=> "Success"));
}
elseif ( isset($_GET['m']) && ($_GET['m'] == 'training_delete') )
{
	$id = mysql_real_escape_string( trim($_GET['id']) );
	if($id != "NULL" && $id != "")
	{
		$query = "DELETE FROM training_times WHERE id=$id";
		mysql_query($query) or die (json_encode(array('error'=> OUT(mysql_error()))));
	}
	echo json_encode(array('error'=> "Success"));
}
elseif ( isset($_GET['m']) && ($_GET['m'] == 'lesson_create') )
{
	$name = mysql_real_escape_string( trim($_GET['name']) );
	$color = mysql_real_escape_string( trim($_GET['color']) );
	$duration = mysql_real_escape_string( trim($_GET['duration']) );
	$desc = mysql_real_escape_string( trim($_GET['desc']) );
	
	$query = "INSERT INTO lessons VALUES (NULL, '$name', '$duration', '$color', '$desc')";
	mysql_query($query) or die (json_encode(array('error'=> OUT(mysql_error()))));
	echo json_encode(array('error'=> "Success"));
}
elseif ( isset($_GET['m']) && ($_GET['m'] == 'lesson_delete') )
{
	$id = mysql_real_escape_string( trim($_GET['id']) );
	if($id != "NULL" && $id != "")
	{
		$query = "DELETE FROM lessons WHERE lid=$id";
		mysql_query($query) or die (json_encode(array('error'=> OUT(mysql_error()))));
		echo json_encode(array('error'=> "Success"));
	}
	
	
}
elseif ( isset($_GET['m']) && ($_GET['m'] == 'lesson_save') )
{
	$id = mysql_real_escape_string( trim($_GET['id']) );
	$name = mysql_real_escape_string( trim($_GET['name']) );
	$color = mysql_real_escape_string( trim($_GET['color']) );
	$duration = mysql_real_escape_string( trim($_GET['duration']) );
	$desc = mysql_real_escape_string( trim($_GET['desc']) );
	
	if ($id != 'NULL' && $id != "")
	{
		$query = "UPDATE lessons SET name='$name', duration='$duration', color='$color' WHERE lid=$id";
		mysql_query($query) or die (json_encode(array('error'=> OUT(mysql_error()))));
		echo json_encode(array('error'=> "Success"));
	}
	else
		echo json_encode(array('error'=> "Null id"));
}
elseif ( isset($_GET['m']) && ($_GET['m'] == 'create_trainer') )
{
	$name = mysql_real_escape_string( trim($_GET['name']) );
	$phone = mysql_real_escape_string( trim($_GET['phone']) );
	
	$query = "INSERT INTO trainers VALUES (NULL, '$name', '$phone')";
	mysql_query($query) or die (json_encode(array('error'=> OUT(mysql_error()))));
	echo json_encode(array('error'=> "Success"));
}
elseif ( isset($_GET['m']) && ($_GET['m'] == 'copyweek_copy') )
{
	$weekday = mysql_real_escape_string( trim($_GET['weekday']) );
	$countToAdd = mysql_real_escape_string( trim($_GET['countToAdd']) );
	
	$query = "insert into training_times (`date`,`time_start`, `time_end`, `hall`,
`trainer`, `lesson`)
select
INTERVAL (7*$countToAdd) DAY + `date`,
 `time_start`, `time_end`, `hall`, `trainer`, `lesson`
from training_times
where WEEKOFYEAR(`date`) = WEEKOFYEAR('$weekday')";
	mysql_query($query) or die (json_encode(array('error'=> OUT(mysql_error()))));
	echo json_encode(array('error'=> "Success"));
}



?>