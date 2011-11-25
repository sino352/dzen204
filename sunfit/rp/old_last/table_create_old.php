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
		$where .= " AND `trainings`.`id` ='" . mysql_real_escape_string( trim($_GET['trainer']) ) . "'";
	if ( isset($_GET['lesson']) && ($_GET['lesson'] != 'NULL'))
		$where .= " AND `trainings`.`id` ='" . mysql_real_escape_string( trim($_GET['lesson']) ) . "'";

	$res = json_encode(getTimeTableForWeek("'".$_GET['pikDate']."'", $where));
	OUT($res);
	echo $res;
}
elseif ( isset($_GET['m']) && ($_GET['m'] == 'trainers') )
{
	//OUT(json_encode(getTrainers()));
	echo json_encode(getTrainers());
}
elseif ( isset($_GET['m']) && ($_GET['m'] == 'lessons') )
{
	echo json_encode(getLessons());
}


//OUT($_REQUEST);


//print_r(getTimeTableForWeek("'2011-04-15'"));

?>