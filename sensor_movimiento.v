////////////////////////////////////////////////////////////////////////////////
//
// Fecha de Creación: 25/11/2020
// Nombre del diseño: Casa domotica.
// Nombre del módulo: sensor_movimiento.v
// 
// Descripción:
//		El modulo sensor_movimiento tendrá el funcionamiento del control, 
// comparación y ejecución sobre el movimiento en la casa domotica.
// 
// Comentarios adicionales:
// 
///////////////////////////////////////////////////////////////////////////////
module sensor_movimiento(clk, reset, startReg, signD, wasTMove, alarmaVisual, alarmaSonora);
input clk; //Reloj del sistema
input reset; //Reset del sistema
input startReg; //Inicio del registro
input signD; //Señal de movimiento externa
output reg wasTMove; //Registro del movimiento
output reg alarmaVisual; //Alarmas del sistema
output reg alarmaSonora;
reg rst, startR, sigD;
//Asignaciones para evitar el error HDLCompiler:1660
assign reset = rst;
assign startReg = startR;
assign signD = sigD;
initial begin //Parametros de inicio
	rst = 0;
	startR = 0;
	sigD = 0;
	wasTMove = 0;
end
always @(posedge clk) begin //Bloque del reset
	if(rst == 1)begin
		startR = 0;
		sigD = 0;
		wasTMove = 0;
	end
end
always @(posedge clk or posedge startR or negedge rst) begin //Bloque de ejecución
	if (sigD == 1) wasTMove = 1;
	if (wasTMove == 1) begin
			alarmaVisual = 1;
			alarmaSonora = 1;
	end
	else begin
			alarmaVisual = 0;
			alarmaSonora = 0;
	end
end
endmodule