<?
// ver. 0.5.061003  D_N_S

 define ("MOD_TITLE",       TRUE); //�������������� title ����������� � ������ � ������
 define ("WRITE_LOGSTRING", TRUE); //������ � log.log ��������� ���������� � ��������������� �������
 define ("WRITE_COUNT",     TRUE); //����� � count.log ������� ������������� ����
 define ("WRITE_RECPAGE",   TRUE); //�������� � ���� ���������� � ����������� �������� �� ���������� �������
 define ("GETURL",          "urlx"); //������������ GET-���������, � ������� ���� url
 define ("SHOW_ECONOMY",    "econom");//������������ GET-���������, ������ ������� � ������ �������
                                      //����� ���������� ����� �� �������� �������

 if (isset($_GET[GETURL]))
   {//��������� ������� ���-������, ���� ���������� get-�������� GETURL

    include ("func.inc.php");

    $time_start=getMicroTime();

    $POST_STR="";
    $GET_STR="";
    $COOKIE_STR="";

    //�������� ��� ��������� �������� (� ���� �������� ����� ���� ������ ���-��������)
    $url=$_GET[GETURL];
    $parse_url=explode('?', $url); //parse_url[0] - ��� ��������; parse_url[1] - ������ ���-��������
    if (isset($parse_url[1])) //������ ������ ���-��������, ���� �� ����������
       {$sub_parse=explode('=', $parse_url[1]);//��������� �� �������� GET-���������� � �� ��������
        //�����, ����� � ����� ��������� �������� ����� ����������� ����� �����. ���������
        if (isset($sub_parse[1]))
           {//���� �������� magic_quotes, �� ������ "unMagic_quotes"
	          if (get_magic_quotes_gpc()) $sub_parse[1]=stripslashes($sub_parse[1]);

            $url=$parse_url[0].'?'.$sub_parse[0].'='.urlencode($sub_parse[1]);
           }
        else
		        $url=$parse_url[0].'?'.$sub_parse[0];
       }
    else
        $url=$parse_url[0];


    //�������� ����������� ������ ����������
    $GET_STR=substr(strstr ($_SERVER["QUERY_STRING"], '&'),1);
    getStrMas ($_POST, &$POST_STR);
    getStrMas ($_COOKIE, &$COOKIE_STR);


    // ������������� ������ CURL-a
    $ch = curl_init();

    // ��������� URL � ������ ����������� ���������� ��� ������ ������������� �������� �� �����
    if ($GET_STR!="") {$GET_STR="&".$GET_STR; $params="G";}
    curl_setopt($ch, CURLOPT_URL, $url.$GET_STR);
    curl_setopt($ch, CURLOPT_HEADER, 1); //������������� �������� CURL, ����� � ������ ������ ��������� ��������
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 10); //��������� CURL ����������, � �� �������

    //������ ��������������� ���������� CURL-�, ���� ��� �����������
    //���� �� CURL �� ��������� ��� ��������� � ������ ���������, �� ����� ���� �� �����������
    //curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);

    if ($POST_STR!="") //���������� ����-���������� CURL-��
       {curl_setopt($ch, CURLOPT_POSTFIELDS, $POST_STR);
        $params.="P";
       }

    if ($COOKIE_STR!="") //���������� ���� CURL-��
       {curl_setopt($ch, CURLOPT_COOKIE, $COOKIE_STR);
        $params.="C";
       }

    $i=0; //����������� ��������� ������� �� �������� ������� � CURL-����-��������� (��������� HOST)
    foreach($_SERVER as $h=>$v)
       if(ereg('HTTP_(.+)', $h, $hp))
           if (strtolower($hp[1])!="host") $httpheaders[$i++]=$hp[1].": ".$v;

    curl_setopt ($ch, CURLOPT_HTTPHEADER, $httpheaders);

    // fclose ($fout);
    //CURLOPT_HTTPHEADER
    //curl_setopt ($ch, CURLOPT_HTTPHEADER, Array("Accept-Language: ru"));

    // �������� �������� � ������ � � ���������� $ret_data
   $ret_data=curl_exec($ch);


    //�������� ��������� �� ret_data � �������� ������ (location, content-type) ����� ��������� �������
    getHeader (&$ret_data);

    if ($no_zip==false)
       {//������� ������������ ������

        $gzdata = gzencode($ret_data, 9); //������� ������ �� ����������� ������ �������
        $inSize=strlen($ret_data); $outSize=strlen($gzdata);

        $tmp_ret_data=$ret_data; //��������� �������� �������� �� ������ ������� ����������� �������� � $ret_data == �������� ����

        //������ ���������������� ����� ��� ����
        if (MOD_TITLE)
                $ret_data=eregi_replace ( "<title>", "<title>".sprintf("[%s/%s=%5.2fx::%s::%5.2f�::%s]",$inSize, $outSize, ($inSize/$outSize),
                                          $params, (getMicroTime()-$time_start), $head_sep)." ", $ret_data);

        //�������� ���������� ����� ������ ����� eregi (����� �������� ������ � ������ ���������� ������������ �����)
        //���� ����� ����������� - ��������������� � $ret_data ������� ����������
        if (strlen($tmp_ret_data)>strlen($ret_data)) $ret_data=$tmp_ret_data;

        //������ �������� ������, ����� � ����� ��� ������ ������ ��������� ���. ����������,
        //���������� ������� �� ����������� ������� ������
        $gzdata = gzencode($ret_data, 9);

        header("Content-Encoding: gzip");
        header("Vary: Accept-Encoding");
        header("Content-Length: ".strlen($gzdata));

        print $gzdata;
       }
    else
        {//�� ������� ������������ ������
         //(������������ ��� jpeg � png [������ gif ��� �������� "������", ������ /��� �������, ���������/ �� ������ ������ ��� ���� ����])

         header("Content-Length: ".strlen($ret_data));
         print $ret_data;
        }

    // ���������� ������ � ������������ ��������
    curl_close($ch);

    writeLog ($_SERVER, $inSize, $outSize, $url, $GET_STR, $POST_STR, $COOKIE_STR);
   }
 else
   if (isset($_GET[SHOW_ECONOMY])) include ("log.php");
 else
   header("HTTP/1.0 404 Not Found");
?>
