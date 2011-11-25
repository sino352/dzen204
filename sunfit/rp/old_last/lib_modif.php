<?php
function getLesson($id)
{
	global $db;
	$fnk_result = array();
	
	$query = "SELECT `name`, `duration` FROM `lessons` WHERE `lid` = '".mysql_real_escape_string( trim($id) )."'";

	$result = mysql_query($query) or die (OUT(mysql_error()));
	$row = mysql_fetch_array($result, MYSQL_ASSOC);
	//TODO if (mysql result count) != 1 then ERROR
		
	return $row;
}

?>