function normalizeZero(v)
{
	if ( parseInt(v,10) <= 9)
		return "0"+v;
	return v;
}

function timeToMin(time)
{
	var h = parseInt(time.substr(0,2),10);
	var m = parseInt(time.substr(3,2),10);
	return (h*60+m);
}

function minToTime(min)
{
	var hour = 0;
	if(min > 0)
		while((min - 60) >= 0)
		{
			min-=60;
			hour++;
		}
	min  = normalizeZero(min);
	hour = normalizeZero(hour);
	return hour+":"+min
}

function timeAdd (time1, time2)
{
	hour = parseInt(time1.substr(0,2), 10) + parseInt(time2.substr(0,2), 10);
	min = parseInt(time1.substr(3,2), 10) + parseInt(time2.substr(3,2), 10);
  			
	if (min>=60) { min = -(60 - min); hour = hour+1; }
	if (hour>=24) { hour = -(24 - hour); }
	if (min<=9) { min="0"+min; }
	if (hour<=9) { hour="0"+hour; }
	
	return hour+":"+min;
}

