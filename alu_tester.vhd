----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/03/2019 02:32:05 PM
-- Design Name: 
-- Module Name: alu_tester - Behavioral
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

entity alu_tester is
  Port ( 
        clk: in std_logic;
        btn: in std_logic_vector(3 downto 0);
        sw: in std_logic_vector(3 downto 0);
        led: out std_logic_vector(3 downto 0)
  );
end alu_tester;

architecture Behavioral of alu_tester is
-- component declaration
component debounce is
 Port ( 
        btn: in std_logic;
        clk: in std_logic;
        dbnc: out std_logic
  );
end component;

component my_alu is
 Port (
        clk: in std_logic;
        A, B: in std_logic_vector(3 downto 0);
        Opcode: in std_logic_vector(3 downto 0);
        F: out std_logic_vector(3 downto 0)
   );
end component;
-- intermediate signals
signal dbnc0, dbnc1, dbnc2, dbnc3 : std_logic;
signal sw0, sw1, sw2, sw3: std_logic_vector(3 downto 0);
signal F_out: std_logic_vector(3 downto 0);

begin
b0: debounce port map(
    clk => clk,
    btn => btn(0),
    dbnc => dbnc0);
 b1: debounce port map(
    clk => clk,
    btn => btn(1),
    dbnc => dbnc1);
b2: debounce port map(
    clk => clk,
    btn => btn(2),
    dbnc => dbnc2);
b3: debounce port map(
    clk => clk,
    btn => btn(3),
    dbnc => dbnc3);   
alu: my_alu port map(
    clk => clk,
    A => sw1,
    B => sw0,
    Opcode => sw2,
    F => led);

process (clk)
    begin
    if rising_edge(clk) then
        if dbnc0 = '1' then
            sw0 <= sw;
        elsif dbnc1 = '1' then
            sw1 <= sw;
        elsif dbnc2 = '1' then
            sw2 <= sw;
        elsif dbnc3 = '1' then
            sw0 <= (others => '0');
            sw1 <= (others => '0');
            sw2 <= (others => '0');
        end if;
    end if;

end process;
end Behavioral;
