////////////////////////////////////////////////////////////////////////////////
//
// Fecha de Creaci�n: 25/11/2020
// Nombre del dise�o: Casa domotica.
// Nombre del m�dulo: sensor_temperatura.v
// 
// Descripci�n:
//		El modulo sensor_temperatura tendr�  el funcionamiento del control, 
// comparaci�n y ejecuci�n sobre la temperatura en la casa domotica.
// 
// Comentarios adicionales:
// Se hace la comparaci�n con valores de referencia con datos climaticos.
///////////////////////////////////////////////////////////////////////////////
module sensor_temperatura(clk, reset, startComp, tpValor, tpReferenciaC, tpReferenciaF, tOut, alarmaVisualC, alarmaVisualF);
input clk; //Clock del sistema
input reset; //Reset del sistema
input startComp; //Inicio de la comparaci�n
input [5:0] tpValor; //Valor de la temperatura
input [5:0] tpReferenciaC; //Valor de referencia de temperatura mayores a 28�
input [5:0] tpReferenciaF; //Valor de referencia de temperatura menores a 17�
output reg tOut; // Registro de la alarma de comparaci�n
output reg alarmaVisualC; //Alarma visual para cuando hace calor
output reg alarmaVisualF; //Alarma visual para cuando hace frio
reg rst, startC;
reg [5:0] tValor;
reg [5:0] tReferenciaC;
reg [5:0] tReferenciaF;
//Asignaciones para evitar el error HDLCompiler:1660
assign reset = rst;
assign startComp = startC;
assign tpValor = tValor;
assign tpReferenciaC = tReferenciaC;
assign tpReferenciaF = tReferenciaF;
initial begin //Parametros de inicio
	rst = 0;
	startC = 0;
	tReferenciaC = 6'b011100;
	tReferenciaF = 6'b010001;
	tOut = 0;
end
always @(posedge clk) begin //Bloque del reset
	if(rst == 1)begin
		startC = 0;
		tValor = 0;
		tOut = 0;
		alarmaVisualC = 0;
		alarmaVisualF = 0;
	end
end
always @ (posedge clk or posedge startC or negedge rst) begin //Bloque de comparaci�n y ejecuci�n
	if (tOut == 0) begin 
		if (tValor > tReferenciaC) begin
			tOut = 1;
			alarmaVisualC = 1;
		end
		if (tValor < tReferenciaF) begin 
			tOut = 1;
			alarmaVisualF = 1;
		end
	end
	else begin
		if (tValor < tReferenciaC) begin
			tOut = 0;
			alarmaVisualC = 0;
		end
		if (tValor > tReferenciaF) begin
			tOut = 0;
			alarmaVisualF = 0;
		end
	end
end
endmodule