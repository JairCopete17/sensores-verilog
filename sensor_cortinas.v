////////////////////////////////////////////////////////////////////////////////
//
// Fecha de Creación: 25/11/2020
// Nombre del diseño: Casa domotica.
// Nombre del módulo: sensor_cortinas.v
// 
// Descripción:
//		El modulo sensor_cortinas tendrá el funcionamiento del control, 
// comparación y ejecución sobre las cortinas en la casa domotica.
// 
// Comentarios adicionales:
// El switch para establecer el movimiento de las persianas funcionará así:
//			Primera posición[2] para cuando no se quiera función con las persianas,
//			Segunda posición[1] para cuando se quiera bajar las persianas,
//			Tercera posición[0] para cuando se quiera subir las persianas 
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
always @(posedge clk) begin //Bloque de ejecución
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