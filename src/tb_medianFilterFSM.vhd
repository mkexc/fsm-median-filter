library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_medianFilterFSM is
end tb_medianFilterFSM;

architecture Behavioral of tb_medianFilterFSM is
    component medianFilterFSM is
    port(
        clk,rst,X: in std_logic;
        Z: out std_logic
    );
    end component medianFilterFSM;
    
    signal clk_s,rst_s,X_s,Z_s: std_logic;
    constant clkper: time := 10 ns;
begin
    
    dut: medianFilterFSM port map (clk=>clk_s,rst=>rst_s,X=>X_s,Z=>Z_s);
    
    process
    begin
        clk_s<='0';
        wait for clkper/2;
        clk_s<='1';
        wait for clkper/2;
    end process;
    
    process
    begin
        rst_s<='1';
        wait for clkper;
        rst_s<='0'; X_s<='0';
        wait for clkper;
        X_s<='1';
        wait for clkper;
        X_s<='0';
        wait for clkper;
        X_s<='0';
        wait for clkper;
        X_s<='1';
        wait for clkper;
        X_s<='0';
        wait for clkper;
        X_s<='1';
        wait for clkper;
        X_s<='0';
        wait for clkper;
        X_s<='1';
        wait for clkper;
        X_s<='1';
        wait for clkper;
        X_s<='1';
        wait for clkper;
        X_s<='0';
        wait for clkper;
        X_s<='1';
        wait for clkper;
        X_s<='0';
        wait for clkper;
        X_s<='0';
        wait for clkper;
        X_s<='1';
        wait for clkper;
        wait;
    end process;

end Behavioral;
