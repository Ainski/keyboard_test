module keyboard_top(
    input clk,
    input clrn,
    input ps2_clk,
    input ps2_data,

    output ready,
    output [6:0] d7_odata,
    output [7:0] led_odata
);

    reg [7:0] data_out_reg=0;
    wire [7:0] data_out_wire;

    // Assign the data_out_reg to led_odata
    assign led_odata = data_out_reg;

    // Instantiate the 7-segment display module
    display7 uut_display(
        .iData(data_out_reg[3:0]),  // Use the lower 4 bits of data_out_reg
        .oData(d7_odata)
    );

    // Instantiate the PS/2 keyboard module
    ps2_keyboard uut(
        .clk(clk),
        .clrn(clrn),
        .ps2_clk(ps2_clk),
        .ps2_data(ps2_data),
        .data_out(data_out_wire),  // Connect the output of ps2_keyboard to data_out_wire
        .ready(ready)
    );

    // Update data_out_reg when ready is high
    always @(posedge clk or negedge clrn) begin
        if (!clrn) begin
            data_out_reg <= 8'b0;  // Reset data_out_reg
        end else if (ready) begin
            data_out_reg <= data_out_wire;  // Update data_out_reg with data_out_wire when ready is high
        end
    end

endmodule