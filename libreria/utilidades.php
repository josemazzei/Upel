<?php
/* ESTE MODELO DE SEGURIDAD ESTÁ HECHO CON FINES ACADEMICOS, SU DISTRIBUCIÓN ES GRATUITA, CUALQUIER ADAPTACIÓN, MODIFICACIÓN O MEJORA QUE SE HAGA APARTIR DE ESTE CODIGO DEBE SER NOTIFICADA A LA COMUNIDAD DE LA CUAL FUE OBTENIDO Y/0 A SU CREADOR JAVIER MARTÍN AL CORREO RECUPERA.JAVIER@GMAIL.COM */
class clsUtil
{
    function get_real_ip()
    {
 
        if (isset($_SERVER["HTTP_CLIENT_IP"]))
        {
            return $_SERVER["HTTP_CLIENT_IP"];
        }
        elseif (isset($_SERVER["HTTP_X_FORWARDED_FOR"]))
        {
            return $_SERVER["HTTP_X_FORWARDED_FOR"];
        }
        elseif (isset($_SERVER["HTTP_X_FORWARDED"]))
        {
            return $_SERVER["HTTP_X_FORWARDED"];
        }
        elseif (isset($_SERVER["HTTP_FORWARDED_FOR"]))
        {
            return $_SERVER["HTTP_FORWARDED_FOR"];
        }
        elseif (isset($_SERVER["HTTP_FORWARDED"]))
        {
            return $_SERVER["HTTP_FORWARDED"];
        }
        else
        {
            return $_SERVER["REMOTE_ADDR"];
        } 
    }

    function convertir_romano($num)
    {
            if ($num <0 || $num >9999) {return -1;}
            $r_ones = array(1=>"I", 2=>"II", 3=>"III", 4=>"IV", 5=>"V", 6=>"VI", 7=>"VII", 8=>"VIII", 
            9=>"IX");
            $r_tens = array(1=>"X", 2=>"XX", 3=>"XXX", 4=>"XL", 5=>"L", 6=>"LX", 7=>"LXX", 
            8=>"LXXX", 9=>"XC");
            $r_hund = array(1=>"C", 2=>"CC", 3=>"CCC", 4=>"CD", 5=>"D", 6=>"DC", 7=>"DCC", 
            8=>"DCCC", 9=>"CM");
            $r_thou = array(1=>"M", 2=>"MM", 3=>"MMM", 4=>"MMMM", 5=>"MMMMM", 6=>"MMMMMM", 
            7=>"MMMMMMM", 8=>"MMMMMMMM", 9=>"MMMMMMMMM");
            $ones = $num % 10;
            $tens = ($num - $ones) % 100;
            $hundreds = ($num - $tens - $ones) % 1000;
            $thou = ($num - $hundreds - $tens - $ones) % 10000;
            $tens = $tens / 10;
            $hundreds = $hundreds / 100;
            $thou = $thou / 1000;
            if ($thou) {$rnum .= $r_thou[$thou];} 
            if ($hundreds) {$rnum .= $r_hund[$hundreds];} 
            if ($tens) {$rnum .= $r_tens[$tens];} 
            if ($ones) {$rnum .= $r_ones[$ones];} 
        return $rnum;
    }

    function rpHash($value) 
    {
        $hash = 5381;
        $value = strtoupper($value);
        for($i = 0; $i < strlen($value); $i++) {
            $hash = (($hash << 5) + $hash) + ord(substr($value, $i));
        }
        return $hash;
    }

}
?>