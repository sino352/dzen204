<?php
/*
WEEK(date)

WEEKDAY(date)

DATE_ADD('2008-01-02', INTERVAL 1 WEEK)

--DAYOFMONTH(date)

<div style="overflow:auto; height:250px; width:300px;">

http://jsfiddle.net/andrewwhitaker/fj8wM/ - fixed table header
*/
//mb_internal_encoding("UTF-8");
header('Content-type: text/html; charset=UTF-8');
include('lib.php');
include('lib_modif.php');

/*
$db_host = "127.0.0.1";
$db_name = "sunfit";
$db_login = "root";
$db_pass = "";
*/
$db_host = "sunfit.mysql.ukraine.com.ua";
$db_name = "sunfit_db";
$db_login = "sunfit_db";
$db_pass = "sunfit09237";

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
	echo json_encode(getLesson($_GET['id']));
}
elseif ( isset($_GET['m']) && ($_GET['m'] == 'create_training') )
{
	$trainer = mysql_real_escape_string( trim($_GET['trainer']) );
	$lesson = mysql_real_escape_string( trim($_GET['lesson']) );
	$date = mysql_real_escape_string( trim($_GET['date']) );
	$hall = mysql_real_escape_string( trim($_GET['hall']) );
	$time_start = mysql_real_escape_string( trim($_GET['time_start']) );
	$time_end = mysql_real_escape_string( trim($_GET['time_end']) );
	
	$query = "INSERT INTO training_times VALUES (NULL, '$date', '$time_start', '$time_end', '$hall', '$trainer', '$lesson')";
	mysql_query($query) or die (OUT(mysql_error()));
	$error = mysql_error();
	$error = ($error == "")?"Success":$error;
	echo json_encode(array('error'=> $error));
}
elseif ( isset($_GET['m']) && ($_GET['m'] == 'create_lesson') )
{
	$name = mysql_real_escape_string( trim($_GET['name']) );
	$color = mysql_real_escape_string( trim($_GET['color']) );
	$duration = mysql_real_escape_string( trim($_GET['duration']) );
	
	$query = "INSERT INTO lessons VALUES (NULL, '$name', '$duration', '$color')";
	mysql_query($query) or die (OUT(mysql_error()));
	$error = mysql_error();
	$error = ($error == "")?"Success":$error;
	echo json_encode(array('error'=> $error));
}
elseif ( isset($_GET['m']) && ($_GET['m'] == 'create_trainer') )
{
	$name = mysql_real_escape_string( trim($_GET['name']) );
	$phone = mysql_real_escape_string( trim($_GET['phone']) );
	
	$query = "INSERT INTO trainers VALUES (NULL, '$name', '$phone')";
	mysql_query($query) or die (OUT(mysql_error()));
	$error = mysql_error();
	$error = ($error == "")?"Success":$error;
	echo json_encode(array('error'=> $error));
}





function normalizeZero($v)
{
	if ( $v <= 9)
		return "0".$v;
	return $v;
}

//OUT($_REQUEST);


//print_r(getTimeTableForWeek("'2011-04-15'"));

?>