<?
// ver. 0.5.061003  D_N_S

 define ("MOD_TITLE",       TRUE); //модифицировать title информацией о сжатии и прочем
 define ("WRITE_LOGSTRING", TRUE); //писать в log.log построчно информацию о производившемся доступе
 define ("WRITE_COUNT",     TRUE); //вести в count.log счетчик сэкономленных байт
 define ("WRITE_RECPAGE",   TRUE); //записать в файл полученную с заголовками страницу от удаленного сервера
 define ("GETURL",          "urlx"); //наименование GET-параметра, в котором идет url
 define ("SHOW_ECONOMY",    "econom");//наименование GET-параметра, указав который в вызове скрипта
                                      //можно посмотреть отчет по экономии трафика

 if (isset($_GET[GETURL]))
   {//запускаем систему веб-прокси, если установлен get-параметр GETURL

    include ("func.inc.php");

    $time_start=getMicroTime();

    $POST_STR="";
    $GET_STR="";
    $COOKIE_STR="";

    //получаем урл требуемой страницы (в этот параметр также идет первый ГЕТ-параметр)
    $url=$_GET[GETURL];
    $parse_url=explode('?', $url); //parse_url[0] - урл страницы; parse_url[1] - первый гет-параметр
    if (isset($parse_url[1])) //парсим первый гет-параметр, если он существует
       {$sub_parse=explode('=', $parse_url[1]);//разбиваем на название GET-переменной и ее значение
        //здесь, далее и ранее некоторые операции можно производить через регул. выражения
        if (isset($sub_parse[1]))
           {//если включены magic_quotes, то делаем "unMagic_quotes"
	          if (get_magic_quotes_gpc()) $sub_parse[1]=stripslashes($sub_parse[1]);

            $url=$parse_url[0].'?'.$sub_parse[0].'='.urlencode($sub_parse[1]);
           }
        else
		        $url=$parse_url[0].'?'.$sub_parse[0];
       }
    else
        $url=$parse_url[0];


    //получаем развернутые строки параметров
    $GET_STR=substr(strstr ($_SERVER["QUERY_STRING"], '&'),1);
    getStrMas ($_POST, &$POST_STR);
    getStrMas ($_COOKIE, &$COOKIE_STR);


    // инициализация сеанса CURL-a
    $ch = curl_init();

    // установка URL и других необходимых параметров для взятия запрашиваемой страницы из инета
    if ($GET_STR!="") {$GET_STR="&".$GET_STR; $params="G";}
    curl_setopt($ch, CURLOPT_URL, $url.$GET_STR);
    curl_setopt($ch, CURLOPT_HEADER, 1); //устанавливаем параметр CURL, чтобы в ответе ловить заголовки страницы
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 10); //результат CURL возвращает, а НЕ выводит

    //делать перенаправление средствами CURL-а, если оно потребуется
    //если бы CURL не возвращал два заголовка в случае редиректа, то можно было бы разремарить
    //curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);

    if ($POST_STR!="") //отправляем пост-переменные CURL-ом
       {curl_setopt($ch, CURLOPT_POSTFIELDS, $POST_STR);
        $params.="P";
       }

    if ($COOKIE_STR!="") //отправляем КУКИ CURL-ом
       {curl_setopt($ch, CURLOPT_COOKIE, $COOKIE_STR);
        $params.="C";
       }

    $i=0; //проставляем заголовки запроса от браузера клиента в CURL-хттп-параметры (пропуская HOST)
    foreach($_SERVER as $h=>$v)
       if(ereg('HTTP_(.+)', $h, $hp))
           if (strtolower($hp[1])!="host") $httpheaders[$i++]=$hp[1].": ".$v;

    curl_setopt ($ch, CURLOPT_HTTPHEADER, $httpheaders);

    // fclose ($fout);
    //CURLOPT_HTTPHEADER
    //curl_setopt ($ch, CURLOPT_HTTPHEADER, Array("Accept-Language: ru"));

    // загрузка страницы и выдача её в переменную $ret_data
   $ret_data=curl_exec($ch);


    //вырезаем заголовок из ret_data и передаем нужные (location, content-type) части заголовка клиенту
    getHeader (&$ret_data);

    if ($no_zip==false)
       {//сжимаем передаваемые данные

        $gzdata = gzencode($ret_data, 9); //пробное сжатие на определение объема сжатого
        $inSize=strlen($ret_data); $outSize=strlen($gzdata);

        $tmp_ret_data=$ret_data; //сохраняем исходное значение на случай наличия нетекстовых символов в $ret_data == двоичный файл

        //делаем модифицированный тайтл для ХТМЛ
        if (MOD_TITLE)
                $ret_data=eregi_replace ( "<title>", "<title>".sprintf("[%s/%s=%5.2fx::%s::%5.2fс::%s]",$inSize, $outSize, ($inSize/$outSize),
                                          $params, (getMicroTime()-$time_start), $head_sep)." ", $ret_data);

        //проверка уменьшения длины строки после eregi (такое возможно только в случае скачивания нетекстового файла)
        //если длина уменьшилась - восстанавливаем в $ret_data прежнее содержимое
        if (strlen($tmp_ret_data)>strlen($ret_data)) $ret_data=$tmp_ret_data;

        //сжатие делается дважды, чтобы в тайтл при втором сжатии поместить доп. информацию,
        //полученную отчасти по результатам первого сжатия
        $gzdata = gzencode($ret_data, 9);

        header("Content-Encoding: gzip");
        header("Vary: Accept-Encoding");
        header("Content-Length: ".strlen($gzdata));

        print $gzdata;
       }
    else
        {//НЕ сжимаем передаваемые данные
         //(используется для jpeg и png [сжатый gif все брайзеры "кушают", потому /как правило, избыточно/ на всякий случай его тоже жмем])

         header("Content-Length: ".strlen($ret_data));
         print $ret_data;
        }

    // завершение сеанса и освобождение ресурсов
    curl_close($ch);

    writeLog ($_SERVER, $inSize, $outSize, $url, $GET_STR, $POST_STR, $COOKIE_STR);
   }
 else
   if (isset($_GET[SHOW_ECONOMY])) include ("log.php");
 else
   header("HTTP/1.0 404 Not Found");
?>
