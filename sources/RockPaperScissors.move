address 0x6c3cd4e47196d6fa5334d66f11599436d1aac2dfa58ccc911ba97111ffd4c208 {

    module RockPaperScissors {
        use std::signer;
        use aptos_framework::randomness;
        use aptos_framework::timestamp;
        use aptos_framework::vector;

        const ROCK: u8 = 1;
        const PAPER: u8 = 2;
        const SCISSORS: u8 = 3;

        struct GameRound has store, drop {
            player_move: u8,   
            computer_move: u8,
            result: u8,
            timestamp: u64,
        }

        struct GameHistory has key {
            player: address,
            rounds: vector<GameRound>,
        }

        public entry fun initialize_game(account: &signer) {
            let player = signer::address_of(account);
            if (!exists<GameHistory>(player)) {
                move_to(account, GameHistory {
                    player,
                    rounds: vector::empty<GameRound>(),
                });
            }
        }

        #[randomness]
        public(friend) entry fun play_game(account: &signer, player_move: u8) acquires GameHistory {
            let player = signer::address_of(account);
            
            // Ensure the game is initialized for this player
            if (!exists<GameHistory>(player)) {
                initialize_game(account);
            };

            let game_history = borrow_global_mut<GameHistory>(player);
            
            // Generate computer's move
            let computer_move = randomness::u8_range(1, 4);
            
            // Determine the winner
            let result = determine_winner(player_move, computer_move);

            // Create a new game round
            let new_round = GameRound {
                player_move,
                computer_move,
                result,
                timestamp: timestamp::now_microseconds(),
            };

            // Add the new round to the player's game history
            vector::push_back(&mut game_history.rounds, new_round);
        }

        fun determine_winner(player_move: u8, computer_move: u8): u8 {
            if (player_move == ROCK && computer_move == SCISSORS) {
                2 // player wins
            } else if (player_move == PAPER && computer_move == ROCK) {
                2 // player wins
            } else if (player_move == SCISSORS && computer_move == PAPER) {
                2 // player wins
            } else if (player_move == computer_move) {
                1 // draw
            } else {
                3 // computer wins
            }
        }

        #[view]
        public fun get_latest_game(account_addr: address): (u8, u8, u8, u64) acquires GameHistory {
            let game_history = borrow_global<GameHistory>(account_addr);
            let latest_round = vector::borrow(& game_history.rounds, vector::length(& game_history.rounds) - 1);
            (latest_round.player_move, latest_round.computer_move, latest_round.result, latest_round.timestamp)
        }

        #[view]
        public fun get_game_count(account_addr: address): u64 acquires GameHistory {
            let game_history = borrow_global<GameHistory>(account_addr);
            vector::length(& game_history.rounds)
        }

        #[view]
        public fun get_game_at_index(account_addr: address, index: u64): (u8, u8, u8, u64) acquires GameHistory {
            let game_history = borrow_global<GameHistory>(account_addr);
            let round = vector::borrow(& game_history.rounds, index);
            (round.player_move, round.computer_move, round.result, round.timestamp)
        }
    }

}
