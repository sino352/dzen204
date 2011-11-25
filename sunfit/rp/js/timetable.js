$(function(){


function BuildTrainersList ()
{
}

function BuildLessonsList ()
{
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

function minToTime(min)
{
	var hour = 0;
	if(min > 0)
		while((min - 60) >= 0)
		{
			min-=60;
			hour++;
		}
	if (min<=9) { min="0"+min; }
	if (hour<=9) { hour="0"+hour; }
	return hour+":"+min
}


var js_data = null;

function FillTable(hall)
{
	//var table = $('<table border="1" width="700px" height="870px"></table>')
	//var row = $('<tr></tr>')
	
	var dayIndex = 0;
	//days
	if ( js_data != null)
	jQuery.each(js_data, function(k, v) 
	{
//	alert('#t'+hall+'day' + dayIndex)
		$('#t'+hall+'day' + dayIndex).empty();
		
		//date for day
		//$('#t'+hall+'day' + dayIndex).append($('<div class="day"></div>').append($('<a href="http://rp.sunfit.com.ua/#">'+k+'</a>')))

		if ( v.length != null )
			//for each lesson
			jQuery.each(v, function() 
			{
				var time = $('<p class="view-field view-data-node-data-field-time-start-field-time-start-value"></p>')
				.append($('<a href=""></a>').append($('<span class="date-display-start"></span>').text(this.time_start + ' - ' + timeAdd( this.time_start, minToTime(this.length) ))))
				
				var title = $('<p class="view-field view-data-node-data-field-classes-field-classes-nid"></p>').append($('<a href=""></a>').text(this.training_name))
				var trainer = $('<p class="view-field view-data-node-data-field-teacher-field-teacher-uid"></p>').append($('<a href=""></a>').text(this.trainer))
			
				var element = $('<div class="calendar weekview schedule-block-style19" style="background:#' + this.color + ';position:absolute;height:'+this.length+'px"></div>').css('top', TimeToOffset(this.time_start))
					.append($('<div class="vertical" style="height:'+this.length+'px;"></div>').append($('<div></div>').append(time).append(title).append(trainer)))
			
				$('#t'+hall+'day' + this.weekday).append(element);
				$('#t'+hall+'day' + this.weekday + '_a').text(this.date.substr(8,2))

			});
		dayIndex++;
		
	});
}

	function BuildTable(id)
	{
		var table = $('<table id="t'+id+'"></table>');
		var thead = $('<thead></thead>').append($('<tr></tr>')
		.append($('<th class="days week" width="1%">время</th>'))
		.append($('<th class="days week" width="13%"></th>').text('Понедельник').append($('<span id="t'+id+'day1_a"></span>')))
		.append($('<th class="days week" width="13%"></th>').text('Вторник').append($('<span id="t'+id+'day1_a"></span>')))
		.append($('<th class="days week" width="13%"></th>').text('Среда').append($('<span id="t'+id+'day1_a"></span>')))
		.append($('<th class="days week" width="13%"></th>').text('Четверг').append($('<span id="t'+id+'day1_a"></span>')))
		.append($('<th class="days week" width="13%"></th>').text('Пятница').append($('<span id="t'+id+'day1_a"></span>')))
		.append($('<th class="days week" width="13%"></th>').text('Суббота').append($('<span id="t'+id+'day1_a"></span>')))
		.append($('<th class="days week" width="13%"></th>').text('Воскресенье').append($('<span id="t'+id+'day1_a"></span>')))
		)
		var tr = $('<tr class="odd"></tr>')
		
		var timeTd = $('<td class="week"></td>');
		
		var timer = '07:30';
		for(i=1; i<66; i++)
		{
			
			var interval = 'interval';
			if(i%2 == 0) 
			{
				var interval = interval + " zero";
			}
			timeTd.append($('<span class="' + interval + '" />').text(timer)).append($('<br />'))
			timer = timeAdd( timer, "00:15");
		}
		
		tr.append(timeTd);
		
		for(i=0; i<7; i++)
		{
			tr.append($('<td></td>').append($('<div id="t'+id+'day'+i+'" class="inner" style="position:relative;"></div>')))
		}
		
		table.append(thead).append($('<tbody></tbody>').append(tr))
		
		$('#timeTableContainer').append($('<div class="calendar-calendar"></div>').append('<div class="week-view"></div>')
		.append(table)
		.append($('<table id="t'+id+'header-fixed"></table>')
			.css('position','fixed')
			.css('top', '0px')
			.css('display','none')
			.css('width', '1200px')));

//    background-color:white;


		
		var tableOffsetTop = $("#t"+id).offset().top;
		var tableOffsetBottom = $("#t"+id).offset().top + $("#t"+id).height() - 20;
		var $header = $("#t"+id+" > thead").clone();
		var $fixedHeader = $("#t"+id+"header-fixed").append($header);

		$(window).bind("scroll", function() {
		    var offset = $(this).scrollTop();

	    
		    if (offset >= tableOffsetTop && $fixedHeader.is(":hidden") && offset <tableOffsetBottom) {
		        $fixedHeader.show();
		    }
		    else if (offset < tableOffsetTop || offset >tableOffsetBottom) {
		        $fixedHeader.hide();
		    }
		});
	
	}

	function TimeToOffset(time)
	{
		var h = time.substr(0,2) - 7;
		var m = time.substr(3,2) - 30;
		return (h*60+m);
	}

	function getTableContent(id)
	{
		var trainer = $("#trainers option:selected").val()
		var lesson = $("#lessons option:selected").val()

		$.getJSON('table_create.php',
		{'m':'table', 'hall':id, 'trainer': trainer, 'lesson':lesson},
		function(vv)
		{
			js_data = vv;
			FillTable(id);
		});


	}
	
	function getTrainers()
	{
		$.getJSON('table_create.php',
		{m:'trainers'},
		function(vv)
		{	
			jQuery.each(vv, function(k, v) {
				$('#trainers').append($('<option value="'+k+'">'+v+'</option>'));
			});
			
		});
	}
	
	function getLessons()
	{
		$.getJSON('table_create.php',
		{m:'lessons'},
		function(vv)
		{	
			jQuery.each(vv, function(k, v) {
				$('#lessons').append($('<option value="'+k+'">'+v+'</option>'));
			});
		});
	}
	
	$("#msg").ajaxError(function(event, request, settings, exception){
		$(this).append("<li>Error requesting page " + settings.url + " = "+ exception+"</li>");
	});
	
	$('#timeTableContainer').append('<div class="header"><h2><a href="http://rp.sunfit.com.ua/#" title="">Большой зал</a></h2></div>')
	BuildTable(1);
	$('#timeTableContainer').append('<div class="header"><h2><a href="http://rp.sunfit.com.ua/#" title="">Малый зал</a></h2></div>')
	BuildTable(2);
	
	getTrainers();
	getLessons();
	getTableContent(1);
	getTableContent(2);
	
	$("select").change(function () {
		getTableContent(1);
		getTableContent(2);
	});

});