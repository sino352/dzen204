<?
// ver. 0.5.061003 D_N_S

/**
 * ������������� � ������ ($MAS_STR) ������������� ������ ($_MAS).
 */
function getStrMas ($_MAS, $MAS_STR)
{
 $MAS_STR="";
 //print_r ($_MAS); print "<br>";

 foreach ($_MAS as $key => $value)
         {
          //���� �������� magic_quotes, �� ������ "unMagic_quotes"
          if (get_magic_quotes_gpc()) $value=stripslashes($value);

          $MAS_STR.='&'.$key.'='.urlencode($value);
         }

 if ($MAS_STR!="") $MAS_STR=substr($MAS_STR, 1);//������� ������ '&'

}


/**
 *  �������, �������� � ������������ ��������� ��������� �������� ���������� ���-������� (�� �������� �������).
 *  �� ����� ��������� ����������� ��������� ��������, ������ �� ���-������ ��������.
 *  ���������� ��������� �� $ret_data.
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

 //������� ������� ����������� �� ��������� � ���� ��������
 //���������� �������� ������� � ���, ��� ��������� ������� ��������� ��������� �� ���� \n\n
 //������ ����������� \r\n\r\n (��������, http://www.mts.ru/sms, � ��������� �����)
 $classic=strpos($_ret_data, "\r\n\r\n");
 $olen=strpos($_ret_data, "\n\n");
 if (($classic!==FALSE) && (($olen===FALSE) || ($olen>$classic)))
     {$i_head=$classic; //i_head - ������� ����������� ��������� � ���� ���������� ������
      $head_mes_separator="\r\n\r\n";
     }
 else if ($olen!==FALSE)
     {$i_head=$olen;
      $head_mes_separator="\n\n";
      $head_sep="�����"; //������ "�������-�����" (��������� � title ��������)
     }
 else
     {die ("<h1>HTTP-header error /olen/ !</h1>");
     }

 //�������� ����� �������� � �� ����
 $header=substr($_ret_data, 0, $i_head);
 $_ret_data=substr($_ret_data, $i_head+strlen($head_mes_separator));


 //�������� ������ ����� �� header-� � ��� ������� � header, ���������� �������� �������
 $header_mas=split("\r\n", $header);

 // $fout=fopen("tmp.log", "wb");
 //fwrite ($fout, "***".$header_mas[9]."***\r\n");

 //����� ���������� ���� �������� (����� location - ���� �� ����, �� ���� ���� ��������� �������)
 while (current ($header_mas))
      {$headline=$header_mas[key($header_mas)];

       //�����, ����� � ����� ��������� �������� ����� ����������� ����� �����. ���������

       //fwrite ($fout, "***".$headline."***\r\n");
       //header ($headline);

	     //����� ��� ������ ��������, ���� �� ���������� �� ������
       if ((findHeaderLine ( "Content-Encoding", $headline)==1) && (strpos(strtolower($headline), 'gzip')!=FALSE)) $no_zip=true;
       else if ((findHeaderLine ( "Content-Type", $headline)==1) &&
               ((strpos(strtolower($headline), 'image/jpeg')!=FALSE) || //������� ���� IE5, �.�. ����� 7.51 �������� "������" ��������� jpeg � png
                (strpos(strtolower($headline), 'image/png')!=FALSE))) $no_zip=true; 
 
      if (findHeaderLine ( "Transfer-Encoding", $headline)!=1) header ($headline);

       next($header_mas);
      }

 // fclose ($fout);
}

/**
 *  ��������� ������ �� ��������� �� ������� � ��� ��������� ($template="location" /��������/, ��������),
 *  ���� �������, �� ���������� 1.
 */
function findHeaderLine ($template, $headline)
{//����� �������� ����������  - ���� �������,
 // �� ���������� 1

 $res=eregi_replace ( $template, "", substr($headline, 0, strlen($template)));
 if ($res!=substr($headline, 0, strlen($template)))  return 1; //�.�. �����

 return -1;
}

/**
 *  ���������� ����� ������� � ��������������
 */
function getMicroTime()
{
 list($msec, $sec) = explode(" ", microtime());
 return ((float)$msec + (float)$sec);
}

/**
 * ����� ��� � ����� (������� ������ � ����������� � ���� �� ��������� �������)
 */
function writeLog ($_SERVER, $inSize, $outSize, $url, $_GET_STR, $_POST_STR, $_COOKIE_STR)
{
 if (WRITE_LOGSTRING)
    {//����� ��� � log.log- ������ � ����������� ��������������
     $fout=fopen("log.log", "a");
     fwrite ($fout, sprintf ("<tr><td>%s</td><td>%s</td><td>(%s/%s)</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td>\n",
     date("d.m.Y H:i:s"), $_SERVER["REMOTE_ADDR"], $inSize/1000,$outSize/1000, $url,
     $_GET_STR, $_POST_STR, $_COOKIE_STR));
     fclose ($fout);
    }

 if (WRITE_COUNT)
    {//����� � ������� ������������� ���� (count.log)
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
