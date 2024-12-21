`timescale 1ps/1ps
module ps2_keyboard(
    input clk,
    input clrn,
    input ps2_clk,
    input ps2_data,

    output reg [7:0] data_out,
    output reg ready
);

    reg [8:0] buffer;
    reg [3:0] count;
    reg [2:0] ps2_clk_sync;
    reg start;
    always @(posedge clk) begin
        ps2_clk_sync <= {ps2_clk_sync[1:0], ps2_clk};
    end

    wire sampling = ps2_clk_sync[2] & ~ps2_clk_sync[1];

    always @(posedge clk) begin
        if(clrn == 0) begin
            buffer <= 9'd0;
            count <= 4'd0;
            ready <= 0;
            start <= 0;
        end else begin
            if(ps2_data==0) begin
                start <= 1;
            end
            if(start) begin
                if (sampling)begin
                    if(count==4'd10) begin
                        if((ps2_data)&&
                            ~(^buffer[8:0]))begin
                                data_out <= buffer[8:1];
                                ready <= 1;
                            end
                        count <= 4'd0;
                        start <= 0;
                    end else begin
                        buffer[8-count] <= ps2_data;
                        count <= count + 1;
                        ready <= 0;
                    end
                end
            end
        end
    end


endmodule