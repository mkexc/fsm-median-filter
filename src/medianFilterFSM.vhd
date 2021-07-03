library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity medianFilterFSM is
    port(
        clk,rst,X: in std_logic;
        Z: out std_logic
    );
end medianFilterFSM;

architecture Moore of medianFilterFSM is
    type stateType is (S_init,S_i0,S_i1,S_00,S_01,S_10,S_11);
    signal currState,nextState : stateType;
begin

    regs:process(clk,rst)
    begin
        if(rst='1') then
            currState<=S_init;
        elsif (rising_edge(clk)) then
            currState<=nextState;
        end if;
    end process regs;
    
    comb: process(currState,X) 
    begin
    Z<='0';
        case currState is
            when S_init =>  if(X='0') then
                                nextState<=S_i0;
                            else 
                                nextState<=S_i1;
                            end if;
            when S_i0 =>  if(X='0') then
                                nextState<=S_00;
                            else 
                                nextState<=S_01;
                            end if;
            when S_i1 =>  if(X='0') then
                                nextState<=S_10;
                            else 
                                nextState<=S_11;
                            end if;
                            
            when S_00 =>  if(X='0') then
                                nextState<=S_00;
                            else 
                                nextState<=S_01;
                            end if;
            when S_01 =>  if(X='0') then
                                nextState<=S_10;
                            else 
                                nextState<=S_11;
                            end if;
            when S_10 =>  if(X='0') then
                                nextState<=S_00;
                            else 
                                nextState<=S_11;
                            end if;
                            Z<='1';
            when S_11 =>  if(X='0') then
                                nextState<=S_10;
                            else 
                                nextState<=S_11;
                            end if;
                          Z<='1';
            
            when others => nextState<=S_init;
        end case;
    end process comb;

end Moore;
