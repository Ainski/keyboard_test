`timescale 1ps/1ps
module display7 (
    input [3:0] iData,
    output [6:0] oData
);

    reg [6:0] oData_t;

    always @(*) begin
        case (iData)
            4'b0000: oData_t = 7'b1000000;
            4'b0001: oData_t = 7'b1111001;
            4'b0010: oData_t = 7'b0100100;
            4'b0011: oData_t = 7'b0110000;
            4'b0100: oData_t = 7'b0011001;
            4'b0101: oData_t = 7'b0010010;
            4'b0110: oData_t = 7'b0000010;
            4'b0111: oData_t = 7'b1111000;
            4'b1000: oData_t = 7'b0000000;
            4'b1001: oData_t = 7'b0010000;
            default: oData_t = 7'b1000000;
        endcase
    end

    assign oData = oData_t;

endmodule