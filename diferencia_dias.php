<?php


					$FechaCul="25-02-2014";

				 
					$FechaActual= date('d-m-Y');
					
					$FechaActual = str_replace("-","",$FechaActual);
					$FechaActual = str_replace("/","",$FechaActual);
					$FechaCul = str_replace("-","",$FechaCul);
					$FechaCul = str_replace("/","",$FechaCul);

					ereg( "([0-9]{1,2})([0-9]{1,2})([0-9]{2,4})", $FechaActual, $FechaActual);
					ereg( "([0-9]{1,2})([0-9]{1,2})([0-9]{2,4})", $FechaCul, $FechaCul);

					$date1 = mktime(0,0,0,$FechaActual[2], $FechaActual[1], $FechaActual[3]);
					$date2 = mktime(0,0,0,$FechaCul[2], $FechaCul[1], $FechaCul[3]);
					
					$lcResult=round(($date2 - $date1) / (60 * 60 * 24));

					echo $lcResult;
?>