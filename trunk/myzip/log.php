<html>
<head>

<style>
       td {font-family: arial; font-size: 11px}
</style>

</head>

<body bgcolor=white>

<center>

<?
  $fout=fopen("count.log", "r+");
  $strInSize=fgets ($fout);
  $strOutSize=fgets ($fout);
  fclose ($fout);
  
  print "<h3>";
  print "��������� ���������� ���� ".$strInSize."/".$strOutSize." (��/���)<br>";
  print "��������� �������� � ".(int)((int)$strInSize-(int)$strOutSize)." ����";
  print "</h3>";
?>

<table border=1 cellpadding=4 cellspacing=0>
       <tr bgcolor="#E2F1FE">
           <td>����</td>
           <td>��/��� ��</td>
           <td>IP</td>
           <td>URL</td>
           <td>GET</td>
           <td>POST</td>
           <td>COOKIE</td>
<? include ("log.log"); ?>
</table>

</center>

</body>

</html>
