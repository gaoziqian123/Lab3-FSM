module f1_fsm (
    input   logic       rst,
    input   logic       clk,
    output  logic [7:0] data_out
);
    typedef enum logic [3:0] {s0, s1, s2, s3, s4, s5, s6, s7, s8} my_state;
    my_state current_state;
    wire en;
clktick instance1(  .clk(clk),
                    .rst(rst),
                    .en(1),
                    .N(40),
                    .tick(en)
                    );
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            current_state <= s0;
            data_out <= 8'b0;
        end else if (en) begin
            case (current_state)
                s0: begin
                    current_state <= s1;
                    data_out <= 8'b00000001;
                end
                s1: begin
                    current_state <= s2;
                    data_out <= 8'b00000011;
                end
                s2: begin
                    current_state <= s3;
                    data_out <= 8'b00000111;
                end
                s3: begin
                    current_state <= s4;
                    data_out <= 8'b00001111;
                end
                s4: begin
                    current_state <= s5;
                    data_out <= 8'b00011111;
                end
                s5: begin
                    current_state <= s6;
                    data_out <= 8'b00111111;
                end
                s6: begin
                    current_state <= s7;
                    data_out <= 8'b01111111;
                end
                s7: begin
                    current_state <= s8;
                    data_out <= 8'b11111111;
                end
                s8: begin
                    current_state <= s0;
                    data_out <= 8'b00000000;
                end
                default: begin
                    current_state <= s0;
                    data_out <= 8'b00000000;
                end
            endcase
        end
    end
endmodule
