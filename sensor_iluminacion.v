////////////////////////////////////////////////////////////////////////////////
//
// Fecha de Creaci�n: 25/11/2020
// Nombre del dise�o: Casa domotica.
// Nombre del m�dulo: sensor_iluminacion.v
// 
// Descripci�n:
//		El modulo sensor_iluminacion tendr�  el funcionamiento del control, 
// comparaci�n y ejecuci�n sobre la luz en la casa domotica.
// 
// Comentarios adicionales:
// 	En la variable de entrada del tiempo, cuando toma valor de 0 significa 
// que es de dia; mientras que cuando tiene un 1 logico es de noche.
///////////////////////////////////////////////////////////////////////////////
module sensor_iluminacion(clk, reset, startIlu, tiempo, signD, wasTMove, bulb);
input clk; //Clock del sistema
input reset; //Reset del sistema
input startIlu; //Inicio del registro
input tiempo; //Estados del dia
input signD; //Se�al de movimiento externa
output reg wasTMove; //Registro del movimiento
output reg bulb; //Registro de la luz
reg rst, startI, tmp, sigD;
//Asignaciones para evitar el error HDLCompiler:1660
assign reset = rst;
assign startIlu = startI;
assign tiempo = tmp;
assign signD = sigD;
initial begin //Parametros de inicio
	rst = 0;
	startI = 0;
	tmp = 0;
	sigD = 0;
	wasTMove = 0;
end
always @(posedge clk) begin //Bloque del reset
	if(rst == 1)begin
		startI = 0;
		tmp = 0;
		sigD = 0;
		wasTMove = 0;
		bulb = 0;
	end
end
always @ (posedge clk) begin //Bloque de comparaci�n y ejecuci�n
if (sigD == 1) wasTMove = 1;
	if(tmp == 1)begin
		if(wasTMove == 0) bulb = 0;
			else bulb = 1;
	end
	else wasTMove = 0;
end
endmodule