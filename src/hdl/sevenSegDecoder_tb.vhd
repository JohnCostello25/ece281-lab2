library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sevenSegDecoder_tb is
end sevenSegDecoder_tb;

architecture test_bench of sevenSegDecoder_tb is

    component sevenSegDecoder is 
        port (
                i_D : in STD_LOGIC_VECTOR (3 downto 0);
                o_S : out STD_LOGIC_VECTOR (6 downto 0)
                );
    end component;
    
    signal i_Ds : STD_LOGIC_VECTOR (3 downto 0):= (others=> '0');
    signal o_Ss : STD_LOGIC_VECTOR (6 downto 0):= (others=> '0');

begin
    sevenSegDecoder_inst : sevenSegDecoder port map (
        i_D => i_Ds,
        o_S => o_Ss
        
    );
    
    
    test_process : process
    begin
    
    i_Ds <= "0000"; wait for 10 ns;
        assert o_Ss = "1000000" report "bad 0x40" severity failure;
    i_Ds <= "0001"; wait for 10 ns;
        assert o_Ss = "1111001" report "bad 0x79" severity failure;
    i_Ds <= "0010"; wait for 10 ns;
        assert o_Ss = "0100100" report "bad 0x24" severity failure;
    i_Ds <= "0011"; wait for 10 ns;
        assert o_Ss = "0110000" report "bad 0x30" severity failure;
    i_Ds <= "0100"; wait for 10 ns;
        assert o_Ss = "0011001" report "bad 0x19" severity failure;
    i_Ds <= "0101"; wait for 10 ns;
        assert o_Ss = "0010010" report "bad 0x12" severity failure;
    i_Ds <= "0110"; wait for 10 ns;
        assert o_Ss = "0000010" report "bad 0x02" severity failure;
    i_Ds <= "0111"; wait for 10 ns;
        assert o_Ss = "1111000" report "bad 0x78" severity failure;
    i_Ds <= "1000"; wait for 10 ns;
        assert o_Ss = "0000000" report "bad 0x00" severity failure;
    i_Ds <= "1001"; wait for 10 ns;
        assert o_Ss = "0011000" report "bad 0x18" severity failure;
    i_Ds <= "1010"; wait for 10 ns;
        assert o_Ss = "0001000" report "bad 0x08" severity failure;
    i_Ds <= "1011"; wait for 10 ns;
        assert o_Ss = "0000011" report "bad 0x03" severity failure;
    i_Ds <= "1100"; wait for 10 ns;
        assert o_Ss = "0100111" report "bad 0x27" severity failure;
    i_Ds <= "1101"; wait for 10 ns;
        assert o_Ss = "0100001" report "bad 0x21" severity failure;
    i_Ds <= "1110"; wait for 10 ns;
        assert o_Ss = "0000110" report "bad 0x06" severity failure;
    i_Ds <= "1111"; wait for 10 ns;
        assert o_Ss = "0001110" report "bad 0x0E" severity failure;
    
    wait;
    end process;
    
end test_bench;
