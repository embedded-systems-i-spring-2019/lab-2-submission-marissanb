----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/02/2019 06:33:17 PM
-- Design Name: 
-- Module Name: ripple_adder_tb - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ripple_adder_tb is
--  Port ( );
end ripple_adder_tb;

architecture testbench of ripple_adder_tb is
--intermediate signal declarations
signal A_tb, B_tb: std_logic_vector(3 downto 0);
signal Cin_tb, Cout_tb: std_logic;
signal S_tb: std_logic_vector(3 downto 0);

-- component declaration
component ripple_adder is
  Port (
        A, B: in std_logic_vector(3 downto 0);
        Cin: in std_logic;
        S: out std_logic_vector(3 downto 0);
        Co: out std_logic
   );
end component;

begin

dut: ripple_adder
port map(
        A => A_tb,
        B => B_tb,
        Cin => Cin_tb,
        Co => Cout_tb,
        S => S_tb);

    sim: process
    begin
        wait for 10 ns;
        A_tb <= "1010";
        B_tb <= "0010";
        Cin_tb <= '0';
        wait for 10 ns;
        A_tb <= "0010";
        B_tb <= "1000";
        Cin_tb <= '1';
        wait for 10 ns;
        A_tb <= "0101";
        B_tb <= "1100";
        Cin_tb <= '1';
     end process sim;
        

end testbench;
