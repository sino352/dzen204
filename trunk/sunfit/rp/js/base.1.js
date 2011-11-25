var all_photos = $(".iGallery img");
var all_links = $(".iGallery p a");
var total_photos = all_photos.length;
var current_photo = 0;
var tmr;
function next_photo(){
//     console.log("Alalala");
    next_p = current_photo+1 < total_photos ? current_photo+1 : 0;
    $(all_photos[current_photo]).fadeOut(1000);
    $(all_photos[next_p]).fadeIn(1000);
    
    $(all_photos[current_photo]).removeClass("act");
    $(all_photos[next_p]).addClass("act");
    $(all_links[current_photo]).removeClass("act");
    $(all_links[next_p]).addClass("act");
    current_photo = next_p;
//     console.log("Cur:" + current_photo);
    }
animate = function(){
    return false;
    }

$(document).ready(function(){
    // home bg animation;
    if (!$.cookie("home_was")){
        $("#bgplace.home").fadeOut(2000);
        $.cookie("home_was", "1", {path:"/", expires: 0});
        }
    else {
        //$("#bgplace.home").hide();
        }

    var cookie_options = {path:"/", expires: 365};
    var default_theme = "dark";
    var alt_theme = "white";
    var now_theme = "";
    if (!$.cookie("site_theme")){
        $.cookie("site_theme", default_theme, cookie_options);
        now_theme = default_theme;
        }
    else {
        now_theme = $.cookie("site_theme");
        }
    $("body").attr("class", now_theme);
    $("#ch-theme").click(function(){
        $("#bgplace").show();
        $("#bgplace").fadeOut(2000);
        now_theme = now_theme == default_theme ? alt_theme : default_theme;
        $.cookie("site_theme", now_theme, cookie_options);
        $("body").attr("class", now_theme);
        return false;
        }
    ) // click
    // Timer for red-galery
    if ($(".iGallery img").length){
        tmr = setInterval("next_photo()", 3500);
        }

    // MMenu hover
    $("div.menu li:not(.act, .first, .theme)").hover(
        function(){
            $(this).animate({opacity:0.2, paddingTop:5}, 500).animate({opacity:1, paddingTop:9}, 500);
            },
        function(){
//             $(this).animate({opacity:1}, 1000)
            }) // hover
    
    // Homepage promo block
    $(".promo ul li a").each(function(e){
        var this_e = e;
        $(this).click(function(){
            // show loader here
//             var this_a = $(this)
//             this_a.addClass("loading");
            $(".promo ul li.act").removeClass("act");
            $(this).parent().parent().addClass("act");
//             var page_id = this.id.slice(1);
//             $("#ani").load("/ajax/page/"+page_id+"/", function(){this_a.removeClass("loading")});
            to_id = $("#ani"+(this_e+1));
            $("div", to_id).css({marginLeft:-490, opacity:0});
            $("#ani").scrollTo(to_id, 1000, {axis:"y", onAfter:function(){$("div", to_id).animate({"marginLeft":2, "opacity":1}, 333);}});
            return false;
            }) // click
        }) // each

    // Login form
    $("#login_link").click(function(){
        $("#login_form p").fadeIn();
        $(this).hide();
        return false;
        }) // click


    // Photo
    var g_all_photo = $(".detailFoto .items a");
    var g_photo_count = g_all_photo.length;
    if (g_photo_count){
        $.scrollTo("#gallery_begin_there", 1000, {axis:"y"});
        var g_active_photo = 0;
        $("#tablo").load(function(){$(this).fadeIn("slow")});
        function arrow(){
            if (g_active_photo == 0){
                $("#toLeft").hide();
                } // if
            else {
                $("#toLeft").show();
                }
            if (g_active_photo == g_photo_count -1 ){
                $("#toRight").hide();
                } // if
            else {
                $("#toRight").show();
                }
            } // arrow
        arrow();
        g_all_photo.each(function(e){
            var this_e = e;
            $(this).click(function(){
                $("#tablo").hide().attr("src", this.href);
                g_active_photo = this_e;
                $(".detailFoto .items a.act").removeClass("act");
                $(this).addClass("act");
                arrow();
                return false;
                }) // click
            }) // each
        $("#toRight").click(function(){
            $(g_all_photo[g_active_photo+1]).click(); return false;
            })
        $("#toLeft").click(function(){
            $(g_all_photo[g_active_photo-1]).click(); return false;
            })
        $("#tablo").click(function(){
            next_to_show = g_active_photo + 1 == g_photo_count ? 0 : g_active_photo + 1;
            $(g_all_photo[next_to_show]).click();
            })
        } // if

    // FAQ
    $(".faq .question").toggle(
        function(){
            $(this).next().fadeIn("slow");
        }, function(){
            $(this).next().fadeOut("slow");
        })

    // Schedule filter
    var all_schedules = $(".schedule li:not(.head) p span:not(.time):not(:empty)");
    $(".filtr a:not(.first)").click(function(){
        not_filtered = all_schedules.filter(":not(." + this.className+")");
        filtered = all_schedules.filter("."+this.className);
        not_filtered.animate({opacity:0.1}, 250);
        filtered.animate({opacity:1}, 500)
        $(".filtr a.active").removeClass("active");
        $(this).addClass("active");
        return false;
        })
    $(".filtr a.first").click(
        function(){
            $(".filtr a.active").removeClass("active");
            $(".filtr a.first").addClass("active");
            all_schedules.animate({opacity:1},500);
            return false;
            });

    // Show/Hide filter
    $("#showhidefiltr").toggle(function(){
	    $(".filtr").slideUp();
	    $(this).html("Показать фильтр");
	    return false;
	},function(){
	    $(".filtr").slideDown();
	    $(this).html("Спрятать фильтр");
	    return false;
	}); // toggle

    // Instructors
    if ($("ul.instructors li").length){
        var all_people = $("ul.instructors li");
        var all_people_count = all_people.length;
        var current_people = 0;
        if (all_people_count < 4) {
            $("#toLeft, #toRight").hide();
            }
        else {
            $("#toLeft").hide();
            }
        function arrows_visibility(){
            if (current_people != 0 ){$("#toLeft").show();}
            else {$("#toLeft").hide();}
            if (current_people+4 > all_people_count ){$("#toRight").hide();}
            else {$("#toRight").show();}
            }

        $("#toRight").click(function(){
            all_people.hide();
            all_people.slice(current_people+1, current_people+4).show();
            current_people += 1;
            arrows_visibility();
            return false;
            });
        $("#toLeft").click(function(){
            all_people.hide();
            all_people.slice(current_people-1, current_people+3).show();
            current_people -= 1;
            arrows_visibility();
            return false;
            });
        }

    // Schedule tool-tips
    $(".filtr a").hover(
        function(){
            var tt = $(".tooltip-content", this);
            tt.css({top: -30 - tt.height(), left: -tt.width()/2+ $(this).width()/2});
            tt.fadeIn(500);
            },
        function(){
            $(".tooltip-content", this).fadeOut(150);
            }); // hover

    }) // document.ready
