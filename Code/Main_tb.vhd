library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Main_tb is
end entity Main_tb;

architecture behavior of Main_tb is
    -- Component Declarations for the Unit Under Test (UUT)
    component Main is
        Port (
            clk          : in std_logic;                      -- Clock signal
            reset        : in std_logic;                      -- Reset signal
            input_text   : in std_logic_vector(7 downto 0);   -- Text input (ASCII)
            input_valid  : in std_logic;                      -- Input validity signal
            matrix_out   : out std_logic_vector(63 downto 0)  -- Output to LED matrix
        );
    end component;

    -- Signals to connect to UUT
    signal clk          : std_logic := '0';
    signal reset        : std_logic := '0';
    signal input_text   : std_logic_vector(7 downto 0) := (others => '0');
    signal input_valid  : std_logic := '0';
    signal matrix_out   : std_logic_vector(63 downto 0);

    -- Clock period definition
    constant clk_period : time := 10 ns;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: Main
        Port map (
            clk => clk,
            reset => reset,
            input_text => input_text,
            input_valid => input_valid,
            matrix_out => matrix_out
        );

    -- Clock generation
    clk_process : process
    begin
        clk <= '0';
        wait for clk_period / 2;
        clk <= '1';
        wait for clk_period / 2;
    end process;

    -- Stimulus process to apply input signals to UUT
    stimulus_process: process
    begin
        -- Apply reset
        reset <= '1';
        wait for 20 ns;
        reset <= '0';
        wait for 20 ns;

        -- Test input text processing
        -- Input first character ('A' = 65 in ASCII)
        input_valid <= '1';
        wait for clk_period;
        input_text <= "01000001"; -- 'A' in ASCII
        wait for clk_period;
        input_valid <= '0';
        wait for 200 ns;
        
        

        reset <= '1';
        wait for 20 ns;
        reset <= '0';
        wait for 20 ns;
        -- Input second character ('B' = 66 in ASCII)
        input_valid <= '1';
        wait for clk_period;
        input_text <= "01000010"; -- 'B' in ASCII
        wait for clk_period;
        input_valid <= '0';
        wait for 200 ns;

        reset <= '1';
        wait for 20 ns;
        reset <= '0';
        wait for 20 ns;
        -- Input third character ('C' = 67 in ASCII)
        input_valid <= '1';
        wait for clk_period;
        input_text <= "01000011"; -- 'C' in ASCII
        wait for clk_period;
        input_valid <= '0';
        wait for 200 ns;

        -- Check the matrix output (simulate end of input)
        -- Wait a few more clock cycles to ensure data is processed
        wait for 1000 ns;

        -- Finish the simulation
        assert false report "End of Testbench" severity failure;
    end process;

end architecture behavior;
