<?php 
session_start();
/************************************************************************
	Aplicación : cuentas_4b.php, sistema pasteur
	INFORMES
	Autor : EMP, Rodrigo Muñoz
	Versión : 2.0
	creacion: 02/09/2008
	Fecha Ultima Revisión : 02/09/2008
***********************************************************************/
include("../../common/conex.phtml");
$link=Conectarse();
include("../../common/revisa_session.php");
include("../../common/libreria_common.php");
include("../libreria_informes.php");
include("../../common/libreria_buscador_pacientes.php");
include("../../admision/libreria_admision_anexo.php");
header('Content-Type: text/html; charset=iso-8859-1');

 $fechaCalendario_1 = $_POST["fechaCalendario_1"];
 $fechaCalendario_2 = $_POST["fechaCalendario_2"];
 $rut_profesional = $_POST["rut_profesional"];
 $prevision = $_POST["prevision"];
 $lugar_atencion = $_POST["lugar_atencion"];
 $archivo = $_POST["archivo"];
 $condicion = $_POST["condicion"];
setlocale(LC_TIME,"es_ES");
$css = "../principal/css/estilo_hospital_v6.css";
echo"

	<link rel='stylesheet' href='../themes/humanity/jquery.ui.all.css'>
";
//echo $rut_profesional;
$i=1;
while((!file_exists($css)) and ($i<4))
{
	$css = "../".$css;
	$i++;
} 
echo"<link href = '$css' rel='stylesheet' rev='stylesheet' type='text/css'>
";

$fechaCalendario_1a=explode("/",$fechaCalendario_1);
$fechaCalendario_2a=explode("/",$fechaCalendario_2);

echo"
<table align='center' class='' width='100%'>
<tr>
	<td class='td_campos'>
		<b>INFORME CONSOLIDADO<br></b>
		Desde $fechaCalendario_1 Hasta $fechaCalendario_2
	</td>
</tr>	
</table>";

$consulta = "select *, date_format(hc.fecha_inicio_horario,'%d/%m/%Y') as fecha_r, date_format(hc.fecha_inicio_horario,'%H:%i') as hora_i, date_format(hc.fecha_termino_horario,'%H:%i') as hora_t from RESERVA_ATENCION as ra, HORARIO_CONSULTA as hc where ra.id_horario_consulta = hc.id_horario_consulta and hc.codigo_atencion_consulta = 1 and hc.codigo_estado = 2 and codigo_estado_reserva = 1 and date_format(hc.fecha_inicio_horario,'%Y-%m-%d')>='$fechaCalendario_1a[2]-$fechaCalendario_1a[1]-$fechaCalendario_1a[0]' and	date_format(hc.fecha_inicio_horario,'%Y-%m-%d')<='$fechaCalendario_2a[2]-$fechaCalendario_2a[1]-$fechaCalendario_2a[0]'";

