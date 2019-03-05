----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/02/2019 06:11:24 PM
-- Design Name: 
-- Module Name: ripple_adder - structural
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

entity ripple_adder is
  Port (
        A, B: in std_logic_vector(3 downto 0);
        Cin: in std_logic;
        S: out std_logic_vector(3 downto 0);
        Co: out std_logic
   );
end ripple_adder;

architecture structural of ripple_adder is
-- component declaration
component adder is
Port (
        A, B, Cin : in std_logic;
        S, Cout: out std_logic
   );
 end component;
 -- intermediate signals declaration
 signal 
 C1,C2,C3: std_logic;
 
begin
Adder0: adder port map(
        A => A(0),
        B => B(0),
        Cin => Cin,
        Cout => C1, 
        S => S(0));
                
Adder1: adder port map(
        A => A(1),
        B => B(1),
        Cin => C1,
        Cout => C2,
        S => S(1));  

Adder2: adder port map(
        A => A(2),
        B => B(2),
        Cin => C2,
        Cout => C3,
        S => S(2));  

Adder3: adder port map(
        A => A(3),
        B => B(3),
        Cin => C3,
        Cout => Co,
        S => S(3));  

end structural;
