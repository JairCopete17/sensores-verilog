////////////////////////////////////////////////////////////////////////////////
//
// Fecha de Creaci�n: 25/11/2020
// Nombre del dise�o: Casa domotica.
// Nombre del m�dulo: sensor_cortinas.v
// 
// Descripci�n:
//		El modulo sensor_cortinas tendr� el funcionamiento del control, 
// comparaci�n y ejecuci�n sobre las cortinas en la casa domotica.
// 
// Comentarios adicionales:
// El switch para establecer el movimiento de las persianas funcionar� as�:
//			Primera posici�n[2] para cuando no se quiera funci�n con las persianas,
//			Segunda posici�n[1] para cuando se quiera bajar las persianas,
//			Tercera posici�n[0] para cuando se quiera subir las persianas 
///////////////////////////////////////////////////////////////////////////////
module sensor_cortinas(clk, reset, startPer, switch, updown, backward);
input clk; //Reloj del sistema
input reset; //Reset del sistema
input startPer; //Inicio del registro
input [2:0] switch; //Interruptor 
output reg updown; //Subida de las persinas
output reg backward; //Bajada de las persianas
reg rst, startP;
reg [2:0] swt;
//Asignaciones para evitar el error HDLCompiler:1660
assign reset = rst;
assign startPer = startP;
assign switch = swt;
initial begin //Parametros de inicio
	rst = 0;
	startP = 0;
	swt = 3'b000;
end
always @(posedge clk) begin //Bloque del reset
	if(rst == 1)begin
		startP = 0;
		swt = 3'b000;		
		updown = 0;
		backward = 0;
	end
end
always @(posedge clk) begin //Bloque de ejecuci�n
	if(swt[2] == 1)begin
		updown = 0;
		backward = 0;
	end
	if(swt[1] == 1)begin
		updown = 0;
		backward = 1;
	end
	if(swt[0] == 1)begin
		updown = 1;
		backward = 0;
	end
end
endmodule