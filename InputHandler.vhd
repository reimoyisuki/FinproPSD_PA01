library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity InputHandler is
    Port (
        clk          : in std_logic;
        reset        : in std_logic;
        input_text   : in std_logic_vector(7 downto 0); -- Karakter teks input
        input_valid  : in std_logic;                   -- Sinyal validitas input
        output_text  : out std_logic_vector(7 downto 0); -- Karakter output
        next_request : in std_logic;                    -- Permintaan karakter berikutnya
        char_ready   : out std_logic
    );
end InputHandler;

architecture Behavioral of InputHandler is
    -- Mendefinisikan state
    type state_type is (Idle, Receive, WaitTranslate, Output);
    signal state: state_type := Idle;

    -- Memori internal untuk menyimpan teks input
    type text_memory_type is array (0 to 15) of std_logic_vector(7 downto 0);
    signal text_memory: text_memory_type := (others => (others => '0'));

    -- Indeks karakter saat ini
    signal char_index: integer range 0 to 15 := 0;
    signal char_count: integer range 0 to 15 := 0; -- Menyimpan jumlah total karakter yang telah dibaca

begin
    process (clk, reset)
    begin
        if reset = '1' then
            -- Reset semua sinyal
            state <= Idle;
            char_index <= 0;
            char_count <= 0;
            output_text <= (others => '0');
            text_memory <= (others => (others => '0'));
        elsif rising_edge(clk) then
            case state is
                when Idle =>
                    if input_valid = '1' then
                        state <= Receive;
                        char_index <= 0;
                        char_count <= 0; -- Reset jumlah karakter untuk input baru
                    end if;

                when Receive =>
                    -- Menyimpan karakter input ke dalam memori teks
                    text_memory(char_count) <= input_text;
                    char_count <= char_count + 1;

                    -- Beralih ke WaitTranslate jika `input_valid` tidak aktif
                    if input_valid = '0' or char_count = 15 then
                        state <= WaitTranslate;
                        char_index <= 0; -- Persiapan untuk output
                    end if;

                when WaitTranslate =>
                    -- Menunggu translator meminta karakter berikutnya
                    char_ready <= '1';
                    if next_request = '1' then
                        state <= Output;
                    end if;

                when Output =>
                    -- Mengirimkan karakter saat ini ke output
                    char_ready <= '0';
                    output_text <= text_memory(char_index);

                    if char_index = char_count - 1 then
                        char_index <= 0; -- Reset indeks untuk siklus berikutnya
                    else
                        char_index <= char_index + 1;
                    end if;

                    state <= WaitTranslate;
            end case;
        end if;
    end process;
end Behavioral;
