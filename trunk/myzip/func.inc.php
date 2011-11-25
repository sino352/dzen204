<?
// ver. 0.5.061003 D_N_S

/**
 * –азворачивает в строку ($MAS_STR) ассоциативный массив ($_MAS).
 */
function getStrMas ($_MAS, $MAS_STR)
{
 $MAS_STR="";
 //print_r ($_MAS); print "<br>";

 foreach ($_MAS as $key => $value)
         {
          //если включены magic_quotes, то делаем "unMagic_quotes"
          if (get_magic_quotes_gpc()) $value=stripslashes($value);

          $MAS_STR.='&'.$key.'='.urlencode($value);
         }

 if ($MAS_STR!="") $MAS_STR=substr($MAS_STR, 1);//убираем первый '&'

}


/**
 *  Ќаходит, вырезает и обрабатывает служебный заголовок страницы полученной пхп-проксей (от целевого сервера).
 *  ѕо этому заголовку формируетс€ заголовок страницы, идущий от пхп-прокси браузеру.
 *  ¬ырезаетс€ заголовок из $ret_data.
 */
function getHeader ($_ret_data)
{
 if (WRITE_RECPAGE)
    {$fout=fopen("pageFull.log", "wb");
     fwrite ($fout, $_ret_data);
     fclose ($fout);
    }

 global $no_zip, $head_sep;
 $no_zip=false; $head_sep="";

 //находим позицию разделител€ на заголовок и тело страницы
 //нахождение меньшего св€зано с тем, что некоторые сервера раздел€ют заголовок от тела \n\n
 //вместо необходимых \r\n\r\n (например, http://www.mts.ru/sms, в до€йцевую эпоху)
 $classic=strpos($_ret_data, "\r\n\r\n");
 $olen=strpos($_ret_data, "\n\n");
 if (($classic!==FALSE) && (($olen===FALSE) || ($olen>$classic)))
     {$i_head=$classic; //i_head - позици€ разделител€ заголовка и тела полученных данных
      $head_mes_separator="\r\n\r\n";
     }
 else if ($olen!==FALSE)
     {$i_head=$olen;
      $head_mes_separator="\n\n";
      $head_sep="олень"; //флажок "сервера-олен€" (выводитс€ в title страницы)
     }
 else
     {die ("<h1>HTTP-header error /olen/ !</h1>");
     }

 //получаем хедер страницы и ее тело
 $header=substr($_ret_data, 0, $i_head);
 $_ret_data=substr($_ret_data, $i_head+strlen($head_mes_separator));


 //получаем массив строк из header-а и его вставка в header, отдаваемый браузеру клиента
 $header_mas=split("\r\n", $header);

 // $fout=fopen("tmp.log", "wb");
 //fwrite ($fout, "***".$header_mas[9]."***\r\n");

 //среди заголовков ищем редирект (через location - если он есть, то даем этот заголовок клиенту)
 while (current ($header_mas))
      {$headline=$header_mas[key($header_mas)];

       //здесь, далее и ранее некоторые операции можно производить через регул. выражени€

       //fwrite ($fout, "***".$headline."***\r\n");
       //header ($headline);

	     //ловим уже сжатые страницы, чтоб не пережимать их дважды
       if ((findHeaderLine ( "Content-Encoding", $headline)==1) && (strpos(strtolower($headline), 'gzip')!=FALSE)) $no_zip=true;
       else if ((findHeaderLine ( "Content-Type", $headline)==1) &&
               ((strpos(strtolower($headline), 'image/jpeg')!=FALSE) || //сделано ради IE5, т.к. опера 7.51 запросто "кушала" зипованый jpeg и png
                (strpos(strtolower($headline), 'image/png')!=FALSE))) $no_zip=true; 
 
      if (findHeaderLine ( "Transfer-Encoding", $headline)!=1) header ($headline);

       next($header_mas);
      }

 // fclose ($fout);
}

/**
 *  ѕровер€ет строку из заголовка на наличие в ней подстроки ($template="location" /редирект/, например),
 *  если находит, то возвращает 1.
 */
function findHeaderLine ($template, $headline)
{//поиск ключевых заголовков  - если находим,
 // то возвращаем 1

 $res=eregi_replace ( $template, "", substr($headline, 0, strlen($template)));
 if ($res!=substr($headline, 0, strlen($template)))  return 1; //т.е. нашли

 return -1;
}

/**
 *  ¬озвращает метку времени с микросекундами
 */
function getMicroTime()
{
 list($msec, $sec) = explode(" ", microtime());
 return ((float)$msec + (float)$sec);
}

/**
 * ѕишет лог в файлы (обычный журнал с параметрами и файл со счетчиком трафика)
 */
function writeLog ($_SERVER, $inSize, $outSize, $url, $_GET_STR, $_POST_STR, $_COOKIE_STR)
{
 if (WRITE_LOGSTRING)
    {//пишем лог в log.log- строку с параметрами происходившего
     $fout=fopen("log.log", "a");
     fwrite ($fout, sprintf ("<tr><td>%s</td><td>%s</td><td>(%s/%s)</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td>\n",
     date("d.m.Y H:i:s"), $_SERVER["REMOTE_ADDR"], $inSize/1000,$outSize/1000, $url,
     $_GET_STR, $_POST_STR, $_COOKIE_STR));
     fclose ($fout);
    }

 if (WRITE_COUNT)
    {//пишем в счетчик сэкономленных байт (count.log)
	   if (file_exists ("count.log"))
        {$fout=fopen("count.log", "r+");
		     rewind ($fout);
	       $strInSize=fgets ($fout);
	       $strOutSize=fgets ($fout);
	       $sumInSize=(int)$strInSize+(int)$inSize;
	       $sumOutSize=(int)$strOutSize+(int)$outSize;
	       rewind($fout);
	       fwrite ($fout, sprintf("%d\r\n", $sumInSize));
	       fwrite ($fout, sprintf("%d\r\n", $sumOutSize));
		    }
	   else
		    {$fout=fopen("count.log", "w");
	       fwrite ($fout, sprintf("%d\r\n", (int)$inSize));
	       fwrite ($fout, sprintf("%d\r\n", (int)$outSize));
		    }

    fclose ($fout);
   }
}
?>