$condicion = " and hc.rut_profesional in (800000008,800000009,800000010,800000011,800000012,800000013,800000014,800000015,800000016,800000017,800000018,800000019,800000020) group by rut_pnatural, fecha_r";
$orden_consulta = " order by fecha_r asc";
$con = $consulta.$condicion.$orden_consulta;
//echo $con; 
$res = mysqli_query($link,$con);
$total_res = mysqli_num_rows($res);
if($total_res > 0)
{
echo"
<body onload='is_loaded();'>
<div id='preloader' style='position: absolute; top: 45%;left: 40%; width: auto;'> 
<center> 
<table border='0' align='center' cellpadding='6' cellspacing='0' style='font-family:Verdana;font-weight: bold; border: 2px solid #e0cfc2;'> 
<tr> 
<td style='text-align:center; background-color:#f4f0ec'> 
<font style='font-size:11px; color:#b85700; text-align:center;'>Cargando datos, por favor espere...</font> 
</td> 
</tr> 
</table> 
</center> 
</div>

<table align='center' class='' width='100%'>
<tr>
	<td class='td_campos'><div align='left'>
		<b>Período</b>
	</td>
	<td class='td_campos'><div align='left'>
		<b>: $fechaCalendario_1 al $fechaCalendario_2 </b>
	</td>
</tr>
<tr>
	<td class='td_campos' width='20%'>
		<div align='left'>
		<b>Total Pacientes</b>
	</td>
	<td class='td_campos' width='80%'>
		<div align='left'>
		<b>: $total_res</b>
	</td>
</tr>	
</table>
<table align='center' width='100%'>
";
	$division = $total_res / 20;
	$division = strtok($division,".");
	$resto = fmod($total_res,20);
	if($resto > 0)
		$division++;
	$pag=0;
	$i=0;
	$x=0;
	echo"
	<tr>
		<td class='td_campos'>Nº
		</td>
		<td class='td_campos'>Fecha
		</td>
		<td class='td_campos'>Rut
		</td>
		<td class='td_campos'>Paciente
		</td>
		<td class='td_campos'>Examen
		</td>
	</tr>";	
	while($row = mysqli_fetch_array($res))
	{
		$resto = fmod($i,20);
		$i++;
		$x++;
		$codigo_reserva = $row[codigo_reserva_atencion];
		$rut_paciente = $row[rut_pnatural];
		$rut_paciente_c = $row[rut_pnatural];
		$nhg = $row[numero_hermano_gemelo];
		$web = $row[agendado_web];
		$rut_profesional_t = $row[rut_profesional];
		//echo $rut_profesional;
		if(!$rut_paciente) //|| $web == 1)
		{
			$alinea = "center";
			$rut_puntos = "Sin Rut";
			$nuevo = "Si";
			$nombres = strtoupper($row[nombres]);
			$apaterno = strtoupper($row[apellido_paterno]);
			$amaterno = strtoupper($row[apellido_materno]);
			$nombre_paciente = "$apaterno $amaterno, $nombres";
		}
		else
		{
			$alinea = "right";
			$rut_puntos = devuelve_puntos($rut_paciente)."-".devuelve_digito($rut_paciente);
			$nombre_paciente = devuelve_nombre_persona($link, $rut_paciente, $nhg, 2);
			if($nombre_paciente==''){
			$res_pac_sin_nombre = mysqli_query($link,"select * from RESERVA_ATENCION where rut_pnatural = $rut_paciente");
			$rows_pac_sin_nombre = mysqli_fetch_array($res_pac_sin_nombre);
			$nombres = strtoupper($row[nombres]);
			$apaterno = strtoupper($row[apellido_paterno]);
			$amaterno = strtoupper($row[apellido_materno]);
			$nombre_paciente = "$apaterno $amaterno, $nombres";
			}else{
			$nombre_paciente=$nombre_paciente;
			}
		}
		$fecha_r = $row[fecha_r];
		$hora_i = $row[hora_i];
		$hora_t = $row[hora_t];
		$comentario = $row[observacion_reserva];
		$largo_obs = strlen($comentario);
		/* $string = "";
		$z = 0;
		for($j=0; $j<=$largo_obs; $j++)
		{
			$char = substr($comentario,$j,1);
			if($z == 20)
			{
				$string.=$char."<br>"; 
				$z = 0;
			}
			else
			{
				$string.=$char; 
			}
			$z++;
		} */
		$codigo_lugar = $row[codigo_atencion_consulta];
		$nombre_lugar = devuelve_nombre_tabla($link,"ATENCION_CONSULTA",$codigo_lugar);
		$rut_profesional_c = $row[rut_profesional];
		//echo $rut_profesional_c;
		//$nombre_paciente = devuelve_nombre_persona($link,$rut_paciente_c,0,1);
		$rut_confirma = $row[rut_funcionario_confirma];
		$codigo_pago = $row[codigo_pago_cuenta];
		$codigo_aclinica = $row[codigo_accion_clinica];
		//echo $codigo_aclinica;
		$codigo_hospital = $row[codigo_hospital];
		//$nombre_aclinica .= devuelve_nombre_accion($link, $codigo_aclinica, $codigo_hospital);
		//echo $nombre_aclinica;
		$estado = "RESERVADA";
		if(!empty($rut_confirma))
			$estado = "CONFIRMADA";
		if(!empty($codigo_pago))
			$estado = "PAGADA";
		
		if($campos == 'td_informe')
			$campos = 'campos';
		else
			$campos = 'td_informe';
	
		
	echo"
	<tr>
		<td class='$campos'><div align='right'>$x
		</td>
		<td class='$campos'><div align='center'>$fecha_r
		</td>
		<td class='$campos'><div align='$alinea'>$rut_puntos
		</td>
		<td class='$campos'><div align='left'>$nombre_paciente
		</td>
		<td class='$campos'><div align='left'>";
		
		$con1=mysqli_query($link,"select * from RESERVA_ATENCION as ra, HORARIO_CONSULTA as hc where ra.id_horario_consulta = hc.id_horario_consulta and
ra.rut_pnatural = $rut_paciente_c and date_format(ra.fecha_atencion,'%d/%m/%Y') = '$fecha_r' and codigo_estado_reserva = 1 and hc.rut_profesional in (800000008,800000009,800000010,800000011,800000012,800000013,800000014,800000015,800000016,
 800000017,800000018,800000019,800000020)");
			$cant1=mysqli_num_rows($con1);
			
				$y=0;
				$coma=", ";
				while($rows1 = mysqli_fetch_array($con1)){
					$y++;
					$codigo_aclinica1 = $rows1[codigo_accion_clinica];
					$codigo_hospital1 = $rows1[codigo_hospital];
					$nombre_aclinica1 = devuelve_nombre_accion($link, $codigo_aclinica1, $codigo_hospital1);
					if($cant1==$y){
					$coma=".";
					}
					$nombre_aclinica2 = $nombre_aclinica1.$coma;
					echo $nombre_aclinica2;
				}
		echo "</td>
	</tr>";
	}
echo"
</table>";		
}else{
echo "
<table align='center'>
<tr>
	<td class='td_campos' width='20%'>
	<div align='center'>
		No presenta pacientes.
	</div>
	</td>
</tr>	
</table>
";
}

$arr_fechaCalendario_1=explode("/",$fechaCalendario_1);
$arr_fechaCalendario_2=explode("/",$fechaCalendario_2);


echo"
<table align='center' border='0'>
	<tr>
		<td align='center' colspan='8'><br>";
			if($total_res>0)
			echo "<input type='button' class='td_campos' value='Imprimir' onclick='imprimir($archivo,$arr_fechaCalendario_1[0],$arr_fechaCalendario_1[1],$arr_fechaCalendario_1[2],$arr_fechaCalendario_2[0],$arr_fechaCalendario_2[1],$arr_fechaCalendario_2[2])'>";
		echo "</td>
		<td align='center' colspan='8'><br>
			<input type='button' class='td_campos' value='Volver' onclick='volver.submit()'>
		</td>";
			if($total_res>0)
			echo "<td><br>
			<input type='button' value='Descargar Excel' class='td_campos' onclick='forma_excel.submit()'>
		</td>
		";
	echo "</tr>
</table>";		
echo"
<form action='../index.php' name='volver' method='post'>
<input type='hidden' name='archivo' value='$archivo'>
<input type='hidden' name='fechaCalendario_1' value='$fechaCalendario_1'>
<input type='hidden' name='fechaCalendario_2' value='$fechaCalendario_2'>
</form>
<form action='excel_archivo_1n.php' name='forma_excel' method='post'>
<input type='hidden' name='fechaCalendario_1' value='$fechaCalendario_1'>
<input type='hidden' name='fechaCalendario_2' value='$fechaCalendario_2'>	
<input type='hidden' name='rut_profesional' value='$rut_profesional'>	
<input type='hidden' name='condicion' value='$condicion'>	
<input type='hidden' name='lugar_atencion' value='$lugar_atencion'>	
<input type='hidden' name='archivo' value='$archivo'>	
</form>";
?>
<script>
function imprimir(archivo,dia1,mes1,ano1,dia2,mes2,ano2)
{
	window.open("impresion_archivo_1n.php?dia1="+dia1+"&mes1="+mes1+"&ano1="+ano1+"&dia2="+dia2+"&mes2="+mes2+"&ano2="+ano2+"&archivo="+archivo+"","nueva1","width=580,height=450,top=100,left=5,resizable=yes,scrollbars=yes");	
}

</script>
<script type="text/javascript" language="javascript"> 
function is_loaded() {
if (document.getElementById){ 
document.getElementById('preloader').style.visibility='hidden'; 
}else{ 
if (document.layers){
document.preloader.visibility = 'hidden'; 
} 
else { 
document.all.preloader.style.visibility = 'hidden'; 
} 
} 
} 
</script>