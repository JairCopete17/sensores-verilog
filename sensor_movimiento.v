////////////////////////////////////////////////////////////////////////////////
//
// Fecha de Creaci�n: 25/11/2020
// Nombre del dise�o: Casa domotica.
// Nombre del m�dulo: sensor_movimiento.v
// 
// Descripci�n:
//		El modulo sensor_movimiento tendr� el funcionamiento del control, 
// comparaci�n y ejecuci�n sobre el movimiento en la casa domotica.
// 
// Comentarios adicionales:
// 
///////////////////////////////////////////////////////////////////////////////
module sensor_movimiento(clk, reset, startReg, signD, wasTMove, alarmaVisual, alarmaSonora);
input clk; //Reloj del sistema
input reset; //Reset del sistema
input startReg; //Inicio del registro
input signD; //Se�al de movimiento externa
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
always @(posedge clk or posedge startR or negedge rst) begin //Bloque de ejecuci�n
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