module keyboard_tb();

    reg clk;
    reg clrn;
    reg ps2_clk;
    reg ps2_data;

    wire [7:0] data_out;
    wire ready;

    ps2_keyboard uut(
       .clk(clk),
       .clrn(clrn),
       .ps2_clk(ps2_clk),
       .ps2_data(ps2_data),
       .data_out(data_out),
       .ready(ready)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end 
    initial begin
        clrn = 0;
        #10 clrn = 1;
    end
    initial begin
        ps2_clk = 0;
        forever #10 ps2_clk = ~ps2_clk;
    end

    initial begin
        ps2_data = 1;
        #200;
        #20 ps2_data = 0;

        #20 ps2_data = 0;
        #20 ps2_data = 0;
        #20 ps2_data = 0;
        #20 ps2_data = 1;
        #20 ps2_data = 1;
        #20 ps2_data = 1;
        #20 ps2_data = 0;
        #20 ps2_data = 0;

        #20 ps2_data = 1;
        #20 ps2_data = 1;
        
        #20 ps2_data = 1;
        #20 ps2_data = 0;

        #20 ps2_data = 1;
        #20 ps2_data = 1;
        #20 ps2_data = 1;
        #20 ps2_data = 1;
        #20 ps2_data = 0;
        #20 ps2_data = 0;
        #20 ps2_data = 0;
        #20 ps2_data = 0;

        #20 ps2_data = 0;
        #20 ps2_data = 1;

        #20 ps2_data = 1;
        #20 ps2_data = 0;

        #20 ps2_data = 0;
        #20 ps2_data = 0;
        #20 ps2_data = 0;
        #20 ps2_data = 1;
        #20 ps2_data = 1;
        #20 ps2_data = 1;
        #20 ps2_data = 0;
        #20 ps2_data = 0;

        #20 ps2_data = 1;
        #20 ps2_data = 1;
    end

    initial begin
        #100000 $finish;
    end


endmodule