----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/03/2019 01:19:14 PM
-- Design Name: 
-- Module Name: my_alu - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity my_alu is
  Port (
        clk: in std_logic;
        A, B: in std_logic_vector(3 downto 0);
        Opcode: in std_logic_vector(3 downto 0);
        F: out std_logic_vector(3 downto 0)
   );
end my_alu;

architecture Behavioral of my_alu is
signal Funct: unsigned(3 downto 0):= (others => '0');
begin

alu: process (clk)
begin
    if rising_edge(clk) then
        case Opcode is
            when "0000" => Funct <= unsigned(A) + unsigned(B);
                            F <= std_logic_vector(Funct);
            when "0001" => Funct <= unsigned(A) - unsigned(B);
                            F <= std_logic_vector(Funct);
            when "0010" => Funct <= unsigned(A) + 1;
                            F <= std_logic_vector(Funct);
            when "0011" => Funct <= unsigned(A) - 1;
                            F <= std_logic_vector(Funct);
            when "0100" => Funct <= 0 - unsigned(A);
                            F <= std_logic_vector(Funct);
            when "0101" => if (unsigned(A) > unsigned(B)) then
                                Funct <= "0001";
                            else
                                Funct <= "0000";
                            end if;
                            F <= std_logic_vector(Funct);
            when "0110" => F <= A(2 downto 0) & '0';
            when "0111" => F <= '0' & A(3 downto 1);
            when "1000" => F <= A(3) & A(3 downto 1);
            when "1001" => F <= NOT(A);
            when "1010" => F <= A AND B;
            when "1011" => F <= A OR B;
            when "1100" => F <= A XOR B;
            when "1101" => F <= A XNOR B;
            when "1110" => F <= A NAND B;
            when "1111" => F <= A NOR B;
            when others => F <= (others => '0');
        end case;
      
   end if;
 end process alu;

end Behavioral;
